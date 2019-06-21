<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
}

#wrap {
	width: 700px;
	margin: 0 auto;
}

hr {
	margin-bottom: 30px;
}
h2 {
	text-align: center;
	margin: 30px 0;
}

table {
	border: 0;
	border-collapse: collapse;
	margin : 0 auto;
	width: 300px;
}

td {
	border: 1px solid #DDD;
	font-size: 18px;
	padding: 10px;
}

select { 
	height: 25px;
}

table tr:last-child>td {
	text-align: center;
}

table tr:first-child>td:first-child {
	width: 100px;
}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>
<!-- 	String name = request.getParameter("uName");
	String jop = request.getParameter("jop");
	String[] favor = request.getParameterValues("favor");
%>
 -->	
 <h2>전송 결과</h2>
	<hr>
		<table>
			<tr>
				<td>이름</td>
				<td><%= request.getParameter("uName") %></td>
			</tr>
			<tr>
				<td>직업</td>
				<td><%= request.getParameter("jop") %></td>
			</tr>
			<tr>
				<td>관심분야</td>
				<td>
				<%
					String[] favors = request.getParameterValues("favor");
					 if(favors != null) {
						 
						for(int i=0; i<favors.length; i++)  {
							out.print(favors[i] + "<br>");
						}
				 }
				%>
				</td>
			</tr>

		</table>
	</form>




</body>
</html>