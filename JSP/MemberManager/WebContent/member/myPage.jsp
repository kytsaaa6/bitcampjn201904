<%@page import="member.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="loginInfo" class="member.MemberInfo" scope="session"/> --%>
<%
	request.setCharacterEncoding("utf-8");
	// loginProcess.jsp 에서 저장한 LoginInfo 객체를 가져옴.
	// String -> Object 형태로 형변환 후 참조변수에 저장
	LoginInfo loginInfo = (LoginInfo)session.getAttribute("loginInfo");
%>


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



<!-- 헤더 시작 -->
<%@ include file="../frame/header.jsp" %>
<!-- 헤더 끝 -->

<!-- 네비게이션 시작 -->
<%@ include file="../frame/nav.jsp" %>
<!-- 네비게이션 끝 -->

<!-- 컨텐츠 시작 -->
<div id="contents">
	<!-- 객체에 데이터가 있을 경우 getter로 각 데이터를 가져옴 -->
	<% 
		if(loginInfo != null) {
	%>
	<h3> 회원정보 페이지</h3>
	<hr>
		<img src="../images/<%= loginInfo.getuPhoto() %> ">
		<h4>이름 : <%= loginInfo.getuName() %></h4>
		<h4>아이디 : <%= loginInfo.getuId() %></h4>
		
	<!-- 객체에 데이터가 없을 경우 아래 메시지 출력 -->
	<% } else { %>
	<script>
		alert('로그인 상태에서만 이용이 가능한 페이지 입니다.');
		location.href = 'login.jsp';
	</script>
	<% } %>
</div>
<!-- 컨텐츠 끝 -->

<!-- 푸터 시작 -->
<%@ include file="../frame/footer.jsp" %>
<!-- 푸터 끝 -->

</body>
</html>