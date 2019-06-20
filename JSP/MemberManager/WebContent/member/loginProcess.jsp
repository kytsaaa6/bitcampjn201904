<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="/mm/css/default.css" rel="stylesheet" type="text/css">
<style>
	
</style>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");


	String userId = request.getParameter("uId");
	String userPw = request.getParameter("uPw");
	
	if(userId != null && userPw != null && userId.equals("admin") && userPw.equals("admin")) {
		response.sendRedirect(request.getContextPath()); // /mm
	}

%>



<!-- 헤더 시작 -->
<%@ include file="../frame/header.jsp" %>
<!-- 헤더 끝 -->

<!-- 네비게이션 시작 -->
<%@ include file="../frame/nav.jsp" %>
<!-- 네비게이션 끝 -->

<!-- 컨텐츠 시작 -->
<div id="contents">
	<h3>로그인 확인 페이지</h3>
	<hr>

	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="uId" value="<%= userId %>"> </td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="text" name="uPw" value="<%= userPw %>"> </td>
		</tr>
		<tr>
			<td></td>
			<td> </td>
		</tr>
	</table>

</div>
<!-- 컨텐츠 끝 -->

<!-- 푸터 시작 -->
<%@ include file="../frame/footer.jsp" %>
<!-- 푸터 끝 -->

</body>
</html>