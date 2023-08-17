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
							<h3 class="text-center font-weight-light my-4">회원가입</h3>
						</div>
						<div class="card-body">
							<form action="join_save" method="post" id="join_save">
								<div class="row mb-0">

									<div class="col-md-9">
										<div class="form-floating mb-3 mb-md-3">
											<input class="form-control" id="inputId" type="text"
												placeholder="Enter your first name" name="id" /> <label
												for="inputId">아이디 최소 8글자 최대 20글자</label>
										</div>
									</div>

									<div class="col-md-3">
										<div class="form-floating mb-3 mb-md-3" id="idBtn">
											<input type="button" id="dupleId" onclick="checkId()" class="btn btn-dark"
												value="중복체크">
										</div>
									</div>
									<span id="id_already"></span> <span id="id_ok"></span>
									
									<div class="col-md-9">
										<div class="form-floating mb-3 mb-md-3">
											<input class="form-control" id="inputMail" type="text"
												placeholder="Enter your first name" name="email"/> <label
												for="inputMail">이메일</label>
										</div>
									</div>

									<div class="col-md-3">
										<div class="form-floating mb-3 mb-md-3">
											<input type="button" onclick="chkMail()" class="btn btn-dark"
												value="코드 보내기">
										</div>
									</div>

									<div class="col-md-9">
										<div class="form-floating mb-3 mb-md-3">
											<input class="form-control" id="inputCode" type="text"
												placeholder="Enter your first name" name="inputCode" /> <label
												for="inputCode">코드입력</label>
										</div>
									</div>

									<div class="col-md-3">
										<div class="form-floating mb-3 mb-md-3">
											<input type="hidden" id="code11" value="${chkCode }"
												><input type="button"
												onclick="codeChk()" class="btn btn-dark" value="본인 확인">
										</div>


									</div>
								</div>

								<div class="row mb-3">
									<div class="col-md-0">
										<div class="form-floating">
											<input class="form-control" id="inputName" type="text"
												placeholder="Enter your last name" name="mname"> <label
												for="inputName">이름</label>
										</div>
									</div>
								</div>
								<div class="form-floating mb-3">
									<input class="form-control" id="inputNickname" name="nick_name"
										type="text" placeholder="Enter your nick_name" /> <label
										for="inputNickname">닉네임</label>
								</div>
								<div class="row mb-3">
									<div class="col-md-6">
										<div class="form-floating mb-3 mb-md-0">
											<input class="form-control" name="pw" id="inputPassword"
												type="password" placeholder="Create a password" /> <label
												for="inputPassword">비밀번호 숫자,특수문자 포함.8~20글자  </label>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-floating mb-3 mb-md-0">
											<input class="form-control" id="inputPasswordConfirm"
												type="password" placeholder="Confirm password" /> <label
												for="inputPasswordConfirm">비밀번호 확인</label>
										</div>
									</div>
								</div>
								<div class="mt-4 mb-0">
									<div class="d-grid">
										<input type="button" id="joinBtn" value="가입" class="btn btn-dark" onclick="chk()"disabled >
									</div>
								</div>
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
	
	var idFlag=false;
	var pwFlag=false;
	var codeFlag=false;
	
	var regABC = new RegExp(/a-zA-Z/g);
	var regNum = new RegExp(/0-9/g);
	var regSign = new RegExp(/\~\`\!\@\#\$\%\^\&\*\(\)\-\_\=\+/g);
	
	
	function chk(){
		var pw = $("#inputPassword").val();
		var pwConfirm=$("#inputPasswordConfirm").val();
		if(pw==pwConfirm){
			if(pw.length >=8 && pw.length<=20){
				if(regABC.test(pw)){
					alert('비밀번호는 영어, 숫자, 특수문자를 포함해야 하고, 길이는 8~20 이어야 합니다.')
					return null;
				}
				if(regNum.test(pw)){
					alert('비밀번호는 영어, 숫자, 특수문자를 포함해야 하고, 길이는 8~20 이어야 합니다.')
					return null;
				}
				if(regSign.test(pw)){
					alert('비밀번호는 영어, 숫자, 특수문자를 포함해야 하고, 길이는 8~20 이어야 합니다.')
					return null;
				}
				
				document.getElementById('join_save').submit();
			}else{
				alert('비밀번호는 영어, 숫자, 특수문자를 포함해야 하고, 길이는 8~20 이어야 합니다.')
				return null;
			}
		}else{
			alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.')
			return null;
		}
		
		
	}
	
	
		function checkId() {
			var id = $('#inputId').val(); //id값이 "id"인 입력란의 값을 저장
			if(id.length>=8 && id.length<=20){
			}else{
				alert('사용불가능한 길이입니다.')
				return null;
			}
			
			$.ajax({
				url : "idCheck", //Controller에서 요청 받을 주소
				type : "post", //POST 방식으로 전달
				data : {
					id : id
				},
				dataType : 'json',
				success : function(cnt) { //컨트롤러에서 넘어온 cnt값을 받는다 
					if (cnt == 0) { //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
						$("#id_already").html('');
						$("#id_ok").html('사용가능합니다.');
						document.getElementById("inputId").readOnly=true;
						document.getElementById("dupleId").remove();
						
						var htmlContent = 
							'<input type="button" id="changeId" onclick="cngId()" class="btn btn-dark"'+
												'value="아이디 변경">';
						$("#idBtn").append(htmlContent);
						
						
						idFlag=true;
						if(idFlag==true && codeFlag==true){
							$("#joinBtn").disabled=false;
						}
					} else { // cnt가 1일 경우 -> 이미 존재하는 아이디
						$('#id').val('');
						$("#id_ok").html('');
						$("#id_already").html('이미 사용중인 아이디입니다.');
					}
				},
				error : function() {
					alert("에러입니다");
				}
			})
		}
		
		function cngId(){
			$("#id_ok").html('');
			idFlag=false;
			document.getElementById("inputId").readOnly=false;
			document.getElementById("changeId").remove();
			document.getElementById('joinBtn').disabled=true;
			var htmlContent = 
				'<input type="button" id="dupleId" onclick="checkId()" class="btn btn-dark"'+
												'value="중복체크">';
			$("#idBtn").append(htmlContent);
		}
		
		function chkMail() {
			var tomail = $("#inputMail").val();
			if (tomail == '') {
				alert('이메일을 입력해야 합니다.')
				return null;
			}

			$.ajax({
				url : "sendmail",
				type : "post",
				data : {
					tomail : tomail
				},
				success : function(result) {
					$("#code11").val(result)
				},
				error : function() {
					alert("보안코드 전송에 실패했습니다.")
				}
			})
		}

		function codeChk() {
			if ($("#inputCode").val() == $("#code11").val()) {
				alert("코드 일치")
				codeFlag=true;
				if(idFlag==true && codeFlag==true){
					document.getElementById('joinBtn').disabled=false;
				}
			} else {
				alert("코드 불일치")
			}
		}
	</script>
</body>
</html>