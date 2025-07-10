<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>MySite</title>
	<link rel="stylesheet" href="../../assets/css/reset.css">
	<link rel="stylesheet" href="../../assets/css/mysite.css">
	<link rel="stylesheet" href="../../assets/css/user.css">
</head>

<body>
	<div class="wrap">
		<!--header + nav-->
		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
		<!--header + nav-->

		<div class="content2 clearfix">
			<aside>
				<h2>유저</h2>
				<ul>
					<li><a href="">회원정보</a></li>
					<li><a href="${pageContext.request.contextPath}/user/loginform">로그인</a></li>
					<li><a href="">회원가입</a></li>
				</ul>
			</aside>


			<main>
				<div class="main-head clearfix">
					<h3>회원정보</h3>
					<ol class="clearfix">
						<li>홈</li>
						<li>유저</li>
						<li>회원가입</li>
					</ol>
				</div>

				<div id="user-joinok">

					<div class="complete-box">
						<p>
							회원가입을 축하합니다.<br> 이제 로그인하여 다양한 서비스를 이용해보세요. <br>
							<br> <a class="btn btn-gray btn-sm" href="${pageContext.request.contextPath}/user/loginform">로그인</a>
							     <a class="btn btn-gray btn-sm" href="${pageContext.request.contextPath}/">홈으로</a>
						</p>
					</div>

				</div>


			</main>
		</div>

		<!--footer-->
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
		<!--footer-->
		
	</div>

</body>
</html>