<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html lang="ko">
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Register - SB Admin</title>
<link href=".//resources/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
   crossorigin="anonymous"></script>
</head>
 <body class="bg-light">
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
            <div class="container">
               <div class="row justify-content-center">
                  <div class="col-lg-7">
                     <div class="card shadow-lg border-0 rounded-lg mt-5">
                        <div class="card-header">
                           <h3 class="text-center font-weight-light my-4">내정보 변경</h3><a href="<%=request.getContextPath()%>" class="btn btn-dark">홈으로</a>
                        </div>
                        <div class="card-body">
                        
                           <form action="pw_mod_update" id='frm' method="post">
                              <div class="row mb-3">
                                 <div class="col-md-0">
                                    <div class="form-floating">
                                       <input name="pw" class="form-control" id="inputNewPw"
                                          type="password" value=""  /> <label
                                          for="inputNewPw">새 비밀번호</label>
                                    </div>
                                 </div>
                              </div>
                              <div class="row mb-3">
                                 <div class="col-md-0">
                                    <div class="form-floating">
                                       <input class="form-control" id="inputNewPwChk"
                                          type="password" value=""  /> <label
                                          for="inputNewPwChk">새 비밀번호 확인</label>
                                    </div>
                                 </div>
                              </div>

                              <div class="col-md-6">
                                 <div class="form-floating mb-3 mb-md-3">
                                    <input type="button" class="btn btn-dark" onclick="chk()" value="비밀번호 저장">
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
        <jsp:include page="footer.jsp" flush="true"/>
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"></script>
   <script src=".//resources/js/scripts.js"></script>
</body>
</html>
<script>
   function chk() {
      var inputNewPw = document.getElementById('inputNewPw');
      var inputNewPwChk = document.getElementById('inputNewPwChk');

      var flag = false;

      if (inputNewPw.value == '') {
         flag = true;
      }
      if (inputNewPwChk.value == '') {
         flag = true;
      }

      if (flag) {
         alert('모든 정보를 입력해야 합니다.')
         event.preventDefault();
      } else {
         if (inputNewPw.value == inputNewPwChk.value) {
            document.getElementById('frm').submit();
         } else {
            alert('비밀 번호를 정확히 입력해 주세요.')
            event.preventDefault();
         }
      }

   }
</script>