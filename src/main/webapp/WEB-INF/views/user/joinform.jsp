<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>MySite</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mysite.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/user.css">
</head>

<body>
	<div class="wrap">
		<header class="clearfix">
			<h1>
				<a href="">MySite</a>
			</h1>

			<!--
			    <ul class="clearfix">
				    <li><span class="user-welcome">황일영 님 안녕하세요^^</span></li>
				    <li>
                        <a class="btn btn-white btn-sm" href="">로그아웃</a>
                    </li>
                    <li>
                        <a class="btn btn-white btn-sm" href="">정보수정</a>
                    </li>
			    </ul>
                -->

			<ul class="clearfix">
				<li><a class="btn btn-white btn-sm" href="">로그인</a></li>
				<li><a class="btn btn-white btn-sm" href="">회원가입</a></li>
			</ul>
		</header>

		<nav>
			<ul class="clearfix">
				<li><a href="">입사지원서</a></li>
				<li><a href="">게시판</a></li>
				<li><a href="">갤러리</a></li>
				<li><a href="">방명록</a></li>
			</ul>
		</nav>

		<div class="content2 clearfix">
			<aside>
				<h2>유저</h2>
				<ul>
					<li><a href="">회원정보</a></li>
					<li><a href="">로그인</a></li>
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

				<div id="user-joinform">

					<form class="form-box" action="" method="">
						<div class="info-row">
							<label class="info-title" for="txt-idcheck">아이디</label> <input id="txt-idcheck" type="text" name="" value="">
							<button id="" class="btn btn-gray btn-input" type="button">중복체크</button>
						</div>
						<div class="info-row">
							<label class="info-title" for="txt-pwd">패스워드</label> <input id="txt-pwd" type="password" name="" value="">
						</div>
						<div class="info-row">
							<label class="info-title" for="txt-name">이름</label> <input id="txt-name" type="text" name="" value="">
						</div>
						<div class="info-row">
							<span class="info-title">성별</span> <label>남</label> <input type="radio" name="gender" > <label>여</label> <input type="radio" name="gender" >
						</div>
						<div class="info-row">
							<span class="info-title">약관동의</span> <input type="checkbox" name="" value="">
							<lable>서비스 약관에 동의합니다.</lable>
						</div>
						<div class="btn-group">
							<button class="btn btn-blue btn-lg" type="submit">회원가입</button>
						</div>
					</form>

				</div>


			</main>
		</div>

		<footer>
			<p>Copyright ⓒ 2025 황일영. All right reserved</p>
		</footer>

	</div>

</body>
</html>