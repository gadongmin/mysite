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
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/modal.css">

<script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-3.7.1.js"></script>
</head>


<body>
	<div class="wrap">
		<!-- header -->
		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
		<!-- /header -->

		<div class="content2 clearfix">
			<aside>
				<h2>방명록</h2>
				<ul>
					<li><a href="${pageContext.request.contextPath}/guestbook/list">일반방명록</a></li>
					<li><a href="${pageContext.request.contextPath}/guestbook/ajaxguestbook">ajax방명록</a></li>
				</ul>
			</aside>

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
					<form id="formAdd" class="form-box" action="" method="get">
						<table>
							<colgroup>
								<col style="width: 70px;">
								<col style="width: 340px;">
								<col style="width: 70px;">
								<col style="width: 340px;">
							</colgroup>
							<tbody>
								<tr>
									<th><label for="txt-name">이름</label>
									</td>
									<td><input id="txt-name" type="text" name="name" value=""></td>
									<th><label for="txt-password">패스워드</label></th>
									<td><input id="txt-password" type="password" name="password" value=""></td>
								</tr>
								<tr>
									<td colspan="4"><textarea id="text-content" name="content" value=""></textarea></td>
								</tr>
								<tr>
									<td colspan="4" class="btn-box">
										<button class="btn btn-blue btn-lg" type="submit">등록</button>
									</td>
								</tr>
							</tbody>

						</table>
					</form>
					<!--
					<button id="btnList" class="btn btn-blue btn-md" type="button">전체데이터 요청</button>
					
					<c:forEach items="${requestScope.gList}" var="guestVO"></c:forEach>
					</div>
					 -->
					 <div id="gbListArea"></div>

			</main>
		</div>
		
		<!-- footer -->
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
		<!-- /footer -->
		
	</div>
	
	<!-- ---------------------------------------------------- -->
	<!-- 모달창 -->
	<div class = 'modal-bg'>
		
		<div class = 'modal-content'>
			<p>비밀번호를 입력해주세요</p>
			
			<form id= "modalForm" action="" method="">
				<div>
					<input type='password' name='password' value=''>
					<input type='hidden' name='no' value=''>
				</div>
					
				<button type="submit" class="btn-del btn btn-blue btn-md" >삭제</button>
				<button class="btn-close btn btn-gray btn-md">닫기</button>
			</form>
		</div>
	
	</div>
	
	<!-- ---------------------------------------------------- -->
	<script>
		$(document).ready(function(){
			console.log("돔트리 완료");
								
			fetchList();
			
			/*
			$("#btnList").on("click", function(){
				console.log("클릭");
				
				fetchList();
				
			});
			*/
			
			// 등록버튼 클릭
			$('#formAdd').on('submit', function(event){
				console.log('클릭');
				event.preventDefault();
				
				// value값 호출
				let name = $('#txt-name').val();
				let pw = $('#txt-password').val();
				let content = $('#text-content').val();
				
				// VO묶기
				let guestbookVO = {
					name: name
					,password: pw
					,content: content
				};
				console.log(guestbookVO);

			// 서버저장
			$.ajax({
					// 요청
					url : "${pageContext.request.contextPath}/api/guestbook/add"		
					,type : "post"
					// ,contentType : "application/json"
					,data : guestbookVO
					
					// 응답
					,dataType : "json"
					,success : function(guestbookVO){
						/*성공시 처리해야될 코드 작성*/
						
						// 화면 출력
						render(guestbookVO, 'up');	
						
						// 입력폼 비우기
						$('#txt-name').val('');
						$('#txt-password').val('');
						$('#text-content').val('');				 
					}
					,error : function(XHR, status, error) {
						console.error(status + " : " + error);
					}
				});
			});
			
			// 삭제버튼 클릭
			$('#gbListArea').on('click', '.btn-modal', function(){
				console.log('삭제버튼');
				
				$('.modal-bg').addClass('active');
				
				// 모달창에 no값 넣는 input박스에 내가 가지고 있는 no값을 넣는다.
				let $this = $(this);
				let no = $this.data('no');
				
				// 번호 추가
				$('input[name="no"]').val(no);
				
				// 입력폼 비우기
				$('#modalForm input[name="password"]').val('');
				
			});
			
			// 모달창 안 닫기버튼 클릭
			$('.btn-close').on('click', function(){
				console.log('모달창 안 닫기버튼');
				
				$('.modal-bg').removeClass('active');
			});
			
			// 모달창 안 삭제버튼 클릭
			$('#modalForm').on('submit', function(event){
				console.log('모달창 안 삭제버튼');
				
				event.preventDefault();
				
				// 전송할 데이터 호출
				let pw = $('#modalForm input[name="password"]').val();
				let no = $('#modalForm input[name="no"]').val();
				
				// VO로 data묶기
				let guestbookVO = {
						password: pw
						,no: no
				}
				
				$.ajax({
					// 요청
					url : "${pageContext.request.contextPath}/api/guestbook/remove"		
					,type : "post"
					// ,contentType : "application/json"
					,data : guestbookVO
					
					// 응답
					,dataType : "json"
					,success : function(result){
						/*성공시 처리해야될 코드 작성*/
						
						if(result==1){
							$('#t'+no).remove(); // 아이디 매칭
						}

						// 모달창 닫기
						$('.modal-bg').removeClass('active');

					}
					,error : function(XHR, status, error) {
						console.error(status + " : " + error);
					}
				});
				
			});			
			
		});
		
		function fetchList(){
			$.ajax({
				// 요청
				url : "${pageContext.request.contextPath}/api/guestbook/list"		
				,type : "post"
				// ,contentType : "application/json"
				// ,data : {name: "홍길동"}

				// 응답
				,dataType : "json"
				,success : function(guestbookList){
					/*성공시 처리해야될 코드 작성*/
											
					// 화면출력
					for(let i=0; i<guestbookList.length; i++){
						render(guestbookList[i], 'down');	
					}
					
				}
				,error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
			
		}		
		
		// guestbookVO 1개를 화면에 그린다.
		function render(guestbookVO, updown){
			console.log(guestbookVO);
			
			let str = '';
			str += '<table id= "t'+guestbookVO.no+'" class="guestbook-item">';
			str += '	<colgroup>';
			str += '		<col style="width: 10%;">';
			str += '		<col style="width: 40%;">';
			str += '		<col style="width: 40%;">';
			str += '		<col style="width: 10%;">';
			str += '	</colgroup>';
			str += '	<tbody>';
			str += '		<tr>';
			str += '			<td>'+guestbookVO.no+'</td>';
			str += '			<td>'+guestbookVO.name+'</td>';
			str += '			<td>'+guestbookVO.regDate+'</td>';
			str += '			<td class="txt-center">';
			str += '				<button class="btn-modal btn btn-gray btn-sm" data-no= "'+guestbookVO.no+'">삭제</button>';
			str += '			</td>';
			str += '		</tr>';
			str += '		<tr>';
			str += '			<td colspan=4>'+guestbookVO.content+'</td>';
			str += '		</tr>';
			str += '	</tbody>';
			str += '</table>';			
			
			if(updown == 'up'){
				$("#gbListArea").prepend(str);	
			
			}else if(updown == 'down'){
				$("#gbListArea").append(str);
				
			}else{
				console.log('방향체크');
			}
			
		}
		
	</script>

</body>
</html>