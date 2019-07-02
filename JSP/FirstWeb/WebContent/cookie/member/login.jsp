<%@ page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CookieBox cBox = new CookieBox(request);

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String auto = request.getParameter("auto");
	
	boolean chk = false;
	
	/* 유효성 검사 */
	if (id.equals(pw) && id != null && pw != null && id.length() > 1) {
		// 쿠키 생성 : 사용자 데이터를 저장
		Cookie c1 = CookieBox.createCookie("LOGIN", "SUCCESS", -1);
		response.addCookie(c1);
		Cookie c2 = CookieBox.createCookie("ID", id, -1);
		response.addCookie(c2);

		chk = true;
		
		/* 자동 로그인 체크 여부 */
		if (auto != null && auto.equals("on")) {
			Cookie idSet = CookieBox.createCookie("ID2", id, -1);
			response.addCookie(idSet);
			Cookie pwSet = CookieBox.createCookie("PW2", pw, -1);
			response.addCookie(pwSet);
			out.print("ID/PW 저장 완료");
		} else {
			Cookie idSet = CookieBox.createCookie("ID2", "", -1);
			response.addCookie(idSet);
			Cookie pwSet = CookieBox.createCookie("PW2", "", -1);
			response.addCookie(pwSet);
		}

	} else {
		out.println("<script>alert(\'로그인 실패\'); history.go(-1); </script>");

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
		out.print("<h1>로그인 되었습니다.</h1>");
		out.print("<a href='loginCheck.jsp'>loginCheck</a> <br>");
		out.print("<a href='loginForm.jsp'>로그인 페이지로 이동</a>");
	} 
	%>
</body>
</html>