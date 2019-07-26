<%@page import="membermanager.model.MemberInfo"%>
<%-- <%@page import="member.LoginInfo"%> --%>
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

	// 요청한 정보의 uId, uPw 의 값을 가져온다.
	String userId = request.getParameter("uId");
	String userPw = request.getParameter("uPw");
	
	//boolean loginChk = false;
	
	/* 
		1. 사용자가 입력한 id로 회원 정보 검색
		2. 존재한다 : 해당 객체를 받는다.
		   		    해당 객체의 pw 와 사용자가 입력 pw 비교
		   		    같다면 - 로그인 처리 : 세션영역에 회원 정보를 저장
		   		    틀리다 - 오류 메시지전달 -> 로그인 페이지로 이동
		3. 존재하지 않는다. : 오류 메시지전달 -> 로그인 페이지로 이동
	*/
	
	// 요청한 userId로 application 객체에 저장된 데이터를 받는다.
	MemberInfo memberInfo = (MemberInfo)application.getAttribute(userId);
	
	if(memberInfo != null && memberInfo.getuPw().equals(userPw)) {
		// 회원 정보가 존재 && 비밀번호가 일치
		// 세션에 회원 로그인 정보를 저장
		// toLoginInfo() 메서드는 LoginInfo 로 객체를 생성하기 위함
		session.setAttribute("loginInfo", memberInfo.toLoginInfo());

		// 로그인 처리 후 메인페이지로 이동
		response.sendRedirect(request.getContextPath());
	} else {
		// id 검색결과가 null 또는 pw 비교에서 같지 않은 경우
		%>
		<script>
			alert('아이디 혹은 비밀번호가 틀립니다.\n 다시 로그인 해주세요.');
			history.go(-1);
		</script>
		<%
	}
		
		
		
		
		
	// 로그인 인증 성공/실패
	//boolean loginChk = false;
	
	// 1. 조건식 userId, userPw 가 null 이 아닐 경우, 
	// 그리고 userId와 userPw 가 일치하는 경우 
	// 2. LoginInfo에 userId를 매개변수로 loginInfo 인스턴스를 생성
	// 3. 세션 속성에 loginInfo 객체를 저장
	// 4. loginChk 를 true 로 변경
/* 	if(userId != null && userPw != null && userId.equals(userPw)) {
		//response.sendRedirect(request.getContextPath()); // /mm

			LoginInfo loginInfo = new LoginInfo(userId);
			session.setAttribute("LoginInfo", loginInfo);
			loginChk = true;
		
	} */
%>



<!-- 헤더 시작 -->
<%@ include file="../frame/header.jsp" %>
<!-- 헤더 끝 -->

<!-- 네비게이션 시작 -->
<%@ include file="../frame/nav.jsp" %>
<!-- 네비게이션 끝 -->

<!-- 컨텐츠 시작 -->
<div id="contents">
<%-- 	<%
		if(loginChk) {
	%>
	<h1><%= userId %>님 환영합니다.</h1>
	<!-- false일 경우 메시지창 출력하며 이전 페이지로 이동 -->
	<% } else { %>
		<script>
			alert("아이디 또는 비밀번호를 확인해 주세요.")
			history.go(-1);
		</script>
	<% } %> --%>


<%-- 	<h3>로그인 확인 페이지</h3>
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
	</table> --%>
	<!-- loginChk가 true일 경우 -->

</div>
<!-- 컨텐츠 끝 -->

<!-- 푸터 시작 -->
<%@ include file="../frame/footer.jsp" %>
<!-- 푸터 끝 -->

</body>
</html>





<%-- <jsp:useBean id="loginInfo" class="member.MemberInfo" scope="session"/>
<jsp:setProperty property="uId" name="loginInfo" value="<%= userId %>"/> --%>

















