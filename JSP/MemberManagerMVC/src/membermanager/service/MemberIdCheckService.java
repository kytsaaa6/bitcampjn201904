package membermanager.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import membermanager.dao.MemberDao;
import membermanager.model.MemberInfo;

public class MemberIdCheckService implements MemberService {

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		
		Connection conn = null;
		
		MemberDao dao = MemberDao.getInstance();
		
		MemberInfo memberInfo = null;
		
		String resultCode = "N";
		
		try {
			conn = jdbc.ConnectionProvider.getConnection();
			
			memberInfo = dao.selectMemberById(conn, id);
			
			if(memberInfo == null) {
				resultCode = "Y";
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("resultCode", resultCode);
		
		
		return "/WEB-INF/view/member/idcheck.jsp";
	}

	
	
}
