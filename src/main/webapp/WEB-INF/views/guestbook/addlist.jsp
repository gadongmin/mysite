<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>MySite</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mysite.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/guestbook.css">
    </head>


	<body>
	  <div class="wrap">
		<!-- 헤더 -->
		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
		<!-- /헤더 -->
		
      <div class="content2 clearfix">
            
		<!-- aside 방명록 -->
		<c:import url="/WEB-INF/views/include/asideGuestbook.jsp"></c:import>
		<!-- aside 방명록 -->	

				<main>
					
				    <div class="main-head clearfix">
                        <h3>일반방명록</h3>
                        <ol class="clearfix">
                            <li>홈</li>
                            <li>방명록</li>
                            <li>일반방명록</li>
                        </ol>
                    </div>

					<div id="guestbook-addlist">
						<form class="form-box" action="${pageContext.request.contextPath}/guestbook/add" method="get">
							<table>
								<colgroup>
									<col style="width: 70px;">
									<col style="width: 340px;">
									<col style="width: 70px;">
									<col style="width: 340px;">
								</colgroup>
								<tbody>
									<tr>
										<th>
											<label for="txt-name">이름</label>
										</td>
										<td>
											<input id="txt-name" type="text" name="name" value="">
										</td>
										<th>
											<label for="txt-password">패스워드</label>
										</th>
										<td>
											<input id="txt-password"type="password" name="password" value="">
										</td>
									</tr>
									<tr>
										<td colspan="4">
											<textarea id="text-content" name="content"></textarea>
										</td>
									</tr>
									<tr>
										<td colspan="4" class="btn-box">
											<button class="btn btn-blue btn-lg" type="submit">등록</button>
										</td>
									</tr>
								</tbody>
								
							</table>
						</form>	
						
						<c:forEach items="${requestScope.gList}" var="guestVO">
							<table class="guestbook-item">
								<colgroup>
									<col style="width: 10%;">
									<col style="width: 40%;">
									<col style="width: 40%;">
									<col style="width: 10%;">
								</colgroup>
								<tbody>
									<tr>
										<td>${guestVO.no}</td>
										<td>${guestVO.name}</td>
										<td>${guestVO.regDate}</td>
										<td class="txt-center">
											<a class="btn btn-gray btn-sm" href="${pageContext.request.contextPath}/guestbook/removeform?no=${guestVO.no}">삭제</a>
										</td>
									</tr>
									<tr>
										<td colspan=4>${guestVO.content}</td>
									</tr>
								</tbody>
							</table>
						</c:forEach>
					</div>
			    
                </main>
            </div>
            
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

        </div>
     
    </body>
</html>