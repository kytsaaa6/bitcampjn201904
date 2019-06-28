<%@page import="member.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="nav">

	<ul>
		<!-- ContextROOT 경로를 동적으로 추가해준다.
		getContextPath() 메서드는 Context 경로를 자동으로 가져옴.
		Context 경로가 바뀌어도 상관없다. -->
		<li><a href="<c:url value='/' />">홈</a></li>
		<li><a href="<c:url value='/member/login.jsp'/>">Login</a></li>
		<li><a href="<c:url value='/member/memberRegForm.jsp'/>">Join</a></li>
		<li><a href="<c:url value='/member/myPage.jsp'/>">MyPage1</a></li>
		<li><a href="<c:url value='/member/myPage2.jsp'/>">MyPage2</a></li>
		<li><a href="<c:url value='/member/memberList.jsp'/>">MemberList1</a></li>
		<li><a href="<c:url value='/member/memberList2.jsp'/>">MemberList2</a></li>
		<li><a href="<c:url value='/member/logout.jsp'/>">Logout</a></li>
	</ul>


	<%-- <ul>
		<!-- ContextROOT 경로를 동적으로 추가해준다.
		getContextPath() 메서드는 Context 경로를 자동으로 가져옴.
		Context 경로가 바뀌어도 상관없다. -->
		<li><a href="${pageContext.request.contextPath}">홈</a></li>
		<li><a href="${pageContext.request.contextPath}/member/login.jsp">Login</a></li>
		<li><a href="${pageContext.request.contextPath}/member/memberRegForm.jsp">Join</a></li>
		<li><a href="${pageContext.request.contextPath}/member/myPage.jsp">MyPage</a></li>
		<li><a href="${pageContext.request.contextPath}/member/memberList.jsp">MemberList</a></li>
		<li><a href="${pageContext.request.contextPath}/member/logout.jsp">Logout</a></li>
	</ul> --%>
</div>