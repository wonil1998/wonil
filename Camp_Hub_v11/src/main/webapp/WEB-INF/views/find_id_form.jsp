<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>회원가입</title>
<link href=".//resources/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.id_ok, .id_already {
	display: none;
}
</style>
</head>
<body class="bg-light">
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
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-7">
					<div class="card shadow-lg border-0 rounded-lg mt-5">
						<div class="card-header">
							<h3 class="text-center font-weight-light my-4">아이디 찾기</h3>
						</div>
						<div class="card-body">
							<form action="idSearch" method="post" id="idSearch">
								<div class="row mb-0">

									<div class="col-md-9">
										<div class="form-floating mb-3 mb-md-3">
											<input class="form-control" id="inputMname" type="text"
												placeholder="Enter your first name" name="mname" /> <label
												for="inputName">이름</label>
										</div>
									</div>
									<div class="col-md-9">
										<div class="form-floating mb-3 mb-md-3">
											<input class="form-control" id="inputMail" type="text"
												placeholder="Enter your first name" /> <label
												for="inputMail">이메일</label>
										</div>
									</div>

									<div class="col-md-3">
										<div class="form-floating mb-3 mb-md-3">
											<input type="button" onclick="chkMail()" class="btn btn-dark"
												value="코드 보내기">
										</div>
									</div>

									<div hidden="true" id="codeChk"></div>

									<div class="col-md-9">
										<div class="form-floating mb-3 mb-md-3">
											<input class="form-control" id="inputCode" type="text"
												placeholder="Enter your first name" name="inputCode" /> <label
												for="inputCode">코드입력</label>
										</div>
									</div>

									<div class="col-md-3">
										<div class="form-floating mb-3 mb-md-3">
											<input type="text" id="code11" value="${chkCode }"
												hidden="true"><input type="button"
												onclick="codeChk()" class="btn btn-dark" value="본인 확인">
										</div>
										
									</div>
								</div>
								<span id="id_ok"></span>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!-- footer -->
	<jsp:include page="footer.jsp" flush="true" />
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>

	<script src=".//resources/js/scripts.js"></script>
	<script>
		function chkMail() {
			var tomail = $("#inputMail").val();
			var mname = $("#inputMname").val();
			if (tomail == '') {
				alert('이메일을 입력해야 합니다.')
				return null;
			}
			$.ajax({
				url : "id_mailChk",
				type : "post",
				data : {
					tomail : tomail,
					mname:mname
				},
				success : function(result) {
					if(result==1){
						sendMail();
					}else{
						alert('이름 또는 이메일을 정확히 입력해 주십시오')
					}
				},
				error : function() {
					alert("이메일 검색에 실패했습니다.")
				}
			})
			
		}
		
		function sendMail(){
			var tomail = $("#inputMail").val();
			$.ajax({
				url : "sendmail",
				type : "post",
				data : {
					tomail : tomail
				},
				success : function(result) {
					document.getElementById('codeChk').hidden = false;
					$("#code11").val(result)
				},
				error : function() {
					alert("보안코드 전송에 실패했습니다.")
				}
			})			
		}

		function codeChk() {
			var tomail = $("#inputMail").val();
			var mname = $("#inputMname").val();
			if ($("#inputCode").val() == $("#code11").val()) {
				alert("코드 일치")
				
				$.ajax({
					url : "find_id",
					type : "post",
					data : {
						tomail : tomail,
						mname:mname
					},
					success : function(result) {
						document.getElementById('codeChk').hidden = false;
						$("#id_ok").html(mname+"님의 아이디는 "+result+" 입니다.")
					},
					error : function() {
						alert("아이디 찾기에 실패했습니다.")
					}
				})	
			} else {
				alert("코드 불일치")
			}
		}
		


	</script>
</body>
</html>