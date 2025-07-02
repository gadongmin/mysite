<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header class="clearfix">
	<h1>
		<a href="">MySite</a>
	</h1>

	<!--로그인 성공-->
	<c:if test="${sessionScope.authUser != null}">
		<ul class="clearfix">
			<li><span class="user-welcome">${sessionScope.authUser.name} 님 안녕하세요^^</span></li>
			<li>
				<a class="btn btn-white btn-sm" href="${pageContext.request.contextPath}/user/logout">로그아웃</a>
			</li>
			<li>
				<a class="btn btn-white btn-sm" href="${pageContext.request.contextPath}/user/editform">정보수정</a>
			</li>
		</ul>
	</c:if>

	<!--로그인 실패-->
	<c:if test="${sessionScope.authUser == null}">
		<ul class="clearfix">
			<li>
				<a class="btn btn-white btn-sm" href="${pageContext.request.contextPath}/user/loginform">로그인</a>
			</li>
			<li>
				<a class="btn btn-white btn-sm" href="${pageContext.request.contextPath}/user/joinform">회원가입</a>
			</li>
		</ul>
	</c:if>
</header>

<nav>
	<ul class="clearfix">
		<li><a href="">입사지원서</a></li>
		<li><a href="/board/list3">게시판</a></li>
		<li><a href="">갤러리</a></li>
		<li><a href="/guestbook/addlist">방명록</a></li>
	</ul>
</nav>

