<%@page import="membermanager.model.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	// 세션에 저장되어 있는 로그인ID를 받는다.
	// getAttribute 는 object 타입이므로 String으로 형변환이 필요
	//String userId = (String)session.getAttribute("loginId");
	//String userPw = (String)session.getAttribute("loginPw");
	LoginInfo loginInfo = (LoginInfo)session.getAttribute("LoginInfo");

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
		if(loginInfo != null) {
	%>
	<h1><%= loginInfo.getName() %>님 로그인 상태입니다.</h1>
	<h3>
		id = <%= loginInfo.getId() %> <br>
		nicName = <%= loginInfo.getNicname() %> <br>
		grade = <%= loginInfo.getGrade() %> <br>
		photo = <%= loginInfo.getPhoto() %> <br>
		PhoneNumber = <%= loginInfo.getpNum() %> <br>
	</h3>
	<a href="logout.jsp">logout</a>
	<%
		} else {
	%>
	<script>
		alert('로그인 상태에서만 확인 가능합니다.\n 로그인 페이지로 이동합니다.');
		location.href='loginForm.jsp';
	</script>
	<%  } %>
</body>
</html>