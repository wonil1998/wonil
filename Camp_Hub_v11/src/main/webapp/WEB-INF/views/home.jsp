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
<link href="<%=request.getContextPath()%>/resources/css/home.css"
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
		<jsp:include page="afterTop.jsp" flush="true" />
	</c:if>
	<c:if test="${id==null}">
		<jsp:include page="beforeTop.jsp" flush="true" />
	</c:if>

	<!-- side -->
	<jsp:include page="side.jsp" />
	<!-- main -->
	<main>
		<div class="slider-2">

			<div class="side-btns">
				<div>
					<span><i class="fas fa-caret-left"></i></i></span>
				</div>
				<div>
					<span><i class="fas fa-caret-right"></i></span>
				</div>
			</div>

			<div class="slides">
				<div class="active"
					style="background-image: url(https://images.prismic.io/stayfolio-production/73f99b79-336f-47fd-8ace-afc00978147d_banner.jpg?auto=compress,format);"></div>
				<div
					style="background-image: url(https://images.prismic.io/stayfolio-production/038914a1-9b23-4f26-9b10-84669d9a1339_banner.jpg?auto=compress,format);"></div>
				<div
					style="background-image: url(https://images.prismic.io/stayfolio-production/586abdef-7163-4629-9c39-6d7a627ae10e_01_banner_picture.jpg?auto=compress,format);"></div>
				<div
					style="background-image: url(https://images.prismic.io/stayfolio-production/3b4bf417-3c41-4d05-b62c-f02a293ba115_banner.jpg?auto=compress,format);"></div>
			</div>

			<div class="page-nav">
				<div class="active"></div>
				<div></div>
				<div></div>
				<div></div>
			</div>
		</div>
		<section id="section">
         <a style= "color:black" href="https://www.coupang.com/vp/products/6335212905?itemId=13265061910&vendorItemId=80522720003&src=1032001&spec=10305201&addtag=400&ctag=6335212905&lptag=I13265061910&itime=20230720094025&pageType=PRODUCT&pageValue=6335212905&wPcid=19610231860695507605873&wRef=cr.shopping.naver.com&wTime=20230720094025&redirect=landing&mcid=b277b8e0c9aa4928b255d3d6ad7ca863&isAddedCart=">
         <div class="front_box">
            <h3>특가!텐트 면텐트 가족캠핑 최적화</h3>
            <img src="<%=request.getContextPath()%>/resources/img/random2.jpg"
               width="150" height="100" alt="텐트">
            <p></p>
            오랜 시간 동안 쌓아온 노하우로 만들어진 KZM만의 디자인과 기술력으로 보다 더 향상된 캠핑 라이프를 제공해드립니다.
            ₩445,990
         </div>
         </a>
         <a style= "color:black" href="https://www.lotteon.com/p/product/LO1972032269">
            <div class="front_box box2">
               <h3>New 가방 하나에 쏙! 올인원 캠핑테이블체어세트</h3>
               <img src="<%=request.getContextPath()%>/resources/img/random1.jpg"
                  width="150" height="110" alt="캠핑의자">
               <p></p>
               단, 1분 설치! 올인원 캠핑 세트하나만 챙기면 준비끝! 테이블 + 체어를 가방 하나에 쏙! <br>₩69,900
            </div>
         </a>
          <a   style= "color:black" href="https://www.coupang.com/vp/products/6393832035?itemId=13642722353&vendorItemId=82430273485&src=1032001&spec=10305201&addtag=400&ctag=6393832035&lptag=P6393832035&itime=20230720092737&pageType=PRODUCT&pageValue=6393832035&wPcid=19610231860695507605873&wRef=cr.shopping.naver.com&wTime=20230720092737&redirect=landing&mcid=766bba9c1e0746038a8ae82af0ab94cc&isAddedCart=">
            <div class="front_box box3">
               <h3>라이노 캠핑 화로대 불멍 접이식 바베큐그릴 하이엔드골드2007</h3>
               <img src="<%=request.getContextPath()%>/resources/img/random3.jpg"
                  width="140" height="100" alt="">
               <p></p>
               초경량 캠핑 화로대!! 금속장인이 직접 설계했으며 제품 안전성 테스트를 정상 통과한 제품입니다.<br>₩129,900
            </div>
         </a>
      </section>



	</main>
	<!-- footer -->
	<jsp:include page="footer.jsp" flush="true" />
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
	<!-- <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script> -->
	<!-- <script src="js/datatables-simple-demo.js"></script> -->

</body>
</html>

<script>
	$('.slider-2 .page-nav > div').click(function() {

		var $this = $(this);
		var $pagenav = $this.parent()
		var $current = $pagenav.find('.active');

		$current.removeClass('active');
		$this.addClass('active');

		var index = $this.index();
		var $슬라이더 = $this.closest('.slider-2');

		$슬라이더.find('.slides > div.active').removeClass('active');
		$슬라이더.find('.slides > div').eq(index).addClass('active');

	});

	$('.slider-2 > .side-btns > div:first-child').click(function() {
		var $this = $(this);
		var $slider = $this.closest('.slider-2');

		var $current = $slider.find('.page-nav > div.active');
		var $post = $current.prev();

		if ($post.length == 0) {
			$post = $slider.find('.page-nav > div:last-child');
		}

		$post.click();
	});

	$('.slider-2 > .side-btns > div:last-child').click(function() {
		var $this = $(this);
		var $slider = $this.closest('.slider-2');

		var $current = $slider.find('.page-nav > div.active');
		var $post = $current.next();

		if ($post.length == 0) {
			$post = $slider.find('.page-nav > div:first-child');
		}

		$post.click();
	});
</script>
