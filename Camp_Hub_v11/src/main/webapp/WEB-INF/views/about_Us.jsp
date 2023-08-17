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
<script src="<%=request.getContextPath()%>/resources/js/ajax.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"
	type="application/javascript"></script>
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
		<img alt="" src="<%=request.getContextPath()%>/resources/img/output.png">
	</main>
	<!-- footer -->
	<jsp:include page="footer.jsp" flush="true" />
	<script src="<%=request.getContextPath()%>/resources/js/js.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resources/js/scripts.js"></script>
</body>
</html>
