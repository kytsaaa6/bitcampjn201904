<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<head>
<title>request 테스트</title>
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


</style>
</head>

<body>
	<div id="wrap">
		<h2>request 테스트 폼</h2>
		<hr>
		<form action="requestProcess.jsp" method="post">
			<table>
				<tr>
					<td>이름</td>
					<td><input type="text" name="uName"></td>
				</tr>
				<tr>
					<td>직업</td>
					<td>
						<select name="jop">
							<option>무직</option>
							<option>웹디자이너</option>
							<option>웹개발자</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>관심분야</td>
					<td>
						<input type="checkbox" name="favor" value="JAVA">JAVA
						<input type="checkbox" name="favor" value="HTML5">HTML5
						<input type="checkbox" name="favor" value="PYTHON">PYTHON
						<input type="checkbox" name="favor" value="JAVASCRIPT">JAVASCRIPT
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="확인"> 
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
		
	</div>


</body>
</html>