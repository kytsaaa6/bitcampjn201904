<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<%
	String ctgy = request.getParameter("ctgy");
	
	if(ctgy==null) {
		ctgy="1";
	}
%>
	
	
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
	
	#main_wrap {
		border: 1px solid #ddd;
		width: 800px;
		padding: 10px;
		margin: 10px auto;
	}

	#wrap {
		overflow: hidden;
	}
	
	#wrap>div {
		float: left;
	}
	
	#aside {
		height: 200px;
		background-color: orange;
	}
	
	#footer {
		border: 1px solid #ddd;
		height: 50px;
	}
	
	#menu {
		width: 200px;
		height: 50px;
		background-color: black;
	}

</style>
</head>
<body>

	<div id=main_wrap>
		<div id="header">
			<h1>title</h1>
		</div>
		<div id="wrap">
			<div id="menu">
				<jsp:include page="menu.jsp">
				<!-- 간단한 데이터는 파라미터를 이용, 데이터가 많다면 객체에 넣어두고 속성 이용 -->
					<jsp:param value='<%= request.getParameter("ctgy") %>' name="ctgy" />
				</jsp:include>
			</div>
			<div id="aside">content</div>
		</div>
		<div id="footer"></div>
	</div>

</body>
</html>