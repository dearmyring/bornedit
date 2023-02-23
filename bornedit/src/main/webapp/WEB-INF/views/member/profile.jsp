<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원가입" name="title"/>
</jsp:include>
	<div class="container-1500">
		<div class="text-center">
			<div class="inline-block mypage-profile-box mt-50">
				<c:choose>
					<c:when test="${attachmentDto.attachmentNo > 0}">
						<img class="user-profile-img" src="${contextPage.request.contextPath}/rest/download/${attachmentDto.attachmentNo}">
					</c:when>
					<c:otherwise>
						<img class="user-profile-img" src="${contextPage.request.contextPath}/image/basicProfileImage.png">
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="text-center mt-30">
			<div class="mt-10 font-30 mypage-nick">${userInfo.memberNick}</div>
			<div class="mt-10 font-15">${userInfo.memberIntroduce}</div>
		</div>
		<div class="text-center mt-50 mb-50 font-20 font-weight-600 container-500">
			<span class="cursor-pointer wrote-view present-view present-select">작성글</span>
		</div>
		<!-- 내가 쓴 글 -->
		<div class="my-wrote">
			<div>
				<span>총 ${listCount}개의 게시물을 작성하셨어요.</span>
			</div>
			<div class="w-100 mt-40 flex">
					<div class="row-warp" id="clone-parent">
						<c:forEach var="list" items="${list}">
							<div class="list-box inline-block" id="clone-child">
								<div class="list-video-box top">
									<a href="${contextPage.request.contextPath}/board/detail?boardNo=${list.homeList.boardNo}">
										<video onmouseover="this.play()" onmouseout="this.pause()" class="w-100 video-size">
											<source class="video-no" src="${contextPage.request.contextPath}/rest/download/${list.homeList.videoNo}">
										</video>
									</a>
								</div>
								<div class="video-title">
									<a href="${contextPage.request.contextPath}/board/detail?boardNo=${list.homeList.boardNo}">
										${list.homeList.boardTitle}
									</a>
								</div>
								<div class="video-content ">
									${list.homeList.boardContent}
								</div>
								<div class="use-equipment">
									<span>&nbsp;</span>
									<c:choose>
										<c:when test="${empty list.bodyDetail}"></c:when>
										<c:otherwise>
											[<c:forEach var="body" items="${list.bodyDetail}" varStatus="status">
												<span>${body.bodyName}<c:if test="${status.last eq false}">, </c:if></span>
											</c:forEach>]
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${empty list.lensDetail}"></c:when>
										<c:otherwise>
											[<c:forEach var="lens" items="${list.lensDetail}" varStatus="status">
												<span>${lens.lensName}<c:if test="${status.last eq false}">, </c:if></span>
											</c:forEach>]
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${empty list.rightDetail}"></c:when>
										<c:otherwise>
											[<c:forEach var="right" items="${list.rightDetail}" varStatus="status">
												<span>${right.rightName}<c:if test="${status.last eq false}">, </c:if></span>
											</c:forEach>]
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${empty list.tripodDetail}"></c:when>
										<c:otherwise>
											[<c:forEach var="tripod" items="${list.tripodDetail}" varStatus="status">
												<span>${tripod.tripodName}<c:if test="${status.last eq false}">, </c:if></span>
											</c:forEach>]
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${empty list.audioDetail}"></c:when>
										<c:otherwise>
											[<c:forEach var="audio" items="${list.audioDetail}" varStatus="status">
												<span>${audio.audioName}<c:if test="${status.last eq false}">, </c:if></span>
											</c:forEach>]
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${empty list.monitorDetail}"></c:when>
										<c:otherwise>
											[<c:forEach var="monitor" items="${list.monitorDetail}" varStatus="status">
												<span>${monitor.monitorName}<c:if test="${status.last eq false}">, </c:if></span>
											</c:forEach>]
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${empty list.etcDetail}"></c:when>
										<c:otherwise>
											[<c:forEach var="etc" items="${list.etcDetail}" varStatus="status">
												<span>${etc.etcName}<c:if test="${status.last eq false}">, </c:if></span>
											</c:forEach>]
										</c:otherwise>
									</c:choose>
								</div>
								<div class="bottom-box flex align-center space-around nick-like">
									<div class="flex align-center">
										<div class="list-profile-box inline-block">
											<c:choose>
												<c:when test="${list.homeList.profileNo > 0}">
													<img class="main-profile-img" src="${contextPage.request.contextPath}/rest/download/${list.homeList.profileNo}">	
												</c:when>
												<c:otherwise>
													<img class="main-profile-img" src="${contextPage.request.contextPath}/image/basicProfileImage.png">
												</c:otherwise>
											</c:choose>									
										</div>
										<div class="ms-5 me-5 font-12 inline-block" style="color:#33333354">
											by
										</div>
										<div class="font-weight-500 inline-block board-nick">
											${list.homeList.memberNick}
										</div>
									</div>
									<div class="flex align-center">
										<i class="fa-solid fa-heart"></i>
										<div class="ms-10 board-like">${list.homeList.boardLike}</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
	</div>