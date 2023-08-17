<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>메인화면</title>
<!-- <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" /> -->
<link href="<%=request.getContextPath()%>/resources/css/styles.css"
	rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/css/css.css"
	rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/css/kakaoMap.css"
	rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!-- <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script> -->
<script src="<%=request.getContextPath()%>/resources/js/dataTable.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">

</head>
<body class="sb-nav-fixed">
	    <!-- top -->
	    
        	<c:if test="${id != null}">
				<jsp:include page="afterTop.jsp" flush="true"/>
            </c:if>
            <c:if test="${id==null}">
	           <jsp:include page="beforeTop.jsp" flush="true"/>
            </c:if>
		
        <!-- side -->
        
        <jsp:include page="side.jsp" />
        
        <!-- main -->

			<main>
				<div class="option">
					<div>
						<form onsubmit="searchPlaces(); return false;">
							키워드입력 : <input type="text" value="수원 캠핑" id="keyword" size="15">
							<button type="submit">검색하기</button>
						</form>
					</div>
				</div>
				
				<div class="map_wrap">
					<div id="map"
						style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

					<div id="menu_wrap" class="bg_white">
						<ul id="placesList"></ul>
						<div id="pagination"></div>
					</div>

					<!-- 지도타입 컨트롤 div 입니다 -->
					<div class="custom_typecontrol radius_border">
						<span id="btnRoadmap" class="selected_btn"
							onclick="setMapType('roadmap')">지도</span> <span id="btnSkyview"
							class="btn" onclick="setMapType('skyview')">스카이뷰</span>
					</div>
					<!-- 지도 확대, 축소 컨트롤 div 입니다 -->
					<div class="custom_zoomcontrol radius_border">
						<span onclick="zoomIn()"> <img
							src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png"
							alt="확대"></span> <span onclick="zoomOut()"><img
							src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png"
							alt="축소"></span>
					</div>
				</div>

			</main>
			<!-- footer -->
        <jsp:include page="footer.jsp" flush="true"/>
	<script src="<%=request.getContextPath()%>/resources/js/js.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resources/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/demo/chart-area-demo.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/demo/chart-bar-demo.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=af3337911a36fa2bc957b2533317117f
&libraries=services"></script>
	<script src="<%=request.getContextPath()%>/resources/js/kakaoMap.js"></script>

</body>
</html>