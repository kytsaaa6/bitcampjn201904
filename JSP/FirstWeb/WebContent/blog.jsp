<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Min's BLOG</title>
<link href="css/default.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
</style>
</head>
<body>
	<!-- 메인랩 시작 -->
	<div id="main_wrap">
	
		<!-- header 시작 -->
		<%@ include file="frame/header.jsp" %>
		<!-- header 끝 -->

		<!-- nav 시작 -->
		<%@ include file="frame/nav.jsp" %>
		<!-- nav 끝 -->

		<!-- contents 시작 -->
		<div id="contents">

			<!-- content 시작 -->
			<div id="content">
				<article>
					<h1 class="title">라이언킹</h1>
					<span class="date">2019.06.05 14:55</span> <img
						src="images/ryan.png" class="img">
					<p>둥둥섬의 왕위 계승자로 태어난 수사자 라이언. 무뚝뚝한 표정과는 다르게 배려심이 많고 따뜻한 리더십을 가지고
						있습니다. 하지만 다른 가족들과는 다르게 갈기가 없는 자신의 모습에 정체성의 혼란을 느껴 왕의 자리에 오르기보다는 또
						다른 세상에 대한 호기심을 키웁니다. 왕궁에서의 반복되는 일상의 지루함을 느끼던 어느 날, 라이언은 둥둥섬을 탈출하기
						위한 준비를 시작하고, 기회를 보던 차에 드디어 둥둥섬 탈출에 성공합니다. 섬을 벗어나 도착한 곳은 책으로만 접하며
						동경해 왔던 신비의 장소인 바로 Secret Forest! 그곳에서 라이언은 생각지도 못했던 친구들을 만나며, 흥미로운
						이야기들을 만들어 갑니다.</p>
				</article>
				<article>
					<h1 class="title">피캌ㅋㅋㅋ</h1>
					<span class="date">2019.06.05 14:55</span> <img
						src="images/pika.jpg" class="img">
					<p>게임 및 애니메이션 포켓몬스터 시리즈에 등장하는 포켓몬으로 포켓몬스터의 상징 그 자체이자 둘도없는 영원한
						마스코트 다. 담당 성우는 오오타니 이쿠에다.[9] 보는 바와 같이 귀엽다. 그 때문인지 포켓몬 게임의 가장 초기판인
						적/녹/청 시절에 게이머들에게 낮은 종족값에도 불구하고 가장 큰 사랑을 받아서 게임이 인기를 끌자[10] 제작된
						애니메이션에서는 아예 주인공 포켓몬으로 낙점되었다. 이 이유는 파이리, 꼬부기, 이상해씨 중 하나로 선택하면 게임에서
						자기가 선택하지 않은 포켓몬이 주인공이 되어서 불만이 있을 수 있다는 생각을 하였고 아예 다른 포켓몬을 파트너로
						택하자고 결정을 내렸고 인기투표를 통해 당첨된 포켓몬이 피카츄였다. 약 800마리 이상에 달하는 포켓몬스터의 캐릭터 중
						가장 성공한 캐릭터이며 이런 류의 몬스터 캐릭터 중 세계적으로 유례가 없을 정도로 대성공을 거두었다. 그 인기로
						피카츄가 스타팅 포켓몬인 포켓몬스터 피카츄까지 발매되는 기염을 토했다.</p>
				</article>
			</div>
			<!-- content 끝 -->

			<!-- aside 시작 -->
			<%@ include file="frame/aside.jsp" %>
			<!-- aside 끝 -->
		</div>
		<!-- contents 끝 -->

		<!-- footer 시작 -->
		<%@ include file="frame/footer.jsp" %>
		<!-- footer 끝 -->

	</div>
	<!-- 메인랩 끝 -->
</body>
</html>