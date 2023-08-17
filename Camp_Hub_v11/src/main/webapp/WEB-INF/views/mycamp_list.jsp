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
<link href="<%=request.getContextPath()%>/resources/css/home.css"
	rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
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
		<div class="container-fluid px-4">
			<div id="product-list" class="row">
				<!-- 반복문 -->
				<c:forEach var="camp" items="${mclist}">
					<div class="col-lg-4 mt-4 text-left btn"
						onclick="location.href='<%=request.getContextPath()%>/detailCamp?num=${camp.num}';">
						<div class="card" style="width: 18rem;">
							<img class="card-img-top"
								src="<%=request.getContextPath()%>/download?filename=${camp.filename}"
								alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">${camp.c_name}</h5>
								<h5 class="card-price">${camp.c_price}</h5>
								<h5 class="card-addr">${camp.addr_do}&nbsp;${camp.addr_si}</h5>
							</div>
						</div>
						<div>
						<a	href="camp_mod_form?num=${camp.num}" class="btn btn-outline-primary" >수정</a>
						<a	href="camp_del?num=${camp.num}" class="btn btn-outline-danger">삭제</a>
						</div>
					</div>
				</c:forEach>
				<!-- /반복문 -->
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

</body>
</html>
