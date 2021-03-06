package guestbook.service;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guestbook.dao.MessageDao;
import guestbook.model.Message;
import jdbc.ConnectionProvider;

public class WriteMessageService implements GuestBookService {

	/*
	 * // 만들어진 인스턴스 값을 외부에서 바꾸지 못하도록 private private static WriteMessageService
	 * service = new WriteMessageService();
	 * 
	 * // getInstance 클래스 메서드를 통해 service 인스턴스 하나만 받을 수 있음 public static
	 * WriteMessageService getInstance() { return service; }
	 * 
	 * // 생성자 제한 private WriteMessageService() {}
	 */
	
	public int write(Message message) {
		
		int rCnt = 0;
		
		// 1. Connection 생성
		// 2. dao 생성
		// 3. insert 메서드 실행
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			MessageDao dao = MessageDao.getInstance();
			
			rCnt = dao.insert(conn, message);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rCnt;
	}

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		
		// 응답 view 지정
		String viewName = "/WEB-INF/view/writeMessage.jsp";
		
		// 응답 view 로 전달할 결과 데이터
		// 데이터베이스에 데이터 저장
		// 데이터를 받기.
		
		// 1. 사용자 입력데이터 받기
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String guestName = request.getParameter("guestName");
		String password = request.getParameter("password");
		String msg = request.getParameter("message");
		
		// 2. Message 객체 생성
		
		Message message = new Message(0, guestName, password, msg);
		
		// 3. Dao 생성, Connection 생성
		MessageDao dao = MessageDao.getInstance();
		
		Connection conn = null;
		
		int resultCnt = 0;
		
		try {
			conn = ConnectionProvider.getConnection();
			// 4. insert 메서드 실행
			resultCnt = dao.insert(conn, message);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 5. 결과 데이터를 request 속성에 저장
		request.setAttribute("resultCnt", resultCnt);
		
		
		
		return viewName;
	}
	
	
	
	
}
