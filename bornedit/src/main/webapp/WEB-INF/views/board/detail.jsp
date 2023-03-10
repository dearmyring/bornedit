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
				<div class="mt-30">
					<h1>${content.boardDetail.boardTitle}</h1>
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
								<input name="boardNo" value="${selectOneBoard.boardNo}" type="hidden" readonly>
								<input name="replyContent" class="w-85 ms-30 reply-input" placeholder="작성하실 댓글을 입력하세요.">
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
								<input name="boardNo" value="${selectOneBoard.boardNo}" type="hidden" readonly>
								<input name="replyContent" class="w-85 ms-30 reply-input" placeholder="로그인 후 댓글을 입력하세요." readonly>
								<button type="button" class="ms-30 btn reply-add-btn btn-positive" disabled>등록</button>
								<button type="button" class="btn reply-delete-btn" disabled>취소</button>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
				<div class="reply-list">
					<c:forEach var="replyDto" items="${replyDto}">
						<div class="flex-parent mt-30">
							<div class="inline-block profile-box">
								<c:choose>
									<c:when test="${replyDto.attachmentNo > 0}">
										<img class="detail-profile-img" src="${contextPage.request.contextPath}/rest/download/${replyDto.attachmentNo}">	
									</c:when>
									<c:otherwise>
										<img class="detail-profile-img" src="${contextPage.request.contextPath}/image/basicProfileImage.png">
									</c:otherwise>
								</c:choose>
							</div>
							<div class="flex-col">
								<div class="ms-10 mb-5">
									<span class="font-15 reply-nick me-5">{{memberNick}}</span>
									<span class="font-12 reply-when" style="color:#757575;">replyWhen</span>
								</div>
								<div class="inline-block font-18 ms-10 reply-content">
									replyContent
								</div>
							</div>
							<c:if test="${replyDto.memberNick == loginNick}">
								<div class="text-right font-15">
									<span class="cursor-pointer me-5">수정</span>
									<span class="cursor-pointer">삭제</span>
								</div>
							</c:if>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
		<div class="left like-save-box" style="display: flex; justify-content: center;">
			<div class="flex-col" style="justify-content: space-around;">
				<div class="heart-box" style="display: flex; justify-content: center; align-items: center;">
					<i class="font-30 fa-regular fa-heart" style="color: #757575"></i>
				</div>
				<div class="like-count text-center font-15">
					0	
				</div>
				<div class="save-box" style="display: flex; justify-content: center; align-items: center;">
					<i class="font-30 fa-regular fa-bookmark" style="color: #757575"></i>				
				</div>
			</div>
		</div>
	</div>
	<script>
		$(function(){
			replyListLoad();
			
			$(".reply-delete-btn").click(function(){
				$("input[name=replyContent]").val("");
			});
			
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
			
			function replyListLoad() {
				const boardNo = $("input[name=boardNo]").val();
				$.ajax({
					url:"${contextPage.request.contextPath}/rest/reply/list/" + boardNo,
					method:"get",
					success:function(resp){
						for(var i = 0; i < resp.length; i++) {
							var img = $(".profile-box").text();
							var nick = $(".reply-nick").text();
							var when = $(".reply-when").text();
							var content = $(".reply.content").text();
							nick = nick.replace("{{memberNick}}", resp[i].memberNick);
							console.log(nick);
							replyCount();
						}
					}
				});
			}
			
			function replyCount() {
				const boardNo = $("input[name=boardNo]").val();
				$.ajax({
					url:"${contextPage.request.contextPath}/rest/reply/count/"+ boardNo,
					method:"get",
					success: function(resp) {
						$(".reply-count").text(resp.cnt);
					}
				});
			}
		});
	</script>	
</body>
</html>