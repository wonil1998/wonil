<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Register - SB Admin</title>
        <link href="<%=request.getContextPath()%>/resources/css/styles.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">내정보 보기</h3></div>
                                    <div class="card-body">
                                        
                                            <div class="row mb-3">
                                                <div class="col-md-0">
                                                    <div class="form-floating mb-3 mb-md-3">
                                                        <input class="form-control" id="disabledId" type="text" placeholder="your id" value="${id}" disabled/>
                                                        <label for="disabledId">아이디</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-0">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="disabledName" type="text" placeholder="your name" value="${mname}" disabled/>
                                                        <label for="inputName">이름</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-0">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="disabledPoint" type="text" placeholder="your name" value="${point}" disabled/>
                                                        <label for="inputName">포인트</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-0">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="disabledGrade" type="text" placeholder="your name" value="${grade}" disabled/>
                                                        <label for="inputName">회원 등급</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-0">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="disabledIndate" type="text" placeholder="your name" value="${indate}" disabled/>
                                                        <label for="inputName">가입 날짜</label>
                                                    </div>
                                                </div>
                                            </div>
                                        <form action="nick_name_update" method="post">
											<div class="row mb-3">
                                                <div class="col-md-9">
                                                    <div class="form-floating mb-3 mb-md-3">
                                                        <input class="form-control" id="input_nick_name" type="text" placeholder="Enter your nick_name" name="nick_name" value="${nick_name}"/>
                                                        <label for="input_nick_name">변경할 닉네임 입력</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-floating mb-3 mb-md-3">
                                                        <input type="submit" class="btn btn-dark" value="닉네임 변경">
                                                    </div> 
                                                </div>
                                            </div>
                                        </form>
                                            <div class="row mb-3">
                                                <div class="col-md-9">
                                                    <div class="form-floating mb-3 mb-md-3">
                                                        <input class="form-control" id="inputPw" type="text" placeholder="Enter your passwd"/>
                                                        <label for="pw">현재 비밀번호 입력</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-floating mb-3 mb-md-3">
                                                        <input type="button" class="btn btn-dark" onclick="pwChk()" value="비밀번호 변경">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                            	<div class="col-md-3">
                                            		<button class="btn btn-dark" type="button" onclick="delAccount()">회원 탈퇴</button>
                                            	
                                            	</div>
                                            </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
        <!-- footer -->
        <jsp:include page="footer.jsp" flush="true"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="<%=request.getContextPath()%>/resources/js/scripts.js"></script>
    </body>
</html>
