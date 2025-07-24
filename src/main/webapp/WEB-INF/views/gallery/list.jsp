<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>MySite</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mysite.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/gallery.css">

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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
					<h3>일반갤러리</h3>
					<ol class="clearfix">
						<li>홈</li>
						<li>갤러리</li>
						<li>일반갤러리</li>
					</ol>
				</div>

				<div id="gallery-list">
					<c:if test="${sessionScope.authUser != null}">
						<div class="btn-box">
							<button id="btn-upload-modal" class="btn btn-blue btn-md" type="button">이미지올리기</button>
						</div>
					</c:if>

					<ul id="gallery-ul" class="clearfix">

						<!-- 이미지반복영역 -->
						<c:forEach items="${requestScope.gList}" var="GalleryVO">
							<li id="card-${GalleryVO.no}">
								<div class="card">
									<img class="view-img" src="${pageContext.request.contextPath}/upload/${GalleryVO.saveName}" 
														  data-no="${GalleryVO.no}"
														  data-content="${GalleryVO.content}">
									<div class="writer">
										작성자: <strong>${GalleryVO.userName}</strong>
									</div>
								</div>
							</li>
						</c:forEach>
						<!-- 이미지반복영역 -->

					</ul>
				</div>

			</main>
		</div>

		<!-- footer -->
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
		<!-- //footer -->

	</div>


	<!-- 모달창 -->
	<!-- 업로드 모달창 -->
	<div id="modal-upload" class="modal-bg">

		<div class="modal-content">

			<div class="clearfix">
				<button id="btn-upload-close" class="btn-close" type="button">X</button>
			</div>

			<p class="title">이미지등록 모달창</p>

			<form id="imgupload-form" action="${pageContext.request.contextPath}/gallery/upload" method="post" enctype="multipart/form-data">
				<div class="info-row">
					<label for="txt-content">글작성</label> <input id="txt-content" type="text" name="content" value="">
				</div>

				<div class="info-row">
					<label for="txt-file">이미지선택</label> <input id="txt-file" type="file" name="file">
				</div>
				<div class="btn-box">
					<button type="submit" class="btn-del btn btn-blue btn-md">등록</button>
				</div>
			</form>

		</div>

	</div>


	<!-- 이미지보기 모달창 -->
	<div id="modal-view" class="modal-bg">

		<div class="modal-content">

			<div class="clearfix">
				<button id="btn-view-close" class="btn-close" type="button">X</button>
			</div>

			<p class="title">이미지보기 모달창</p>

			<div id="img-view">
				<img src="">


				<div class="img-content">여기는 입력한 코멘트가 나옵니다.</div>

				<div class="btn-box">
					<button id="btn-delete" type="submit" class="btn-del btn btn-blue btn-md">삭제</button>
				</div>

			</div>


		</div>

	</div>

	<!-- ----------------------------------------------------------------- -->
	<script>
		$(document).ready(function() {

			// 이미지 등록 모달창
			$("#btn-upload-modal").on("click", function() {

				$("#modal-upload").addClass("active");
			});

			$("#btn-upload-close").on("click", function() {

				$("#modal-upload").removeClass("active");
			});

			// 폼 제출(submit) 이벤트 유효성 검사
			$("#imgupload-form").on("submit", function(event) {

				if ($("#txt-content").val().trim() === "") {
					alert("글 내용을 입력해주세요.");
					event.preventDefault();
				}

				if ($("#txt-file").val() === "") {
					alert("이미지 파일을 선택해주세요.");
					event.preventDefault();
				}

			});

			// 이미지 보기 모달창
			$("#gallery-ul").on("click", ".view-img", function() {
		        console.log("이미지 클릭됨");

		        let clickedImg = $(this);
		        let galleryNo = clickedImg.data("no");
		        let imgSrc = clickedImg.attr("src");
		        let content = clickedImg.data("content"); 

		        console.log("클릭한 이미지 번호:", galleryNo);
		        
		        // 모달창에 이미지 경로 설정
		        $("#img-view img").attr("src", imgSrc);
		        // 코멘트 
		        $(".img-content").text(content);
		        
		        // 나중에 삭제할 때 사용하기 위해, 삭제 버튼에 'data-no' 속성으로 번호를 저장해 둠
		        $("#btn-delete").data("no", galleryNo); 
		        // 모달창 띄우기
		        $("#modal-view").addClass("active");
  
			});
			
			// 닫기버튼
			$("#btn-view-close").on("click", function() {
				$("#modal-view").removeClass("active");
			});
			
			// 삭제버튼
			$("#btn-delete").on("click", function() {
				let galleryNo = $(this).data("no");

				$.ajax({
					// 요청
					url : "${pageContext.request.contextPath}/gallery/remove/" + galleryNo
					,type : "DELETE"

					// 응답
					,dataType : "json"
					,success : function(response) {
						if (response.result === "success") {
							$("#card-" + galleryNo).remove();
							$("#modal-view").removeClass("active");

						} else {
							$("#modal-view").removeClass("active");
						}
					}
					,error : function(XHR, status, error) {
						console.error(status + " : " + error);
					}
				});
			});
		});
	</script>
</body>
</html>