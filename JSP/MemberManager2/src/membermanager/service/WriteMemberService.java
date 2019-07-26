package membermanager.service;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import jdbc.ConnectionProvider;
import membermanager.dao.MemberDao;
import membermanager.model.MemberInfo;

public class WriteMemberService implements MemberManagerService {

	
//	public int write(MemberInfo member) {
//		
//		int rCnt = 0;
//		
//		Connection conn = null;
//		
//		try {
//			conn = ConnectionProvider.getConnection();
//			
//			MemberDao dao = MemberDao.getInstance();
//			
//			rCnt = dao.insert(conn, member);
//			
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//				
//		
//		return rCnt;
//		
//	}
	
	
	
	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		
		String viewName = "/WEB-INF/view/writeMember.jsp";
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		//String uId = request.getParameter("uId");
		//String uPw = request.getParameter("uPw");
		//String uName = request.getParameter("uName");
		
		//MemberInfo member = new MemberInfo(uId, uPw, uName, uPhoto);
		
		MemberInfo member = new MemberInfo();
		
		String uploadURI = "/uploadfile";
		
		// 시스템의 절대 경로
		String dir = request.getSession().getServletContext().getRealPath(uploadURI);
		
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);

		DiskFileItemFactory factory = new DiskFileItemFactory();

		ServletFileUpload upload = new ServletFileUpload(factory);
		
		// FileItem <- 폼 페이지에서 전송한 데이터들 , uName, sNumber, report
		List<FileItem> items;
		try {
			items = upload.parseRequest(request);
			Iterator<FileItem> itr = items.iterator();
			
			while(itr.hasNext()) {
				
				FileItem fileItem = itr.next();
				
				// 일반 폼 또는 파일
				if(fileItem.isFormField()) {
					
					if(fileItem.getFieldName().contentEquals("uId")) {
						member.setuId(fileItem.getString("utf-8"));
					}
					if(fileItem.getFieldName().contentEquals("uPw")) {
						member.setuPw(fileItem.getString("utf-8"));
					}
					if(fileItem.getFieldName().contentEquals("uName")) {
						member.setuName(fileItem.getString("utf-8"));
					}
					
				} else {
					
					if(fileItem.getFieldName().equals("uPhoto")) {
						// 새로운 저장 파일 이름
						String newFileName = "user_" + System.nanoTime();
						// 지정된 폴더에 파일 쓰기
						fileItem.write(new File(dir, newFileName));
						member.setuPhoto(newFileName);
					}
				}
			}
			
		} catch (FileUploadException | UnsupportedEncodingException e1) {
			e1.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		MemberDao dao = MemberDao.getInstance();
		
		Connection conn = null;
		
		int resultCnt = 0;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			resultCnt = dao.insert(conn, member);
			
			jdbc.jdbcUtil.close(conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("resultCnt", resultCnt);
		
		
		return viewName;
	}

	
	
	
	
}
