package guestbook.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteFormService implements GuestBookService {

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		
		String viewPage= "/WEB-INF/view/confirmDeletion.jsp";
		
		// param 으로 대체가 가능
		// String id = request.getParameter("messageId");
		// request.setAttribute("messageId", id);
		
		return viewPage;
	}

	 
}
