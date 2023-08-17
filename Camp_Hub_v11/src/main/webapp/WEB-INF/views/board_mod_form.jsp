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
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/dataTable.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
<script
	src="https://cdn.tiny.cloud/1/atbs9w5cunjf1urjx30o5f0b331n12qhl2oflzao8qohbqa0/tinymce/5/tinymce.min.js"
	referrerpolicy="origin"></script>
<script src="<%=request.getContextPath()%>/resources/js/wiziwig.js"></script>
</head>
<body class="sb-nav-fixed">
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
									<h3 class="text-center font-weight-light my-4">글 수정하기</h3>
								</div>
								<div class="card-body">
									<form action="detailBoard_mod" method="post" id="detailBoard_mod" encType="multipart/form-data">
										<div class="row mb-0">
											<div class="col-md-0">
												<div class="form-floating mb-3 mb-md-3">
				                                       <input class="form-control" id="inputTitle" type="text"
				                                          placeholder="Enter your id" name="title" value="${bvo.title}"/> <label
				                                          for="inputTitle">제목</label>
												</div>
											</div>
										</div>
										<div class="row mb-0">
											<div class="col-md-0">
												<div class="form-floating mb-3 mb-md-3">
													<textarea id="inputCon" contenteditable="true">${bvo.con }</textarea>
												</div>
											</div>
										</div>
										<table width="90%" id="fileTable">
											<c:forEach var="i" items="${flist}" varStatus="status">
												<tr id="fileList_${status.count }">
													<td><span>첨부파일 ${status.count } </span></td>
													<td><span id="filename_${status.count }">${i.filename }</span></td>
													<td class="btnDel">
														<input type="hidden" value="${i.num }" name="updateNum"class="updateNum">
														<input type="hidden" value="${i.filename }" name="updateFilename" class="updateFilename">
														<input type="hidden" value="" name="deleteFilename" class="deleteFilename">
														<input type="button" value="삭제" id="file_del_${status.count}"
															class="btn btn-dark btn-block" onclick="filedata_del(${status.count})">
													</td>
												</tr>
											</c:forEach>
										</table>

										<div id="tagArea">
											<input type="button" class="btn btn-dark btn-block" value="파일 추가하기" onclick="create_inputTag()"><br>
										</div>

										<div class="mt-4 mb-0">
											<div class="d-grid">
												<input type="button" class="btn btn-dark btn-block"
													value="글수정" onclick="chk()">
											</div>
										</div>
										<input type="hidden" name="con" id="inCon" value=''> <input
											type="hidden" name="num" value="${bvo.num }"> <input
											type="hidden" name="b_type" value="${b_type }">
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
	      var con= content.replace(/<p>/g, "").replace(/<\/p>/g, "");
	      document.getElementById('inCon').value=con;

		if($("#fileTable").children.length==2){
			
			var a = '<input type="file" name="file" value="null" hidden="true">'
			var b = '<input type="text" name="deleteFilename" value="" hidden="true">'
			var c = '<input type="text" name="deleteNum" value="-1" hidden="true">'
			$("#fileTable").append(b);
			$("#fileTable").append(c);
		}
		
		var flag=false;
		
		if(title==''){
			flag=true;
		}
		if(con==''){
			flag=true;
		}
		
		if(flag){
			alert('제목과 내용은 반드시 입력해야 합니다.')
		}else{
			document.getElementById('detailBoard_mod').submit();
		}
	}
	
	  function create_inputTag() {
	         var tagArea = document.getElementById('tagArea');
	         var new_tag = document.createElement('input');
	         new_tag.setAttribute("type", "file");
	         new_tag.setAttribute("name", "file");
	         tagArea.appendChild(new_tag);
	      }
	  function filedata_del(fileIdx){
			var num = $(".updateNum")[fileIdx-1].value;
		 	var filename = $(".updateFilename")[fileIdx-1].value;
		 	
		 	$("#file_del_"+fileIdx).remove();
		 	var htmlContent='<input type="button" value="삭제취소" id="file_del_cancel_'+fileIdx+'"'+
				'class="btn btn-dark btn-block" onclick="filedata_del_cancel('+fileIdx+')">'
			$(".btnDel")[fileIdx-1].innerHTML+=htmlContent;
			$(".btnDel")[fileIdx-1].children[0].setAttribute("name","deleteNum");
		 	$(".btnDel")[fileIdx-1].querySelector(".deleteFilename").value=filename;
	  }
	  
	  function filedata_del_cancel(fileIdx){
		  $("#file_del_cancel_"+fileIdx).remove();
		  var htmlContent='<input type="button" value="삭제" id="file_del_'+fileIdx+'"'+
				'class="btn btn-dark btn-block" onclick="filedata_del('+fileIdx+')">'
			$(".btnDel")[fileIdx-1].innerHTML+=htmlContent;	
			$(".btnDel")[fileIdx-1].children[0].setAttribute("name","updateNum");
			$(".btnDel")[fileIdx-1].querySelector(".deleteFilename").value="";
	  }
</script>