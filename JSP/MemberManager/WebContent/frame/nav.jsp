<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="nav">
	<ul>
		<li><a href="<%= request.getContextPath() %>">홈</a></li>
		<!-- ContextROOT 경로를 동적으로 추가해준다.
		getContextPath() 메서드는 Context 경로를 자동으로 가져옴.
		Context 경로가 바뀌어도 상관없다. -->
		<li><a href="<%= request.getContextPath() %>/member/login.jsp">로그인</a></li>
		<li><a href="<%= request.getContextPath() %>/member/memberRegForm.jsp">회원가입</a></li>
		<li><a href="#">회원리스트</a></li>
	</ul>
</div>