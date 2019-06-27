<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("name01", "requestData");
	session.setAttribute("name02", "sessionData");
	application.setAttribute("name03", "applicationData");
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

	<h3>
					
					<!-- 속성 영역은 생략 가능 
						대신 값이 같을 경우 하나만 출력
					-->
		request 영역의 name01 : ${name01} <br>
			<%= request.getAttribute("name01") %> <br>
		session 영역의 name02 : ${sessionScope.name01} <br>
		application 영역의 name03 : ${name03} <br>
		code 파라미터 : ${param.code} <br>
		code 파라미터 : <%= request.getParameter("code") %> <br>
		contextPath : ${pageContext.request.contextPath} <br>
		contextPath : <%= request.getContextPath() %> <br>
		
		
		<a href="${pageContext.request.contextPath}/member/memberList.jsp">경로1</a> <br>
		<a href="<%= request.getContextPath() %>/member/memberList.jsp">경로1</a> <br>
		
		
	
	</h3>


</body>
</html>