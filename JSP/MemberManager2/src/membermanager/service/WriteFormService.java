package membermanager.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WriteFormService implements MemberManagerService {

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		
		String viewName = "/WEB-INF/view/writeForm.jsp";
		
		return viewName;
	}

	
	
}
