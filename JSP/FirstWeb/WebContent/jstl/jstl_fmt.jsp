<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	<h3>

		<!-- 변수 선언 -->
		<c:set var="price" value="100000" />
		<c:set var="pi" value="0.141592" />

		<!-- groupingUsed="true" 기본값, 100,000 -->
		<fmt:formatNumber value="${price}" type="number" var="numberType"
			groupingUsed="true" />

		현재 숫자 : ${numberType} <br>

		<!-- currencySymbol="통화심볼" -->
		통화 :
		<fmt:formatNumber value="${price}" type="currency" currencySymbol="\\" />
		<br>

		<!-- percent의 경우 컴마(,) 옵션을 false -->
		% 표현 :
		<fmt:formatNumber value="${price}" type="percent" groupingUsed="false" />
		/ % 표현 :
		<fmt:formatNumber value="${pi}" type="percent" groupingUsed="false" />
		<br> 패턴표현 :
		<fmt:formatNumber value="${price}" pattern="00,000,000.00" />
		/ 패턴표현 :
		<fmt:formatNumber value="${pi}" pattern="00,000,000.00" />
		<br>

	</h3>


	<h3>
		<fmt:timeZone value="Hongkong">
			<c:set var="now" value="<%=new java.util.Date()%>" />

			<!-- type 은 date = 날짜, time=시간, both=둘다 
		 	   dateStyle = 날짜 포맷팅 스타일, timeStyle = 시간 포맷팅 스타일
		 	-->
			<fmt:formatDate value="${now}" type="date" dateStyle="full" />
		  / <fmt:formatDate value="${now}" type="date" dateStyle="short" /> <br>

			<fmt:formatDate value="${now}" type="time" timeStyle="full" />
		  / <fmt:formatDate value="${now}" type="time" timeStyle="short" /> <br>
			
			<fmt:formatDate value="${now}" type="both" /> <br>
			<fmt:formatDate value="${now}" type="both" dateStyle="short" timeStyle="short" /> <br>
			<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full" /> <br>
			
			<!-- 패턴으로 원하는 날짜|시간 형태로 직접 지정해줄 수 있다. -->
			<fmt:formatDate value="${now}" pattern="yyyy.MM.dd. H:mm:ss" /> <br>
			<fmt:formatDate value="${now}" pattern="yyyy-MM-dd. H:mm" />
		</fmt:timeZone>
	</h3>

	<!-- 사용할 수 있는 시간대 목록 -->
	<c:forEach var="id" items="<%= java.util.TimeZone.getAvailableIDs() %>">
		${id} <br>
	</c:forEach>




</body>
</html>