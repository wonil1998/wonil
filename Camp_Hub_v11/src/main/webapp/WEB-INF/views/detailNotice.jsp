<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<title>게시판 상세보기</title>
<link href="<%=request.getContextPath()%>/resources/css/styles.css"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
  <script src="<%=request.getContextPath()%>/resources/js/wiziwig.js"></script>
  <script src="<%=request.getContextPath()%>/resources/js/ajax.js"></script>
<style>
    .custom-textarea {
        height: 1000px;
    }
</style>
</head>
</head>
<body class="bg-dark">
    <!-- top -->
	<c:if test="${id != null}">
		<jsp:include page="afterTop.jsp" flush="true"/>
	</c:if>
	<c:if test="${id==null}">
		<jsp:include page="beforeTop.jsp" flush="true"/>
	</c:if>
    <!-- side -->
    <jsp:include page="side.jsp" flush="true"/>
    <!-- main -->
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-10">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">공지 상세보기</h3>
								</div>
								<div class="card-body">
									<div class="row mb-0">
										<div class="col-md-0">
											<div class="form-floating mb-3 mb-md-3">
												<input class="form-control" id="inputTitle" type="text"
													name="title" aria-label="readonly input example"
													value="${nvo.title }" readonly />
											</div>
										</div>
									</div>
									<div class="row mb-3">
										<div class="col-md-3">
											<input class="form-control" name="nick_name" type="text"
												value="관리자" />
										</div>
										<div class="col-md-3">
											<input class="form-control" value="관리자" readonly />
										</div>
										<div class="col-md-3">
											<input class="form-control" value="${nvo.view_cnt }" readonly />
										</div>
										<div class="col-md-3">
											<input class="form-control" value="${nvo.indate }" readonly />
										</div>
									</div>
									<div class="row mb-0">
										<div class="col-md-0">
											<div class="form-floating mb-3 mb-md-3">
												<div class="form-control custom-textarea"
													style="height: 400px">${nvo.n_con }</div>

											</div>
										</div>
									</div>

									<c:if test="${grade eq 'admin' }">
										<div class="row mb-3">
											<div class="col-md-0">
												<form action="notice_mod_form" method="post">
													<input type="hidden" name="num" value="${nvo.num }">
													<input type="hidden" name="title" value="${nvo.title }">
													<input type="hidden" name="n_con" value="${nvo.n_con }">
													<input class="btn btn-dark btn-sm" type="submit" value="수정">
												</form>
											</div>
										</div>
										<div class="row mb-3">
											<div class="col-md-0">
												<form action="notice_del" method="get">
													<input type="hidden" name="num" value="${nvo.num }">
													<input class="btn btn-dark btn-sm" type="submit" value="삭제">
												</form>

											</div>
										</div>
									</c:if>

									<input type="hidden" name="n_con" id="inCon" value=""> 
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
              <!-- footer -->
        <jsp:include page="footer.jsp" flush="true"/>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"></script>
   <script src="<%=request.getContextPath()%>/resources/js/scripts.js"></script>
</body>
</html>