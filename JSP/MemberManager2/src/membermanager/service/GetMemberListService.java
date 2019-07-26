package membermanager.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.ConnectionProvider;
import membermanager.dao.MemberDao;
import membermanager.model.MemberInfo;
import membermanager.model.MemberListView;

public class GetMemberListService implements MemberManagerService {

	
	// 1. 한페이지에 보여줄 게시글의 개수
	private static final int MEMBER_COUNT_PER_PAGE = 3;
	
	public MemberListView getMemberListView(int pageNumber) {
		
		// 2. 현재 페이지 번호
		int currentPageNumber = pageNumber;
		
		Connection conn;
		
		MemberListView view = null;
		
		try {
			// Connection
			conn = ConnectionProvider.getConnection();
			
			// DAO
			MemberDao dao = MemberDao.getInstance();
			
			// 전체 게시물의 개수
			int memberTotalCount = dao.selectCount(conn);
			
			// 게시물 내용 리스트, DB 검색에 사용할 start_row, end_row
			List<MemberInfo> memberList = null;
			int firstRow = 0;
			int endRow = 0;
			
			
			if(memberTotalCount > 0 ) {
	            firstRow = (pageNumber - 1) * MEMBER_COUNT_PER_PAGE ;
	            endRow = MEMBER_COUNT_PER_PAGE ;
	            memberList = dao.selectList(conn, firstRow, endRow);
	                  
	         } else {
	            currentPageNumber = 0;
	            memberList = Collections.emptyList();
	         }
			
			/*
			 * if(messageTotalCount > 0) {
			 * 
			 * firstRow = (pageNumber-1)*MESSAGE_COUNT_PER_PAGE + 1; 
			 * endRow = firstRow + MESSAGE_COUNT_PER_PAGE - 1;
			 * messageList = dao.selectList(conn, firstRow, endRow);
			 * 
			 * } else { currentPageNumber = 0; messageList = Collections.emptyList(); }
			 */
			
			view = new MemberListView(memberTotalCount, 
										currentPageNumber, 
										memberList, 
										MEMBER_COUNT_PER_PAGE, 
										firstRow, 
										endRow);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return view;
	}

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		
		String viewName = "/WEB-INF/view/list.jsp";
		
		// 사용자의 요청 받기
		int pageNumber = 1;
		
		String pageNo = request.getParameter("page");
		if(pageNo != null) {
			pageNumber = Integer.parseInt(pageNo);
		}
		
		MemberListView viewData = getMemberListView(pageNumber);
		
		request.setAttribute("viewData", viewData);
		
		return viewName;
	}
}
