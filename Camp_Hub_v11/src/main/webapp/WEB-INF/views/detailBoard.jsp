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
                           <h3 class="text-center font-weight-light my-4">글 상세보기</h3>
                        </div>
                        <div class="card-body">
                              <div class="row mb-0">
                                 <div class="col-md-0">
                                    <div class="form-floating mb-3 mb-md-3">
                                       <input class="form-control" id="inputTitle" type="text" name="title" readonly value="${bvo.title}"/>
                                    </div>
                                 </div>
                              </div>
                              <div class="row mb-3">
                              			<input  type="hidden" id="b_num" value="${bvo.num}"/>
                                 <div class="col-md-3">
                                       <input class="form-control" name="nick_name" id="nick_name" type="text" value="${bvo.nick_name}" />
                                 </div>
                                 <div class="col-md-3">
                                       <input class="form-control" value="${bvo.grade}" readonly/>
                                 </div>
                                 <div class="col-md-3">
                                       <input class="form-control" value="${bvo.view_cnt}" readonly/>
                                 </div>
                                 <div class="col-md-3">
                                       <input class="form-control" value="${bvo.indate}" readonly/>
                                 </div>
                              </div>
                              <div class="row mb-0">
                                 <div class="col-md-0">
                                    <div class="form-floating mb-3 mb-md-3">
									  <div class="form-control custom-textarea" style="height:300px">${bvo.con }
									   </div>

									  <a class="btn btn-info mt-3" onclick="lovePlus(${bvo.love})">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
										  <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
										</svg>&nbsp;좋아요 * <span id="loveCnt">${bvo.love}</span>
										</a>
                                    </div>
                                 </div>
                              </div>
                              
									<c:if test="${id eq bvo.m_id || grade eq 'admin'}">
										<div class="row mb-3">
											<div class="col-md-0">
												<form action="detailBoard_mod_form" method="post">
													<input type="hidden" name="num" value="${bvo.num }">
													<input type="hidden" name="b_type" value="${bvo.b_type }">
													<input type="hidden" name="title" value="${bvo.title }">
													<input type="hidden" name="con" value='${bvo.con }'>
													<input class="btn btn-dark btn-sm" type="submit" value="수정">
												</form>

											</div>
										</div>
										<div class="row mb-3">
											<div class="col-md-0">
												<form action="detailBoard_del" method="get">
													<input type="hidden" name="num" value="${bvo.num }">
													<input type="hidden" name="b_type" value="${bvo.b_type }">
													<input class="btn btn-dark btn-sm" type="submit" value="삭제">
												</form>

											</div>
										</div>
									</c:if>
									
									
									<c:forEach var="i" items="${flist}" varStatus="status">
										<a href="download?filename=${i.filename }">
											<p>첨부파일 ${status.count }</p>
										</a>
									</c:forEach>                              
                              
                              
                              <input type="hidden" name="con" id="inCon"value="">
                              <input type="hidden" name="b_type" value="${b_type }">
                              <div class="p-1 w-100 bg-dark row ms-0 rounded-pill"></div>
                              <div class="row mb-0" id="replyDiv">
                               <c:forEach var="i" items="${replist}">
                                    <div class="row form-floating mt-3" id="replyDiv${i.num}">
	                                    <div class="col-10">
		                                    <span>${i.nick_name}</span>&nbsp;<span class="vr"></span>
		                                    
		                                    <span>${i.grade}</span>&nbsp;<span class="vr"></span>&nbsp;<span>${i.indate}</span>
										<c:if test="${id==i.m_id}">
		                                	<button class="btn btn-dark btn-sm" onclick="reply_mod(${i.num})">수정</button>
		                                	<button class="btn btn-dark btn-sm" onclick="reply_del(${i.num})">삭제</button>
		                                </c:if>
		                                </div>
		                                <a class="btn btn-success btn-sm col" onclick="replyLovePlus(${i.num},'${i.nick_name}')">추천 <span id="replyNum${i.num}">${i.love}</span></a>
 										<c:if test="${id == i.m_id}">
		                                	<textarea class="form-control custom-textarea" type="text" id="replyText${i.num }">${fn:replace(i.con,cn,br)}</textarea>
		                                </c:if>
		                                <c:if test="${id != i.m_id}">
                                       		<textarea class="form-control custom-textarea" type="text" readonly>${fn:replace(i.con,cn,br)}</textarea>
                                        </c:if>
                                    </div>
                                </c:forEach>
                               </div>
                               
                                  <div class="row mb-3 form-floating mt-3">
									<div class="col-md-10">
								        <div class="form-control" contenteditable="true" type="text" id="replyCon" name="replyCon"></div>
								    </div>
								    <div class="col-md-auto">
								        <button class="btn btn-dark" onclick="inputReply()">입력</button>
								    </div>
                                  </div>

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