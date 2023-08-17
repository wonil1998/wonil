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
<link href="<%=request.getContextPath()%>/resources/css/styles.css"
	rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/css/css.css"
	rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/dataTable.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/ajax.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-latest.min.js"
	type="application/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/hangjungdong.js"></script>

<script>


function searchCamp() {
	var c_name = document.getElementById("inword").value;
	if (c_name == '') {
		alert("검색어를 입력하세요.");
	} else {
		$
				.ajax({
					url : "campSearchWord",
					type : "post",
					data : {
						c_name : c_name
					},
					dataType : 'json',
					success : function(clist) {
						var productList = $('#product-list');

						if (clist == null || clist.length === 0) {
							var msg = document.getElementById("msg");
							msg.innerHTML = '일치하는 결과가 없습니다.';
							productList.empty();

						} else {
							var msg = document.getElementById("msg");
							msg.innerHTML = '';

							productList.empty();
							clist
									.forEach(function(camp) {
										var productCard = $('<div class="col-lg-4 mt-4 text-left btn"></div>');
										var container = $('<div class="card" style="width: 18rem;"></div>');
							            var productImg = $('<img class="card-img-top" alt="Card image cap">').attr('src', 'http://localhost:8088/camp_hub/download?filename=' + camp.filename);
										var productContents = $('<div class="card-body"></div>');
										var productName = $('<h5 class="card-title">'
												+ camp.c_name + '</h5>');
										var productPrice = $('<h5 class="card-price">'
												+ camp.c_price + '</h5>');
										var productAddr = $('<h5 class="card-addr">'
												+ camp.addr_do
												+ '&nbsp'
												+ camp.addr_si + '</h5>');
										productCard
												.on(
														'click',
														function() {
															location.href = '<%=request.getContextPath()%>/detailCamp?num='
																	+ camp.num;
														});
										container.append(productImg);
										container.append(productContents);
										productContents.append(productName);
										productContents.append(productPrice);
										productContents.append(productAddr);
										productCard.append(container);
										productList.append(productCard);
									});
						}
					},
					error : function() {
						alert("에러입니다");
					}
				});
	}
}

$(document).ready(function() {
	  var selectedTypes = []; 

	  $('input[name="c_type"]').on('change', function() {
	    if ($(this).is(':checked')) {
	      var c_type = $(this).val();
	      selectedTypes.push(c_type); 
	    } else {
	      var c_type = $(this).val();
	      var index = selectedTypes.indexOf(c_type);
	      if (index !== -1) {
	        selectedTypes.splice(index, 1); 
	      }
	    }
	    if(selectedTypes.length > 0){
	    	 $.ajax({
	 	        url: "campSearchByType",
	 	        type: "post",
	 	        data: {
	 	          c_type: selectedTypes
	 	        },
	 	        dataType: 'json',
	 	        success: function(clist) {
	 	          var productList = $('#product-list');

	 	          if (clist == null || clist.length === 0) {
	 	            var msg = document.getElementById("msg");
	 	            msg.innerHTML = '일치하는 결과가 없습니다.';
	 	           productList.empty();
	 	           
	 	          } else {
	 	            var msg = document.getElementById("msg");
	 	            msg.innerHTML = '';

	 	            productList.empty();
	 	            clist.forEach(function(camp) {
	 	              var productCard = $('<div class="col-lg-4 mt-4 text-left btn"></div>');
	 	              var container = $('<div class="card" style="width: 18rem;"></div>');
	 	              var productImg = $('<img class="card-img-top" alt="Card image cap">').attr('src', 'http://localhost:8088/camp_hub/download?filename=' + camp.filename);
	 	              var productContents = $('<div class="card-body"></div>');
	 	              var productName = $('<h5 class="card-title">' + camp.c_name + '</h5>');
	 	              var productPrice = $('<h5 class="card-price">' + camp.c_price + '</h5>');
	 	              var productAddr = $('<h5 class="card-addr">' + camp.addr_do +'&nbsp'+ camp.addr_si + '</h5>');
	 	              productCard.on('click', function() {
	 	            	   location.href = 'http://localhost:8088/camp_hub/detailCamp?num=' + camp.num;
			            });
	 	              container.append(productImg);
	 	              container.append(productContents);
	 	              productContents.append(productName);
	 	              productContents.append(productPrice);
	 	              productContents.append(productAddr);
	 	              productCard.append(container);
	 	              productList.append(productCard);
	 	            });
	 	          }
	 	        },
	 	        error: function() {
	 	          alert("에러입니다");
	 	        }
	 	      });
	    }else{
	    	window.location.href = "http://localhost:8088/camp_hub/camp_list";
	    }
	  });
	});
	      

</script>
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
		<div class="input-group mt-3">
			<a href="camp_search" class="btn btn-outline-secondary ms-5">지도검색
			</a> <input type="text" value="지역검색 " size="15" align="right"
				disabled="disabled"><select name="addr_do" id="sido">
				<option value="">도 선택</option>
			</select> <select name="addr_si" id="sigugun">
				<option value="">시 선택</option>
			</select> <input id="inword" type="text">
			<button class="btn btn-outline-secondary" onclick="searchCamp()">검색</button>
		</div>

		<!-- 체크박스  카테고리 추가-->

		<div class="col">
			<p class="mb-0 mt-4">캠핑장 타입/시설</p>
			<c:forEach var="t" items="${ct}">
				<input type="checkbox" class="btn-check" name="c_type"
					id="${t.c_type}" value="${t.c_type}" autocomplete="off">
				<label class="btn btn-outline-primary m-1" for="${t.c_type}">${t.name}</label>
			</c:forEach>
		</div>

		<h1 id="msg"></h1>
		<!-- Contents 카드 -->
		<div class="container-fluid px-4">
			<div id="product-list" class="row">
			<c:if test = "${clist != null}"> 
				<!-- 반복문 -->
				<c:forEach var="camp" items="${clist}">
					<div class="col-lg-4 mt-4 text-left btn"
						onclick="location.href='<%=request.getContextPath()%>/detailCamp?num=${camp.num}';">
						<div class="card" style="width: 18rem;">
							<img class="card-img-top" height="200"
								src="<%=request.getContextPath()%>/download?filename=${camp.filename}"
								alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">${camp.c_name}</h5>
								<h5 class="card-price">${camp.c_price} 원</h5>
								<h5 class="card-addr">${camp.addr_do}&nbsp${camp.addr_si}</h5>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- /반복문 -->
			</c:if>
			<c:if test = "${clist == null}">
				"등록된 캠핑장이 없습니다."
			</c:if>
			</div>
		</div>
	</main>
	<!-- footer -->
	<jsp:include page="footer.jsp" flush="true" />
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>

	<script>
	jQuery(document).ready(function() {
		  jQuery.each(hangjungdong.sido, function(idx, code) {
		    jQuery('#sido').append(fn_option(code.sido, code.codeNm));
		  });

		  jQuery('#sido').change(function() {
		    jQuery('#sigugun').show();
		    jQuery('#sigugun').empty();
		    jQuery('#sigugun').append(fn_option('', '선택'));

		    jQuery.each(hangjungdong.sigugun, function(idx, code) {
		      if (jQuery('#sido').val() == code.sido)
		        jQuery('#sigugun').append(fn_option(code.sigugun, code.codeNm));
		    });

		    if (jQuery('#sido').val() == '36') {
		      jQuery('#sigugun').hide();
		      jQuery('#sigugun option:eq(1)').attr('selected', 'selected');
		      jQuery('#sigugun').trigger('change');
		    }
		  });

		  jQuery('#sigugun').change(function() {
		    jQuery('#dong').empty();
		    var sidoVal = jQuery('#sido').val();
		    var sigugunVal = jQuery('#sigugun').val();
		    var sidoIdx = hangjungdong.sido.findIndex(function(i) {
		      return i.sido == sidoVal;
		    });
		    var sigugunIdx = hangjungdong.sigugun.findIndex(function(i) {
		      return i.sigugun == sigugunVal && i.sido == sidoVal;
		    });
		    var addr_do = hangjungdong.sido[sidoIdx].codeNm;
		    var addr_si = hangjungdong.sigugun[sigugunIdx].codeNm;
			
		    $.ajax({
		      url: "http://localhost:8088/camp_hub/campSearchList",
		      type: "post",
		      data: {
		        addr_do: addr_do,
		        addr_si: addr_si
		     
		      },
		      dataType: 'json',
		      success: function(clist) {
		        var productList = $('#product-list');

		        if (clist == null || clist.length === 0) {
		          var msg = document.getElementById("msg");
		          msg.innerHTML = '일치하는 결과가 없습니다.';
		          productList.empty();
		        } else {
		          var msg = document.getElementById("msg");
		          msg.innerHTML = '';
		          productList.empty();
		          clist.forEach(function(camp) {
		            var productCard = $('<div class="col-lg-4 mt-4 text-left btn"></div>');
		            var container = $('<div class="card" style="width: 18rem;"></div>');
		            var productImg = $('<img class="card-img-top" alt="Card image cap">').attr('src', 'http://localhost:8088/camp_hub/download?filename=' + camp.filename);
		            var productContents = $('<div class="card-body"></div>');
		            var productName = $('<h5 class="card-title">' + camp.c_name + '</h5>');
		            var productPrice = $('<h5 class="card-price">' + camp.c_price + '</h5>');
		            var productAddr = $('<h5 class="card-addr">' + camp.addr_do + '&nbsp' + camp.addr_si + '</h5>');
		            productCard.on('click', function() {
		                location.href = 'http://localhost:8088/camp_hub/detailCamp?num=' + camp.num;
		            });
		            
		            
		          
																				container
																						.append(productImg);
																				container
																						.append(productContents);
																				productContents
																						.append(productName);
																				productContents
																						.append(productPrice);
																				productContents
																						.append(productAddr);
																				productCard
																						.append(container);
																				productList
																						.append(productCard);
																			});
																}
															},
															error : function() {
																alert("에러입니다");
															}
														});
											});
						});

		function fn_option(code, name) {
			return '<option value="' + code + '">' + name + '</option>';
		}
	</script>

</body>
</html>
