<%@page import="member.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div id="nav">
	<ul>
		<li><a href="<%= request.getContextPath() %>">홈</a></li>
		<!-- ContextROOT 경로를 동적으로 추가해준다.
		getContextPath() 메서드는 Context 경로를 자동으로 가져옴.
		Context 경로가 바뀌어도 상관없다. -->
		<li><a href="<%= request.getContextPath() %>/member/login.jsp">Login</a></li>
		<li><a href="<%= request.getContextPath() %>/member/memberRegForm.jsp">Join</a></li>
		<li><a href="<%= request.getContextPath() %>/member/myPage.jsp">MyPage</a></li>
		<li><a href="<%= request.getContextPath() %>/member/memberList.jsp">MemberList</a></li>
		<li><a href="<%= request.getContextPath() %>/member/logout.jsp">Logout</a></li>
		
	</ul>
</div>