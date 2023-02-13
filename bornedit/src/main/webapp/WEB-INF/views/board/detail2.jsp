<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="login" value="${loginId != null}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원가입" name="title"/>
</jsp:include>
	<div class="container-1500">
		<div class="container-1280 mt-50 mb-100">
			<c:forEach items="${boardDto}" var="content">
				<div class="video-box-size">
					<video class="w-100 video-size" controls>
						<source src="${contextPage.request.contextPath}/rest/download/${content.boardVideoDetail.attachmentNo}">
					</video>
				</div>
				<div class="flex-parent mt-30 space-around">
					<div class="flex-editAndDelete">
						<h1>${content.boardDetail.boardTitle}</h1>
					</div>
					<c:if test="${loginId == content.boardDetail.memberEmail}">
						<div class="flex-editAndDelete">
							<a href="#" class="btn btn-edit">수정</a>
							<a href="delete?boardNo=${content.boardDetail.boardNo}" class="btn btn-delete">삭제</a>
						</div>
					</c:if>
				</div>
				<div class="flex-parent mt-30">
					<div class="inline-block profile-box">
						<c:choose>
							<c:when test="${content.boardDetail.attachmentNo > 0}">
								<img class="detail-profile-img" src="${contextPage.request.contextPath}/rest/download/${content.boardDetail.attachmentNo}">	
							</c:when>
							<c:otherwise>
								<img class="detail-profile-img" src="${contextPage.request.contextPath}/image/basicProfileImage.png">
							</c:otherwise>
						</c:choose>
					</div>
					<div class="flex-col">
						<div class="ms-10 font-20 mb-5">${content.boardDetail.memberNick}</div>
						<div class="inline-block font-15 ms-10" style="color: #757575;">
							${content.boardDetail.boardWhen} 조회수 ${content.boardDetail.boardView}
						</div>
					</div>
				</div>
				
				<div class="mt-40 mb-10" style="color:#757575;">주요 정보</div>
				<div class="filming-info w-100">
					<div class="flex-parent-detail">
						<div class="flex-parent-main inline-block">
							<div class="flex-col-info">
								<img class="size-30 mb-10" src="${contextPage.request.contextPath}/image/video-camera.png">
								<div class="font-15">메인바디</div>
							</div>
							<div class="ms-30 font-20">${content.boardDetail.mainBody}</div>
						</div>
						
						<div class="flex-parent-main inline-block">
							<div class="flex-col-info">
								<img class="size-30 mb-10" src="${contextPage.request.contextPath}/image/team.png">
								<div class="font-15">촬영인원</div>
							</div>
							<div class="ms-30 font-20">${content.boardDetail.howManyEmployee}명</div>
						</div>
						
						<div class="flex-parent-main inline-block">
							<div class="flex-col-info">
								<img class="size-30 mb-10" src="${contextPage.request.contextPath}/image/film-editing.png">
								<div class="font-15">작업의뢰</div>
							</div>
							<div class="ms-30 font-20">
								<c:if test="${content.boardDetail.memberOffer == 'Y'}">상시 가능</c:if>
								<c:if test="${content.boardDetail.memberOffer == 'N'}">요청 불가</c:if>
							</div>
						</div>
					</div>
					<div class="mt-20">
						<div class="inline-block me-20 mb-20">
							<span class="me-10" style="color:#757575;">바디</span>
							<c:if test="${empty content.bodyDetail}">-</c:if>
							<c:forEach var="body" items="${content.bodyDetail}" varStatus="status">
								<span>${body.bodyName}<c:if test="${status.last eq false}">, </c:if></span>
							</c:forEach>
						</div>
						<div class="inline-block me-20">
							<span class="me-10" style="color:#757575;">렌즈</span>
							<c:if test="${empty content.lensDetail}">-</c:if>
							<c:forEach var="lens" items="${content.lensDetail}" varStatus="status">
								<span>${lens.lensName}<c:if test="${status.last eq false}">, </c:if></span>
							</c:forEach>
						</div>
						<div class="inline-block me-20">
							<span class="me-10" style="color:#757575;">조명</span>
							<c:if test="${empty content.rightDetail}">-</c:if>
							<c:forEach var="right" items="${content.rightDetail}" varStatus="status">
								<span>${right.rightName}<c:if test="${status.last eq false}">, </c:if></span>
							</c:forEach>
						</div>
						<div class="inline-block me-20">
							<span class="me-10" style="color:#757575;">삼각대</span>
							<c:if test="${empty content.tripodDetail}">-</c:if>
							<c:forEach var="tripod" items="${content.tripodDetail}" varStatus="status">
								<span>${tripod.tripodName}<c:if test="${status.last eq false}">, </c:if></span>
							</c:forEach>
						</div>
						<div class="inline-block me-20">
							<span class="me-10" style="color:#757575;">오디오</span>
							<c:if test="${empty content.audioDetail}">-</c:if>
							<c:forEach var="audio" items="${content.audioDetail}" varStatus="status">
								<span>${audio.audioName}<c:if test="${status.last eq false}">, </c:if></span>
							</c:forEach>
						</div>
						<div class="inline-block me-20">
							<span class="me-10" style="color:#757575;">모니터</span>
							<c:if test="${empty content.monitorDetail}">-</c:if>
							<c:forEach var="monitor" items="${content.monitorDetail}" varStatus="status">
								<span>${monitor.monitorName}<c:if test="${status.last eq false}">, </c:if></span>
							</c:forEach>
						</div>
						<div class="inline-block me-20">
							<span class="me-10" style="color:#757575;">ETC</span>
							<c:if test="${empty content.etcDetail}">-</c:if>
							<c:forEach var="etc" items="${content.etcDetail}" varStatus="status">
								<span>${etc.etcName}
									<c:if test="${status.last eq false}">, </c:if>
								</span>
							</c:forEach>
						</div>
					</div>
					
					
				</div>
				
				<div class="mt-40 mb-10" style="color:#757575;">상세 내용</div>
				<div class="filming-info w-100">
					${content.boardDetail.boardContent}
				</div>
			</c:forEach>
			
			<div class="reply mt-40">
				<div>
					<div style="color:#757575;">댓글 <span class="reply-count">0</span>개</div>
				</div>
				<c:choose>
					<c:when test="${login}">
						<div class="mt-20 mb-40" style="display: flex; align-items: center; justify-content: space-between;">
							<div class="profile-box">
								<img class="header-profile-img">
							</div>
							<div class="w-100" style="display: flex; justify-content: space-between;">
								<input name="replyContent" class="w-85 ms-30 reply-input" placeholder="작성하실 댓글을 입력하세요." autocomplete="off">
								<button type="button" class="ms-30 btn reply-add-btn btn-positive">등록</button>
								<button type="button" class="btn reply-delete-btn">취소</button>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="mt-20 mb-40" style="display: flex; align-items: center; justify-content: space-between;">
							<div class="profile-box">
								<img class="detail-profile-img" src="${contextPage.request.contextPath}/image/basicProfileImage.png">
							</div>
							<div class="w-100" style="display: flex; justify-content: space-between;">
								<input name="replyContent" class="w-85 ms-30 reply-input" placeholder="로그인 후 댓글을 입력하세요." readonly>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
				<input name="boardNo" value="${selectOneBoard.boardNo}" type="hidden" readonly>
				<div class="reply-list">
					<!-- jQuery로 댓글 목록이 추가될 영역 -->
				</div>
			</div>
		</div>
		
		<div class="left like-save-box" style="display: flex; justify-content: center;">
			<div class="flex-col" style="justify-content: space-around;">
				<div class="heart-box" style="display: flex; justify-content: center; align-items: center;">
					<i class="font-30 fa-regular fa-heart cursor-pointer like-btn" style="color: #757575"></i>
				</div>
				<div class="like-count text-center font-15">
					
				</div>
				<div class="save-box" style="display: flex; justify-content: center; align-items: center;">
					<i class="font-30 fa-regular fa-bookmark cursor-pointer save-btn" style="color: #757575"></i>				
				</div>
			</div>
		</div>
		
		
		<div id="reply-edit-modal">
			<div class="modalContent screen-center">
				<input class="w-80 input" id="edit-input" autocomplete="off" name="replyContent">
				<input class="reply-no-hidden" type="number" type="number" hidden="hidden" readonly>
				<button id="edit-complete" class="btn btn-positive" type="button">수정</button>
				<button class="btn reply-delete-btn" type="button">취소</button>
			</div>
		</div>
	</div>
	<script>
		$(function(){
			replyListLoad();
			currentLikeState();
			currentSaveState();
			likeCount();
			
			// 댓글 작성,수정 중 취소버튼 누를시 입력창 초기화
			$(".reply-delete-btn").click(function(){
				$("#reply-edit-modal").fadeOut(100);
				$("input[name=replyContent]").val("");
			});
			
			// 댓글 등록
			$(".reply-add-btn").click(function(){
				const boardNo = $("input[name=boardNo]").val();
				const replyContent = $("input[name=replyContent]").val();
				if(replyContent.length == 0) {
					alert("댓글을 작성하세요.");
					return;
				}
				const data = {
						boardNo: boardNo,
						replyContent: replyContent
				};
				$.ajax({
					url:"${contextPage.request.contextPath}/rest/reply/write",
					method:"post",
					contentType:"application/json",
					data:JSON.stringify(data),
					success: function() {
						replyListLoad();
						$("input[name=replyContent]").val("");
					}
				});
			});
			
			// 댓글 갯수 조회
			function replyCount() {
				const boardNo = $("input[name=boardNo]").val();
				$.ajax({
					url:"${contextPage.request.contextPath}/rest/reply/count/" + boardNo,
					method:"get",
					success: function(resp) {
						$(".reply-count").text(resp.cnt);
					}
				});
			}
			
			// 댓글 목록 조회
			function replyListLoad() {
				
				const boardNo = $("input[name=boardNo]").val();
				$.ajax({
					url:"${contextPage.request.contextPath}/rest/reply/list/"+ boardNo,
					method:"get",
					success:function(resp){
						$(".reply-list").empty();
						for(var i = 0; i < resp.length; i++) {
							const div1 = $("<div>").addClass("flex-parent mt-30");
							const div2 = $("<div>").addClass("inline-block profile-box");
							if(resp[i].attachmentNo > 0) {
								var img = $("<img>").addClass("reply-profile-img").attr("src", "${contextPage.request.contextPath}/rest/download/" + resp[i].attachmentNo);
							} else {
								var img = $("<img>").addClass("reply-profile-img").attr("src", "${contextPage.request.contextPath}/image/basicProfileImage.png");
							}
							const replyMemberProfile = div2.append(img);
							const div3 = $("<div>").addClass("flex-col");
							const div4 = $("<div>").addClass("ms-10 mb-5");
							const nick = $("<span>").addClass("font-15 reply-nick me-5").text(resp[i].memberNick);
							const when = $("<span>").addClass("font-12 reply-when").css("color", "#757575").text(resp[i].replyWhen);
							const content = $("<div>").addClass("inline-block font-18 ms-10 reply-content").text(resp[i].replyContent);
							const div5 = div4.append(nick).append(when);
							const NickWhenContent = div3.append(div5).append(content);
							const div6 = div1.append(replyMemberProfile).append(NickWhenContent);
							const replyNo = $("<input>").val(resp[i].replyNo).addClass("reply-no").attr("type", "hidden");
							$(".reply-list").append(div6);
							replyCount();
							
							if(resp[i].memberNick == "${loginNick}") {
								const div7 = $("<div>").addClass("text-right font-15 flex-parent flex-end");
								const replyEdit = $("<span>").addClass("cursor-pointer reply-edit").text("수정");
								const replyDelete = $("<span>").addClass("cursor-pointer reply-delete ms-10").text("삭제");
								const div8 = div7.append(replyEdit).append(replyDelete).append(replyNo);
								const div9 = div1.append(div8);
							}
						};
					}
				});
			}
			
			// 작성자가 댓글 삭제 버튼을 누를 시 삭제
			$(document).on("click", ".reply-delete", function() {
				const replyNo = $(this).next("input").val();
				$.ajax({
					url:"${contextPage.request.contextPath}/rest/reply/delete/" + replyNo,
					method:"delete",
					success: function(){
						replyListLoad();
					}
				});
			});
			
			// 댓글 수정 클릭시 인풋창 생성
			$(document).on("click", ".reply-edit", function(){
				const currentReply = $(this).parent(".text-right").prev("div").find(".reply-content").text();
				const replyNoData = $(this).nextAll(".reply-no").val();
				const boardNo = $("input[name=boardNo]").val();
				$(".reply-no-hidden").val(replyNoData);
				$("#edit-input").val(currentReply);
				$("#reply-edit-modal").fadeIn(100);
				
				// 댓글 수정
				$("#edit-complete").click(function(){
					const replyContent = $("#edit-input").val();
					const replyNo = $(".reply-no-hidden").val();
					if(replyContent.length == 0) {
						alert("댓글을 입력하세요.");
						return;
					}
					const data = {
							replyContent:replyContent,
							replyNo:replyNo,
							boardNo:boardNo
							}
					console.log(data);
					
					$.ajax({
						url:"${contextPage.request.contextPath}/rest/reply/edit",
						method:"put",
						contentType:"application/json",
						data:JSON.stringify(data),
						success: function(resp) {
							$("#reply-edit-modal").fadeOut(100);
							replyListLoad();
						}
					});
				});
			});
			
			// 좋아요 갯수 조회
			function likeCount() {
				const boardNo = $("input[name=boardNo]").val();
				$.ajax({
					url:"${contextPage.request.contextPath}/rest/like/count/" + boardNo,
					method:"get",
					success: function(resp) {
						$(".like-count").text(resp.cnt);
					}
				});
			}
			
			// 세션의 좋아요 상태 조회
			function currentLikeState() {
				const boardNo = $("input[name=boardNo]").val();
				const data = {boardNo:boardNo};
				$.ajax({
					url:"${contextPage.request.contextPath}/rest/like/view",
					method:"post",
					contentType:"application/json",
					data:JSON.stringify(data),
					success: function(resp) {
						if(resp == true) {
							$(".like-btn").addClass("fa-regular fa-heart");
						} else {
							$(".like-btn").addClass("fa-solid fa-heart").css("color", "#B20000");
						}
					}
				});
			};
			
			// 좋아요
			$(".like-btn").click(function(){
				const boardNo = $("input[name=boardNo]").val();
				const data = {boardNo:boardNo};
				if(!${login}) {
					alert("로그인이 필요합니다.");
					return;
				}			
				$.ajax({
					url:"${contextPage.request.contextPath}/rest/like/check",
					method:"post",
					contentType:"application/json",
					data:JSON.stringify(data),
					success: function(resp) {
						if(resp == "like") {
							$(".like-btn").removeClass("fa-regular fa-heart").addClass("fa-solid fa-heart").css("color", "#B20000");
							likeCount();
						} else {
							$(".like-btn").removeClass("fa-solid fa-heart").addClass("fa-regular fa-heart").css("color", "#757575");
							likeCount();
						}
					}	
				});
			});
			
			// 세션의 북마크 상태 조회
			function currentSaveState() {
				const boardNo = $("input[name=boardNo]").val();
				const data = {boardNo:boardNo};
				$.ajax({
					url:"${contextPage.request.contextPath}/rest/save/view",
					method:"post",
					contentType:"application/json",
					data:JSON.stringify(data),
					success: function(resp) {
						if(resp == true) {
							$(".save-btn").addClass("fa-regular fa-bookmark");
						} else {
							$(".save-btn").addClass("fa-solid fa-bookmark");
						}
					}
				});
			};
			
			// 북마크
			$(".save-btn").click(function(){
				const boardNo = $("input[name=boardNo]").val();
				const data = {boardNo:boardNo};
				if(!${login}) {
					alert("로그인이 필요합니다.");
					return;
				}			
				$.ajax({
					url:"${contextPage.request.contextPath}/rest/save/check",
					method:"post",
					contentType:"application/json",
					data:JSON.stringify(data),
					success: function(resp) {
						if(resp == "save") {
							$(".save-btn").removeClass("fa-regular fa-bookmark").addClass("fa-solid fa-bookmark");
						} else {
							$(".save-btn").removeClass("fa-solid fa-bookmark").addClass("fa-regular fa-bookmark");
						}
					}	
				});
			});
		});
	</script>	
</body>
</html>