<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> isErrorPage="true"%>
<%@ page import="java.util.Calendar"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
	img {
		width: 100px;
	}
</style>
</head>
<body>


	<% javaCalender c = Calendar.getInstance();
	%>
	<h1>회원리스트
		<%= c.get(Calendar.YEAR) %> 년
		<%= c.get(Calendar, MHONTH) %> 월
		<%= c.get(Calender.DATE) %>일
	</h1>
	<a href="memberReg.jsp">회원가입</a> <br>
	<img alt="이미지" src="../images/pika.jpg">

</body>
</html>