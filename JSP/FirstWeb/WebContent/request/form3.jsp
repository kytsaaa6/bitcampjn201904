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

<h1>action_forward / response sendRedirect 비교</h1>

<!-- forward 처리 -->
<form action="action_forward.jsp">
	forward action <input type="text" name="name"> <input type="submit">
</form>

<!-- redirect 처리 -->
<form action="response_sendRedirect.jsp">
	response sendRedirect <input type="text" name="name"> <input type="submit">
</form>




</body>
</html>