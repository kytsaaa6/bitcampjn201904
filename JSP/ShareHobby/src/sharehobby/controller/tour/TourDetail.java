//package sharehobby.controller.tour;
//
//import java.io.ByteArrayOutputStream;
//import java.io.IOException;
//import java.io.InputStream;
//import java.io.PrintWriter;
//import java.net.URL;
//import java.net.URLEncoder;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.apache.commons.io.IOUtils;
//import org.json.simple.JSONObject;
//
///**
// * Servlet implementation class TourData
// */
//@WebServlet("/tour/tourinfo/TourDetail2.jsp")
//public class TourDetail extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public TourDetail() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // TODO Auto-generated method stub
//        request.setCharacterEncoding("utf-8");
//        response.setContentType("text/html; charset=utf-8");
//
//        String contentid = request.getParameter("contentid");
//        
//        
//		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/RusService/detailCommon?serviceKey=";
//		String serviceKey = "%2BaXZ%2B71EvGvZgAqY9aGBaRswCeT6JCSmfbyw%2F3K0xubpjSDBJ85%2Fy%2Fdlysm4p8hB3ctvQnECLz875rIiHpVABw%3D%3D";
//		String parameter = "";
//		
////        serviceKey = URLEncoder.encode(serviceKey,"utf-8");
//		
//        PrintWriter out = response.getWriter();
//        parameter = parameter + "&" + "contentId=" + contentid;
//        parameter = parameter + "&" + "contentTypeId=76";
//        parameter = parameter + "&" + "defaultYN=Y";
//        parameter = parameter + "&" + "firstImageYN=Y";
//        parameter = parameter + "&" + "areacodeYN=Y";
//        parameter = parameter + "&" + "catcodeYN=Y";
//        parameter = parameter + "&" + "addrinfoYN=Y";
//        parameter = parameter + "&" + "mapinfoYN=Y";
//        parameter = parameter + "&" + "overviewYN=Y";
//        parameter = parameter + "&" + "transGuideYN=Y";
//        parameter = parameter + "&" + "MobileOS=ETC";
//        parameter = parameter + "&" + "MobileApp=Apptest";
//        parameter = parameter + "&" + "_type=json";
//   
//        addr = addr + serviceKey + parameter;
//        URL url = new URL(addr);
//        
//        InputStream in = url.openStream(); 
//        
//		ByteArrayOutputStream bos1 = new ByteArrayOutputStream();
//		
//		// InputStream의 데이터를 바이트 배열로 복사
//		IOUtils.copy(in, bos1);
//		in.close();
//		bos1.close();
//		
//		String mbos = bos1.toString("UTF-8");
//		
//		byte[] b = mbos.getBytes("UTF-8");
//		String s = new String(b, "UTF-8");
//		out.println(s);
//		
//		JSONObject json = new JSONObject();
//		json.put("data", s);
//    }
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response, String contentId) throws ServletException, IOException {
//        request.setCharacterEncoding("utf-8");
//        response.setContentType("text/html; charset=utf-8");
//        
//		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/RusService/detailCommon?serviceKey=";
//		String serviceKey = "%2BaXZ%2B71EvGvZgAqY9aGBaRswCeT6JCSmfbyw%2F3K0xubpjSDBJ85%2Fy%2Fdlysm4p8hB3ctvQnECLz875rIiHpVABw%3D%3D";
//		String parameter = "";
//		
////        serviceKey = URLEncoder.encode(serviceKey,"utf-8");
//		
//        PrintWriter out = response.getWriter();
//        parameter = parameter + "&" + "contentId=" + contentId;
//        parameter = parameter + "&" + "contentTypeId=76";
//        parameter = parameter + "&" + "defaultYN=Y";
//        parameter = parameter + "&" + "firstImageYN=Y";
//        parameter = parameter + "&" + "areacodeYN=Y";
//        parameter = parameter + "&" + "catcodeYN=Y";
//        parameter = parameter + "&" + "addrinfoYN=Y";
//        parameter = parameter + "&" + "mapinfoYN=Y";
//        parameter = parameter + "&" + "overviewYN=Y";
//        parameter = parameter + "&" + "transGuideYN=Y";
//        parameter = parameter + "&" + "MobileOS=ETC";
//        parameter = parameter + "&" + "MobileApp=Apptest";
//        parameter = parameter + "&" + "_type=json";
//   
//        addr = addr + serviceKey + parameter;
//        URL url = new URL(addr);
//        
//        InputStream in = url.openStream(); 
//        
//		ByteArrayOutputStream bos1 = new ByteArrayOutputStream();
//		
//		// InputStream의 데이터를 바이트 배열로 복사
//		IOUtils.copy(in, bos1);
//		in.close();
//		bos1.close();
//		
//		String mbos = bos1.toString("UTF-8");
//		
//		byte[] b = mbos.getBytes("UTF-8");
//		String s = new String(b, "UTF-8");
//		out.println(s);
//		
//		JSONObject json = new JSONObject();
//		json.put("data", s);
//    }
//
//}
