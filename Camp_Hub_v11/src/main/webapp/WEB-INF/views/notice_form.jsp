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
	<script src="https://cdn.tiny.cloud/1/ir6ub79jquz8ba41zng3dwbd6i1tsozzwu5u5lny6kthn8dg/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
  <script src="<%=request.getContextPath()%>/resources/js/wiziwig.js"></script>

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
						<div class="col-lg-7">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">공지 작성하기</h3>
								</div>
								<div class="card-body">
									<form action="notice_save" method="post" id="notice_save">
										<div class="row mb-0">
											<div class="col-md-0">
												<div class="form-floating mb-3 mb-md-3">
													<input class="form-control" id="inputTitle" type="text"
														placeholder="Enter your id" name="title" /> <label
														for="inputTitle">제목</label>
												</div>
											</div>
										</div>
										<div class="row mb-0">
											<div class="col-md-0">
												<div class="form-floating mb-3 mb-md-3">
													<textarea id="inputCon" placeholder="내용"></textarea>
												</div>
											</div>
										</div>
										<div class="mt-4 mb-0">
											<div class="d-grid">
												<input type="button" class="btn btn-dark btn-block"
													value="글쓰기" onclick="chk()">
											</div>
										</div>
										<input type="hidden" name="n_con" id="inCon"value="">
									</form>
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
<script>
	function chk(){
		
		var content = tinymce.get("inputCon").getContent();
		
		var title= document.getElementById('inputTitle').value;
		var n_con= content.replace(/<p>/g, "").replace(/<\/p>/g, "");
		document.getElementById('inCon').value=n_con;

		var flag=false;
		
		if(title==''){
			flag=true;
		}
		if(n_con==''){
			flag=true;
		}
		
		if(flag){
			alert('제목과 내용은 반드시 입력해야 합니다.')
		}else{
			document.getElementById('notice_save').submit();
		}
	}

</script>