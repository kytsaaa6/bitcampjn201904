<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="/mm2/css/default.css" rel="stylesheet" type="text/css">
<style>

</style>
</head>
<body>

<!-- 헤더 시작 -->
<%@ include file="/WEB-INF/view/frame/header.jsp" %>
<!-- 헤더 끝 -->

<!-- 네비게이션 시작 -->
<%@ include file="/WEB-INF/view/frame/nav.jsp" %>
<!-- 네비게이션 끝 -->

<div id="contents">	
	<div style="text-align: right;"> <a href="memberWriteForm">회원등록</a></div>
	
	<c:if test="${viewData.memberTotalCount>0}">
	
	<c:forEach items="${viewData.memberList}" var="member">
			<div>
				회원 번호 : ${member.uPk}<br>
				회원 ID : ${member.uId}<br>
				회원 이름 : ${member.uName}<br>
				<a href="memberDelForm?uPk=${member.uPk}">삭제하기</a>
			</div>
	</c:forEach>

	<c:forEach begin="1" end="${viewData.pageTotalCount}" step="1" var="num">
		<a href="memberList?page=${num}">[${num}]</a> 
	</c:forEach>

	</c:if>
</div>
<!-- 푸터 시작 -->
<%@ include file="/WEB-INF/view/frame/footer.jsp" %>
<!-- 푸터 끝 -->
	
</body>
</html>