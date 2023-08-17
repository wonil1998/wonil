<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
	<!-- Navbar Brand-->
	<a class="navbar-brand ps-3" href="<%=request.getContextPath()%>">캠핑허브</a>
	<!-- Sidebar Toggle-->
	<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
		id="sidebarToggle" href="#!">
		<i class="fas fa-bars"></i>
	</button>
	<button
		class="btn btn-link btn-sm order-1 order-lg-0 ms-auto me-4 me-lg-0"
		id="sidebarToggle" href="#!"></button>
	<!-- Navbar-->
	<ul class="navbar-nav ms-md-0 me-3 me-lg-4">
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
			aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
			<ul class="dropdown-menu dropdown-menu-end"
				aria-labelledby="navbarDropdown">
				<li><a class="dropdown-item" href="myInfo">내 정보 보기</a></li>
				<li><a class="dropdown-item" href="myboard_list">내 게시글 보기</a></li>
				<li><a class="dropdown-item" href="myreply_list">내 댓글 보기</a></li>
				<li><a class="dropdown-item" href="myreview_list">내 리뷰 보기</a></li>
				<li><hr class="dropdown-divider" /></li>
				<li><a class="dropdown-item" href="logout">Logout</a></li>
			</ul></li>
	</ul>
</nav>