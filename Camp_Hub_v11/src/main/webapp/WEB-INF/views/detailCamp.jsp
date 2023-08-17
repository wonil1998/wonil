<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>
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
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!-- <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script> -->
<script src="<%=request.getContextPath()%>/resources/js/dataTable.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/ajax.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">

<style>
.btn-check:disabled+.btn-outline-primary {
	opacity: 1;
	pointer-events: none;
}
</style>
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
		<div id="carouselExampleDark" class="carousel carousel-dark slide"
			data-bs-ride="carousel">
			<div class="carousel-indicators">
			<c:forEach var="cf" items="${cflist}" varStatus="status">
				<c:choose>
					<c:when test="${status.index == 0}">
						<button type="button" data-bs-target="#carouselExampleDark"
							data-bs-slide-to="${status.index}" class="active" aria-current="true"
							aria-label="Slide ${status.count}"></button>
					</c:when>
					<c:otherwise>
						<button type="button" data-bs-target="#carouselExampleDark"
							data-bs-slide-to="${status.index}" aria-label="Slide ${status.count}"></button>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			</div>
			<div class="carousel-inner text-center  mt-3">
			<c:forEach var="cf" items="${cflist}" varStatus="status">
				<c:choose>
					<c:when test="${status.count == 1}">
						<div class="carousel-item active">
							<img src="download?filename=${cf.filename}"
								class="mx-auto d-block" style="height: 400px" alt="${status.count}">
						</div>
					</c:when>
					<c:otherwise>
						<div class="carousel-item">
							<img src="download?filename=${cf.filename}"
								class="mx-auto d-block" style="height: 400px" alt="${status.count}">
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleDark" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleDark" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		<hr>

		<div class="m-4">
			<input type="hidden" id="flag">
			<div class="mt-2" role="group">
			<c:if test="${id!=cvo.m_id }">
				<input type="checkbox" class="btn-check" id="btncheck1"
					autocomplete="off" onclick="inmarking()"> 
				<label class="btn btn-outline-primary" for="btncheck1">즐겨찾기</label>
			</c:if>
			<c:if test="${id==cvo.m_id }">
				<button type="button" class="btn btn-outline-primary" onclick="location.href='<%=request.getContextPath()%>/camp_mod_form?num=${cvo.num}'">캠핑장 수정</button>
				<button type="button" class="btn btn-outline-danger" onclick="location.href='<%=request.getContextPath()%>/camp_del?num=${cvo.num}'">캠핑장 삭제</button>
			</c:if>
					
			</div>

			<h3>
				${cvo.star}
				<c:choose>
					<c:when test="${cvo.star == 5}">★★★★★</c:when>
					<c:when test="${cvo.star >= 4.5}">★★★★☆</c:when>
					<c:when test="${cvo.star >= 4}">★★★★</c:when>
					<c:when test="${cvo.star >= 3.5}">★★★☆</c:when>
					<c:when test="${cvo.star >= 3}">★★★</c:when>
					<c:when test="${cvo.star >= 2.5}">★★☆</c:when>
					<c:when test="${cvo.star >= 2}">★★</c:when>
					<c:when test="${cvo.star >= 1.5}">★☆</c:when>
					<c:when test="${cvo.star >= 1}">★</c:when>
				</c:choose>
			</h3>


			<p class="text-muted">캠핑장 타입</p>
			<h1>${cvo.c_name}</h1>
			<p>${cvo.addr_do}&nbsp${cvo.addr_si}</p>
			<p>${cvo.phone}</p>
			<button type="button" class="btn btn-primary" onclick="scrollToElement()">리뷰 ${reviewCnt } 개</button>
		</div>
		<div class="accordion" id="accordionExample">
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingOne">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseOne"
						aria-expanded="false" aria-controls="collapseOne">공지사항</button>
				</h2>
				<div id="collapseOne" class="accordion-collapse collapse"
					aria-labelledby="headingOne" data-bs-parent="#accordionExample">
					<div class="accordion-body">${notice.n_con}</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingTwo">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseTwo"
						aria-expanded="false" aria-controls="collapseTwo">시설여부</button>
				</h2>
				<div id="collapseTwo" class="accordion-collapse collapse"
					aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
					<div class="accordion-body">
						<div class="row ms-4">
							<div class="col">
								<p class="mb-0 mt-4">캠핑장 타입/시설</p>
					       	  	<c:forEach var="t" items="${ct}">
								  <input type="checkbox" class="btn-check" name="c_type" id="${t.c_type}" value="${t.c_type}" autocomplete="off" disabled>
								  <label class="btn btn-outline-primary m-1" for="${t.c_type}">${t.name}</label>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr>

		<div class="container">
			<div class="row">
				<c:forEach var="room" items="${roomlist }">
					<div class="col-md-6">
						<div class="card mb-3" style="max-width: 540px;">
							<div class="row g-0">

								<div class="col-md-4">
									<img src="download?filename=${room.filename }"
										class="img-fluid rounded-start">
								</div>
								<div class="col-md-8">
									<div class="card-body">
									<h5 class="card-title">${room.r_name}</h5>						
									<p class="card-text">최대 인원 : ${room.max_cnt}</p>	
									<p class="card-text">기본 인원 : ${room.basic_cnt}</p>			
									<p class="card-text">가격 : ${room.r_price}</p>		
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<hr>
		<!-- 리뷰 댓글 -->
		<div class="container"id="reviewPage">
			<div class="row justify-content-center">
				<div class="col-lg-10">
					<div class="card shadow-lg border rounded-lg mt-5 border-secondary">
						<div class="card-header bg-secondary">
							<h3 class="text-center text-light font-weight-light my-2">리뷰</h3>
						</div>

						<input type="hidden" name="c_num" id="c_num" value="${cvo.num}">

						<div class="row mb-0" id="reviewDiv">
							<c:forEach var="r" items="${rlist}">

								<div class="form-floating mt-3" id="reviewDiv${r.num}">
									<span>${r.nick_name}</span>&nbsp;<span class="vr"></span> <span>${r.grade}</span>&nbsp;<span
										class="vr"></span>&nbsp;<span>${r.indate}</span>


									<c:if test="${r.star_r == 1}">★</c:if>
									<c:if test="${r.star_r == 2}">★★</c:if>
									<c:if test="${r.star_r == 3}">★★★</c:if>
									<c:if test="${r.star_r == 4}">★★★★</c:if>
									<c:if test="${r.star_r == 5}">★★★★★</c:if>

									<c:if test="${id==r.m_id}">
										<button class="btn btn-dark btn-sm"
											onclick="review_mod(${r.num}, ${r.star_r })">수정</button>
										<button class="btn btn-dark btn-sm"
											onclick="review_del(${r.num})">삭제</button>
									</c:if>
									<textarea class="form-control custom-textarea col-auto"
										type="text" id="reviewText${r.num }">${r.rv_con }</textarea>
								</div>


							</c:forEach>
						</div>

						<div class="row mb-3 form-floating mt-3">
							<div class="m-1">
								<button class="btn btn-secondary dropdown-toggle" type="button"
									id="ratingDropdown" data-bs-toggle="dropdown"
									aria-expanded="false">별점 선택</button>
								<ul id='star' class="dropdown-menu"
									aria-labelledby="ratingDropdown">
									<li class="dropdown-item" onclick="setRating(1)" value="1">★</li>
									<li class="dropdown-item" onclick="setRating(2)" value="2">★★</li>
									<li class="dropdown-item" onclick="setRating(3)" value="3">★★★</li>
									<li class="dropdown-item" onclick="setRating(4)" value="4">★★★★</li>
									<li class="dropdown-item" onclick="setRating(5)" value="5">★★★★★</li>
								</ul>
							</div>

							<div class="col-md-10">
								<div class="form-control ms-2" contenteditable="true"
									type="text" id="reviewCon" name="reviewCon"></div>
							</div>
							<div class="col-md-auto">
								<button class="btn btn-dark" onclick="inputReview()">입력</button>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>

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
	<script>
	var a = 0;
	
	function setRating(rating) {
        a=rating;
		// 선택된 별점을 처리하는 로직을 여기에 작성하세요.
       var stars = '★'.repeat(rating);
       $("#ratingDropdown").html(stars);
       
       }
	
	
	 
	function inputReview() {
		var rv_con = $("#reviewCon").text();
		var c_num = $("#c_num").val();
		var star_r = a;

		if (isNaN(star_r)) {
			star_r = 1;
		}

		$.ajax({
			url: "input_review",
			type: "POST",
			dataType: "json",
			data: {
				rv_con: rv_con,
				c_num: c_num,
				star_r: star_r
			},
			success: function (response) {
				var starHtml = '';
				for (var i = 1; i <= response.star_r; i++) {
					starHtml += '★';
				}

				var htmlContent = '<div class="form-floating mt-3" id="reviewDiv' + response.num + '">' +
					'<span>' + response.nick_name + '</span>&nbsp;<span class="vr"></span><span> ' + response.grade + '</span>&nbsp;<span class="vr"></span>&nbsp;<span>' + response.indate + '</span> ' +
			 starHtml  +
					' <button class="btn btn-dark btn-sm" onclick="review_mod(' + response.num + ','+response.star_r+')">수정</button>' +
					' <button class="btn btn-dark btn-sm" onclick="review_del(' + response.num + ')">삭제</button>' +
					'<textarea class="form-control custom-textarea col-auto" type="text" id="reviewText' + response.num + '">' + response.rv_con + '</textarea>' +
					'</div>';

				$("#reviewDiv").append(htmlContent);
				$('#reviewCon').text('');

			},
			error: function () {
				alert("실패");
			}
		});
	}

	
	function review_mod(num,star_r) {
	    var rv_con = $("#reviewText"+num).val();
	    var num = num;
	    var star_r = star_r;
	    $.ajax({
	        url: "review_mod",
	        type: "POST",
	        dataType: "json",
	        data: {
	        	rv_con: rv_con,
	            num: num,
	            star_r: star_r
	            
	        },
	        success: function(response) {
	            $("#reviewText" + num).val(response.rv_con);
	        },
	        error: function() {
	            alert("리뷰 수정 실패");
	        }
	    });
	}

	function review_del(num){
	   var num = num;
	   $.ajax({
	         url: "review_del",
	          type: "POST",
	          data:{
	             num:num
	          },success: function(){
	             $("#reviewDiv"+num).remove();
	          },
	          error: function() {
	              alert("리뷰 삭제 실패");
	          }
	   });
	}
	
	
	
	
</script>

	<script>
var a = "${mchk}";
document.getElementById("flag").value=a;


if(a==="true"){
	document.getElementById("btncheck1").checked=true;
}else{
	document.getElementById("btncheck1").checked=false;
}

function inmarking() {
	var a= document.getElementById("flag").value;
	if(a === "true"){
		var c_num = $("#c_num").val();
		$.ajax({
		    url: "delete_marking",
		    type: "POST",
		    data: {
		    	c_num:c_num
		    }, success: function() {
		    	 $('#btncheck1').prop('checked', false);
		    	 $('#flag').val("false");
		    },
		    error: function() {
		        alert("실패");
		    }
		});
	}else{
		var c_num = $("#c_num").val();
		$.ajax({
		    url: "insert_marking",
		    type: "POST",
		    data: {
		    	c_num:c_num
		    }, success: function() {
		    	 $('#btncheck1').prop('checked', true);
		    	 $('#flag').val("true");
		    },
		    error: function() {
		        alert("실패");
		    }
		});
	}
}

</script>

</body>
</html>
