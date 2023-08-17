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
            <div class="container-fluid px-4">
            <h1 class="mt-4">공지사항</h1>

               <ol class="breadcrumb mb-4">
                  <li class="breadcrumb-item active">게시판</li>
               </ol>

               <div class="card mb-4">
                  <div class="card-header">
                     <i class="fas fa-table me-1"></i> 공지사항 게시판입니다.
                  </div>
                  <div class="card-body">
                     <table id="example" class="display" style="width: 100%">
                        <thead>
                           <tr>
                              <th>순번</th>
                              <th>글 제목</th>
                              <th>작성자</th>
                              <th>등급</th>
                              <th>조회수</th>
                              <th>작성일</th>
                           </tr>
                        </thead>
                        <tfoot>
                           <tr>
                              <th>순번</th>
                              <th>글 제목</th>
                              <th>작성자</th>
                              <th>등급</th>
                              <th>조회수</th>
                              <th>작성일</th>
                           </tr>
                        </tfoot>
                        <tbody>
                           <c:forEach var="i" items="${nlist }" varStatus="status">
                              <tr>
                                 <td>${status.count }</td>
                                 
                                 <td>
                                    <a href="notice_detail?n_num=${i.num}">${i.title}</a>
                                 </td>
                                 
                                 <td>'관리자'</td>
                                 <td>'관리자'</td>
                                 <td>${i.view_cnt}</td>
                                 <td>${i.indate }</td>
                              </tr>
                           </c:forEach>
                        </tbody>
                     </table>
                     <form action="notice_form" method='post'>
                        <c:if test="${grade eq 'admin'}">
                        	<input type="submit" class="btn btn-dark mt-3 float-end" value="글 작성">
                        </c:if>
                        
                     </form>
                  </div>
               </div>
            </div>


         </main>
		<!-- footer -->
		
        <jsp:include page="footer.jsp" flush="true"/>
         
	<script src="<%=request.getContextPath()%>/resources/js/js.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resources/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/demo/chart-area-demo.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/demo/chart-bar-demo.js"></script>
</body>
</html>