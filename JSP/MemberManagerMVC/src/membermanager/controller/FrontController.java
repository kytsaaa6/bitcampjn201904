package membermanager.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import membermanager.service.MemberService;


/*
 1. MVC 패턴 : 어떤 컨테이너를 호출해 어떤 모델(Model)을 어떻게 보이도록(View) 할 것인가를 조정(Control)하는 컨트롤러(Controller)
 - Model + View + Controller
 - 클라이언트 요청 -> Controller(Servlet) <-> Model(Service, DAO)
 	VIEW JSP   <-

 2-1 Request 
 - 클라이언트가 요청할 때 함께 전송한 데이터
 - URL 파라미터, form에서 전송한 데이터 ..
 2-2 Response 
 - 서버에서 클라이언트로 응답 할 때 필요한 데이터
 - 응답 결과 상태코드, 클라이언트가 요청한 HTML 문서 ..
*/

// 클라이언트의 모든 요청에 대해 Controller 실행
@WebServlet(
		urlPatterns = { "*.do" }, 
		initParams = { 
				// Servlet의 초기 파라미터 설정
				@WebInitParam(name = "config", value = "/WEB-INF/commandService.properties")
		})
public class FrontController extends HttpServlet {
	
	
	// Key 타입 : String, Value 타입 : GuestBookService - View 전달
	private Map<String, MemberService> commands = new HashMap<String, MemberService>();
       
	// 클라이언트로부터 최초 요청시 단 한번 초기화되며 생성
	// 서블릿 객체 생성 후 초기화시에 init() 메서드를 호출하는데 이 과정을 서블릿 로딩
	public void init(ServletConfig config) throws ServletException {
		
		// 초기 파라미터값 저장
		String configfile = config.getInitParameter("config");

		// 외부의 설정 파일을 쉽게 읽기위해 프로퍼티 객체 사용
		// commandService.properties
		// 키, 값 모두 문자열 형식
		Properties prop = new Properties();
		
		FileInputStream fis = null;
		
		// 프로퍼티파일에 매핑한 경로
		// /guest/[properties=]
		String configFilePath = config.getServletContext().getRealPath(configfile);
	
		try {
			fis = new FileInputStream(configFilePath);
			prop.load(fis);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// keySet() - Map의 Key값만 필요할때 사용
		// entrySet() - Map의 key와 value 모두 필요할때 사용
		Iterator itr = prop.keySet().iterator();
		
		// Map에 저장된 key,value 값을 호출
		while(itr.hasNext()) {
			String command = (String)itr.next(); // 사용자 요청 URI
			String serviceClassName = prop.getProperty(command); // 서비스 클래스 이름
			
			
			try {
				Class serviceClass = Class.forName(serviceClassName);
				// 객체 생성
				MemberService service = (MemberService) serviceClass.newInstance();
			
				// commands Map 에 저장 <String, GuestBookService>
				commands.put(command, service);
				
				// prop 에 있는 클래스 이름으로 인스턴스 생성
				
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}


	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 사용자 요청 분석
		String commandUri = request.getRequestURI(); // /guest/guestWriteForm
		
		if(commandUri.indexOf(request.getContextPath()) == 0) {
			commandUri = commandUri.substring(request.getContextPath().length());
		}
		
		System.out.println(commandUri);
		
		request.setCharacterEncoding("UTF-8");
		
		// 2. 사용자 요청에 맞는 모델 실행 ( 서비스.메서드 실행 ) -> view 페이지 반환
		
		String viewPage = "/WEB-INF/view/null.jsp";
		
		MemberService service = commands.get(commandUri); // null 값을 반환하기도 한다.
		if( service != null ) {
			viewPage = service.getViewName(request, response);
		}
	
		// 3. view 로 포워딩
	
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}

	
	
}
