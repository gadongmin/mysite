<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>MySite</title>
    	<!-- css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mysite.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/gallery.css">
    	
    </head>

<body>
	<div class="wrap">
         	<!-- 해더 + 네비 ------------------------------------>
            <c:import url="/WEB-INF/views/include/header.jsp"></c:import>
            <!-- 해더 + 네비 ----->
            
            <div class="content2 clearfix">
		 		<!-- aside -->
				<c:import url="/WEB-INF/views/include/asideAttach.jsp"></c:import>
				<!-- /aside -->
                
                <main>
					<div class="main-head clearfix">
                        <h3>첨부파일연습</h3>
                        <ol class="clearfix">
                            <li>홈</li>
                            <li>갤러리</li>
                            <li>첨부파일연습</li>
                        </ol>
                    </div>
					
					<div id="attach-result">
						<div class="result-box">
							<div class="result-image">
								<img src="${pageContext.request.contextPath}/upload/${requestScope.saveName}">
							</div>
							
							<a class="btn btn-gray btn-md" href="${pageContext.request.contextPath}/attach/upload"> 다시 업로드 하기 </a>
							
						</div>
					</div>
				</main>
			</div>
            
			<!-- footer -->
			<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
			<!-- //footer -->
			
		</div>
     
	</body>
</html>	
	