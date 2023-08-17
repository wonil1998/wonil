<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
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
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>메인화면</title>
        <link href="<%=request.getContextPath()%>/resources/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="<%=request.getContextPath()%>/resources/js/dataTable.js"></script>
          <script src="<%=request.getContextPath()%>/resources/js/ajax.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
          <script src="https://cdn.tiny.cloud/1/ir6ub79jquz8ba41zng3dwbd6i1tsozzwu5u5lny6kthn8dg/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
  		<script src="<%=request.getContextPath()%>/resources/js/wiziwig.js"></script>
  		<script src="<%=request.getContextPath()%>/resources/js/hangjungdong.js"></script>
        
        <style>
		    .btn-check:+.btn-outline-primary {
		        opacity: 1;
		        pointer-events: none;
		    }
		</style>
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
        <form action="camp_save" method="post" id="camp_save" encType="multipart/form-data">
			<div id="carouselExampleDark" class="carousel carousel-dark">
			  <div class="carousel-indicators">
			    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
			    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
			    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="3" aria-label="Slide 4"></button>
			    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="4" aria-label="Slide 5"></button>
			  </div>
			  <div class="carousel-inner text-center mt-3">
			    <div class="carousel-item active">
				    <div id="tagArea" class="d-grid align-items-center justify-content-center " style="height:400px;">
				    	<button type="button" class="btn btn-danger d-none" onclick="fileRemove(this.id)" id="fileRemove1">제거</button>
					    <img src="" class="mx-auto d-none" height="400">
						<input type="file" name="file1" id="newFile" hidden="true">
                		<input type="button" value="사진 선택" onclick="filedata_mod(this.id)" id="campFile1" class="form-control btn btn-danger"> 
	                 </div>
			    </div>
			    <div class="carousel-item">
				    <div id="tagArea" class="d-grid align-items-center justify-content-center " style="height:400px;">
				    	<button type="button" class="btn btn-danger d-none" onclick="fileRemove(this.id)" id="fileRemove2">제거</button>
					    <img src="" class="mx-auto d-none" height="400">
						<input type="file" name="file1" id="newFile" hidden="true">
                		<input type="button" value="사진 선택" onclick="filedata_mod(this.id)" id="campFile2" class="form-control btn btn-danger"> 
	                 </div>
			    </div>
			    <div class="carousel-item">
				    <div id="tagArea" class=" d-grid align-items-center justify-content-center " style="height:400px;">
				    	<button type="button" class="btn btn-danger d-none" onclick="fileRemove(this.id)" id="fileRemove3">제거</button>
					    <img src="" class="mx-auto d-none" height="400">
						<input type="file" name="file1" id="newFile" hidden="true">
                		<input type="button" value="사진 선택" onclick="filedata_mod(this.id)" id="campFile3" class="form-control btn btn-danger"> 
	                 </div>
			    </div>
			    <div class="carousel-item">
				    <div id="tagArea" class="d-grid align-items-center justify-content-center " style="height:400px;">
				    	<button type="button" class="btn btn-danger d-none" onclick="fileRemove(this.id)" id="fileRemove4">제거</button>
					    <img src="" class="mx-auto d-none" height="400">
						<input type="file" name="file1" id="newFile" hidden="true">
                		<input type="button" value="사진 선택" onclick="filedata_mod(this.id)" id="campFile4" class="form-control btn btn-danger"> 
	                 </div>
			    </div>
			    <div class="carousel-item">
				    <div id="tagArea" class="d-grid align-items-center justify-content-center " style="height:400px;">
				    	<button type="button" class="btn btn-danger d-none" onclick="fileRemove(this.id)" id="fileRemove5">제거</button>
					    <img src="" class="mx-auto d-none" height="400">
						<input type="file" name="file1" id="newFile" hidden="true">
                		<input type="button" value="사진 선택" onclick="filedata_mod(this.id)" id="campFile5" class="form-control btn btn-danger"> 
	                 </div>
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
		
		<hr>
		
		<div class="row ms-4">
		    <div class="col-md-5">
		        <div class="form-floating mb-3">
		            <input type="text" class="form-control" name="c_name" id="campName" placeholder="campName">
		            <label for="campName">캠핑장 이름</label>
		        </div>
		    </div>
		    <div class="col-md-5">
		        <div class="form-floating mb-3">
		            <input type="number" class="form-control" name="phone" id="campPhone" placeholder="campPhone">
		            <label for="campPhone">캠핑장 연락처</label>
		        </div>
		    </div>
			<div class="col-md-5">
				<div class="form-floating mb-3">
					<select class="form-select" name="addr_do" id="sido">
						<option value="">캠핑장 주소(도)</option>
					</select> 
					<select class="form-select" name="addr_si" id="sigugun">
						<option value="">캠핑장 주소(시/군)</option>
					</select>
				</div>
			</div>
		    <div class="col-md-5">
		        <div class="form-floating mb-3">
		            <input type="text" class="form-control" name="addr_detail" id="campAddr_detail" placeholder="campAddr_detail">
		            <label for="campAddr_detail">주소(상세)</label>
		        </div>
		    </div>
		    <div class="col-md-5">
		        <div class="form-floating mb-3">
		            <input type="number" class="form-control" name="c_price" id="campPrice" placeholder="campPrice">
		            <label for="campPrice">캠핑장 가격</label>
		        </div>
		    </div>
		    
		</div>
	

<div class="accordion" id="accordionExample">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
        	공지사항
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      <div class="accordion-body">
		 <div class="row mb-0">
		   <div class="col-md-0">
		      <div class="form-floating mb-3 mb-md-3">
		      	<input type="hidden" value="캠핑장 공지" name="title">
		         <textarea id="inputCon" name="n_con" placeholder="내용"></textarea>
		      </div>
		   </div>
		</div>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        시설여부
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
		<div class="row ms-4">
	        <div class="col">
		        <p class="mb-0 mt-4">캠핑장 타입/시설</p>
		       	  <c:forEach var="t" items="${ct}">
					  <input type="checkbox" class="btn-check" name="c_type" id="${t.c_type}" value="${t.c_type}/${t.c_group}" autocomplete="off">
					  <label class="btn btn-outline-primary m-1" for="${t.c_type}">${t.name}</label>
				  </c:forEach>
			</div>
		</div>
      </div>
    </div>
  </div>
</div>
<hr>
<div class="container">
  <div class="row">
     <div class="col-md-6" id="rcard_btn">
      <div class="card mb-3" style="max-width: 540px; height:280px;">
    		<button type="button" class="btn btn-primary h-100" onclick="cardPlus()">방 추가</button>
   		</div>
	</div>
  </div>
</div>
<hr>
		<input type="button" class="form-control btn btn-dark" onclick="campSaveBtn()" value="캠핑장 저장">
</form>
        </main>
        <!-- footer -->
        <jsp:include page="footer.jsp" flush="true"/>
        <script src="<%=request.getContextPath()%>/resources/js/js.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="<%=request.getContextPath()%>/resources/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="<%=request.getContextPath()%>/resources/assets/demo/chart-area-demo.js"></script>
        <script src="<%=request.getContextPath()%>/resources/assets/demo/chart-bar-demo.js"></script>
    </body>
</html>
<script>
var i=0;
	function cardPlus(){

		$("#rcard_btn").before(
		'<div class="col-md-6">\
	      <div class="card mb-3" style="max-width: 540px;">\
	        <div class="row g-0">\
	          <div class="col-md-5 d-grid align-items-center justify-content-center">\
			    	<img src="" class="mx-auto d-none" height="140">\
	                <input type="file" name="file2" hidden="true">\
	                <input type="button" value="사진 선택" onclick="filedata_mod(this.id)" id="roomFile'+i+'" class="btn btn-danger" name="room_filename">\
					<input type="button" value="제거" onclick="cardRemove(this.id)" class="btn btn-danger" id="roomCard'+i+'">'+ 
	          '</div>\
	          <div class="col-md-7">\
	            <div class="card-body">\
	              <div class="row">\
				    <div class="col-md-12">\
				        <div class="form-floating mb-1">\
				            <input type="text" class="form-control room_name" id="r_name" placeholder="방 이름" name="r_name">\
				            <label for="campName">방 이름</label>\
				        </div>\
				    </div>\
				    <div class="col-md-12">\
				        <div class="form-floating mb-1">\
				            <input type="number" class="form-control room_max_cnt" id="max_cnt" placeholder="최대 인원" name="max_cnt">\
				            <label for="campPhone">최대 인원</label>\
				        </div>\
				    </div>\
				    <div class="col-md-12">\
				        <div class="form-floating mb-1">\
				            <input type="number" class="form-control room_basic_cnt" id="basic_cnt" placeholder="기본 인원" name="basic_cnt">\
				            <label for="campAddr">기본 인원</label>\
				        </div>\
				    </div>\
				    <div class="col-md-12">\
				        <div class="form-floating mb-1">\
				            <input type="number" class="form-control room_price" id="r_price" placeholder="가격" name="r_price">\
				            <label for="campAddr">가격</label>\
				        </div>\
				    </div>\
				</div>\
	            </div>\
	          </div>\
	        </div>\
	      </div>\
	    </div>'
	    );
		i=i+1;
	}
	function filedata_mod(rcardFileId) {
		  var fileInput = $('#' + rcardFileId).prev();
		  fileInput.click();
		  fileInput.on('change', function(event) {
		    var file = event.target.files[0];
		    var reader = new FileReader();

		    reader.onloadend = function(e) {
		      var fileDel = $('#' + rcardFileId).prev().prev().prev();
		      var fileImg = $('#' + rcardFileId).prev().prev();
		      var fileInput = $('#' + rcardFileId).prev();
		      
		      fileDel.removeClass("d-none");
		      fileImg.removeClass("d-none");
		      fileImg.attr("src", e.target.result);
		      $('#' + rcardFileId).addClass("d-none");
		    };

		    reader.readAsDataURL(file);
		  });
		}

	function fileRemove(remove){
		  var rcardFile = $('#' + remove).next().next().next();
		  var fileInput = $('#' + remove).next().next();
		  var fileImg = $('#' + remove).next();
		  
		  fileInput.val("");
		  $('#' + remove).addClass("d-none");
		  fileImg.addClass("d-none");
		  fileImg.attr("src","#");
		  rcardFile.removeClass("d-none");
	}
	function cardRemove(rcardId){
		$('#'+rcardId).parent().parent().parent().parent().remove();
		console.log(rcardId);
	}
	jQuery(document)
    .ready(
          function() {
             jQuery.each(hangjungdong.sido, function(idx, code) {
                jQuery('#sido').append(
                      fn_option(code.sido, code.codeNm));
             });
             jQuery('#sido').change(
                   function() {
                      jQuery('#sigugun').show();
                      jQuery('#sigugun').empty();
                      jQuery('#sigugun').append(
                            fn_option('', '선택'));

                      jQuery.each(hangjungdong.sigugun, function(
                            idx, code) {
                         if (jQuery('#sido').val() == code.sido)
                            jQuery('#sigugun').append(
                                  fn_option(code.sigugun,
                                        code.codeNm));
                      });

                      if (jQuery('#sido').val() == '36') {
                         jQuery('#sigugun').hide();
                         jQuery('#sigugun option:eq(1)').attr(
                               'selected', 'selected');
                         jQuery('#sigugun').trigger('change');
                      }
                   });

             jQuery('#sigugun')
                   .change(
                         function() {
                            jQuery('#dong').empty();
                            var sidoVal = jQuery('#sido').val();
                            var sigugunVal = jQuery('#sigugun')
                                  .val();
                            var sidoIdx = hangjungdong.sido
                                  .findIndex(function(i) {
                                     return i.sido == sidoVal;
                                  });
                            var sigugunIdx = hangjungdong.sigugun
                                  .findIndex(function(i) {
                                     return i.sigugun == sigugunVal
                                           && i.sido == sidoVal;
                                  });
                            var addr_do = hangjungdong.sido[sidoIdx].codeNm;
                            var addr_si = hangjungdong.sigugun[sigugunIdx].codeNm;

                         });
          });

function fn_option(code, name) {
 return '<option value="' + code + '">' + name + '</option>';
}
		
</script>

