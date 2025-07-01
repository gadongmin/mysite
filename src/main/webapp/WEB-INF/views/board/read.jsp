<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>MySite</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mysite.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/board.css">
    </head>

    <body>
      <div class="wrap">
		<!--header + nav-->
		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
		<!--header + nav-->

            <div class="content2 clearfix">
                <aside>
                    <h2>게시판</h2>
                    <ul>
                        <li><a href="">일반게시판</a></li>
                        <li><a href="">댓글게시판</a></li>
                    </ul>
                </aside>


				<main>
					<div class="main-head clearfix">
                        <h3>일반게시판</h3>
                        <ol class="clearfix">
                            <li>홈</li>
                            <li>게시판</li>
                            <li>일반게시판</li>
                        </ol>
                    </div>

	
					<div id="board-read">

						<!-- 작성자 -->
						<div class="info-row">
							<span class="info-title">작성자</span>
							<span>${requestScope.boardVO.name}</span>
						</div>
						
						<!-- 조회수 -->
						<div class="info-row">
							<span class="info-title">조회수</span>
							<span>${requestScope.boardVO.hit}</span>
						</div>
						
						<!-- 작성일 -->
						<div class="info-row">
							<span class="info-title">작성일</span>
							<span>${requestScope.boardVO.regDate}</span>
						</div>
						
						<!-- 제목 -->
						<div class="info-row">
						<span class="info-title">제 목</span> <span>${requestScope.boardVO.title}</span>
						</div>
					
						<!-- 내용 -->
						<div class="info-row">
							<div class="outline" >${requestScope.boardVO.content}</div>
						</div>
						
						<div class="btn-box">
							<a class="btn btn-gray btn-md" href="${pageContext.request.contextPath}/board/list">목록</a>
							<a class="btn btn-blue btn-md" href="${pageContext.request.contextPath}/board/editform?no=${requestScope.boardVO.no}">수정</a>
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