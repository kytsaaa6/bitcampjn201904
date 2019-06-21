<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h1>

	<!-- web.xml에 logEnabled라는 파라미터 이름으로 등록된 value 값을 가져온다 -->
	<!-- Tomcat 이 실행될떄 WEB-INF/web.xml 메모리에 올려놓고 시작
		 web.xml	값이 바뀔 경우 Tomcat 재시작 필요 -->
	<%= application.getInitParameter("logEnabled") %> <br>
	<%= application.getInitParameter("debugLevel") %> <br>
	<%
		Enumeration initParamNames = application.getInitParameterNames();
	
		while(initParamNames.hasMoreElements()){
			out.print(initParamNames.nextElement()+"<br>");	
		}
	
	%>
</h1>
</body>
</html>