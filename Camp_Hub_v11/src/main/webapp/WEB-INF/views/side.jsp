<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                <div class="sb-nav-link-icon"><i class="fas fa-building"></i></div>
                                회사정보
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="about_Us.html">회사 소개</a>
                                    <a class="nav-link" href="#">찾아오는 길</a>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">캠핑장 정보</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-campground"></i></div>
                                캠핑장 보러가기
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="camp_list">전체보기</a>
                                   <c:if test="${grade=='owner' || grade=='admin'}"> 
                                    <a class="nav-link" href="mycamp_list">내 캠핑장 보기</a>
                                    <a class="nav-link" href="camp_form">내 캠핑장 등록</a>
                                    </c:if>
                                    <c:if test="${grade=='bronze' || grade=='silver' || grade=='gold' || grade=='diamond' || grade=='admin'}"> 
                                    <a class="nav-link" href="marking_list">즐겨찾기</a>
                                    </c:if>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">news</div>
                            <a class="nav-link collapsed" href="notice_list" >
                                <div class="sb-nav-link-icon"><i class="fas fa-rectangle-list"></i></div>
                                공지사항
                            </a>
                            <div class="sb-sidenav-menu-heading">게시판</div>
                            
                            
                            
                  <a class="nav-link collapsed" href="board_list?b_type=free">
                     <div class="sb-nav-link-icon">
                        <i class="far fa-rectangle-list"></i>
                     </div> 자유게시판
                  </a> <a class="nav-link collapsed" href="board_list?b_type=qna">
                     <div class="sb-nav-link-icon">
                        <i class="far fa-rectangle-list"></i>
                     </div> Q&A
                  </a>
                            
                            
                            
                        </div>
                    </div>
                    <div class="mb-4">
                    <img src="<%=request.getContextPath()%>/resources/img/mainLogo.png" class="img-fluid" width="100%"> 
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
