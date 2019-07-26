package membermanager.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import membermanager.dao.MemberDao;
import membermanager.model.LoginInfo;
import membermanager.model.MemberInfo;

public class LoginMemberService implements MemberManagerService {

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		
		String viewName = "/WEB-INF/view/loginMember.jsp";
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String uId = request.getParameter("uId");
		String uPw = request.getParameter("uPw");
		
		MemberInfo chk = null;
		
		MemberDao dao = MemberDao.getInstance();
		
		Connection conn = null;
		
		int resultCnt = 0;
		
		chk = dao.loginCheck(conn, uId, uPw);
		
		if(chk.getuId().equals(uId) && chk.getuPw().equals(uPw)) {
			
		} else {
			try {
				response.sendRedirect("/");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
		
		return viewName;
	}

	 
}
