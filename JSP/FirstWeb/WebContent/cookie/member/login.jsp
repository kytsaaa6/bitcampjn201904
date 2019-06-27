<%@ page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CookieBox cBox = new CookieBox(request);

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String setId = request.getParameter("setId");
	
	boolean chk = false;
	
	if(id.equals(pw)){
		// 쿠키 생성 : 사용자 데이터를 저장
		Cookie c1 = CookieBox.createCookie("LOGIN", "SUCCESS", -1);
		response.addCookie(c1);
/* 		Cookie c2 = CookieBox.createCookie("ID", id, -1);
		response.addCookie(c2); */
		
		chk = true;
	}
	if(id != null && pw != null && id.length() > 1 && setId.equals("set")) {
			Cookie idSet = CookieBox.createCookie("ID", id, -1);
			response.addCookie(idSet);
			Cookie pwSet = CookieBox.createCookie("PW", pw, -1);
			response.addCookie(pwSet);
			String checked = "checked";
			out.print("자동 저장 완료");
			
			
	} 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>

</style>
</head>
<body>

	<%
		if(chk) {
			out.println("<h1>로그인 되었습니다.</h1>");
			out.println("<a href=\"loginCheck.jsp\">loginCheck</a>");
		} else {
			Cookie idSet = CookieBox.createCookie("ID", "", -1);
			response.addCookie(idSet);
			Cookie pwSet = CookieBox.createCookie("PW", "", -1);
			response.addCookie(pwSet);
			out.println("<script>alert(\'로그인 실패\'); history.go(-1); </script>");
		}
	%>

	<a href="loginForm.jsp">로그인 페이지로 이동</a>
</body>
</html>