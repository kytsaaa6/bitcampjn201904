<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	CookieBox cBox = new CookieBox(request);

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
	
	<h1>로그인</h1>
	<hr>
	<form action="login.jsp" method="post">
		아이디 <input type="text" name=id value=<%= cBox.getValue("ID2") %>> <br> 
		비밀번호 <input type="text" name="pw" value=<%= cBox.getValue("PW2") %>> <br>
		
		ID/PW 저장<input type="checkbox" name="auto" value="on"><br>
		<input type="submit"value="로그인">
	</form>
	
	<br>
	<a href="loginCheck.jsp">loginCheck</a>
	
	
	
</body>
</html>