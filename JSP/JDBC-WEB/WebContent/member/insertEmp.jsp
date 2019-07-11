<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %> 
<%@ page import = "java.sql.SQLException" %>

<%
	request.setCharacterEncoding("utf-8");
%>
	<jsp:useBean id="member" class="member.Emp"/>
	<jsp:setProperty property="*" name="member"/>
<%
	/* String empno = request.getParameter("empno"); */
	/* String ename = request.getParameter("ename"); */

	/* int eno = Integer.parseInt(empno); */

	Connection conn = null;
	PreparedStatement pstmt = null;
	int resultCnt = 0;

	try {
		// 1. 데이터베이스 로드
		Class.forName("com.mysql.jdbc.Driver");
		
		// 2. 데이터베이스 연결
		conn = DriverManager.getConnection("jdbc:mysql://localhost/project?serverTimezone=UTC", "bit", "bit");
		
		// 3. PreparedStatement 생성
		// 사용자 정보 업데이트를 위한 SQL 작성
		String sql = "insert into emp (empno, ename, job) values(?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, member.getEmpno());
		pstmt.setString(2, member.getEname());
		pstmt.setString(3, member.getJob());
		
		// 4. SQL 실행
		resultCnt = pstmt.executeUpdate();

		// 5. 실행결과 출력 : 수정되었습니다.

	} catch (ClassNotFoundException cs) {
		
	} catch (SQLException se) {

	} finally {
		// 6. 객체 close	
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {

			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {

			}
		}
	}
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
	<h1>사원 등록 완료</h1>
	<h3> <%= member.getEname() %> 님 등록 처리(입력)되었습니다.</h3>
	<a href="empList.jsp">EMP LIST</a>
</body>
</html>