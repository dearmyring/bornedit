<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="login" value="${loginId != null}"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <!-- CSS 파일 -->
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/commons.css">
	    <!-- 폰트어썸 CDN -->
	    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
	    <!-- jQuery -->
	    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
		<title>BORNEDIT</title>
	</head>
	<body>
		<header>
			<div class="container-1500">
				<div class="header mt-0 w-100">
					<div id="logo" class="">
						<a href="${pageContext.request.contextPath}/">BORNEDIT</a>
					</div>
					<c:choose>
						<c:when test="login">
							<div class="header-align-center">
								<div class="inline-block ms-20">
									<i class="fa-solid fa-magnifying-glass font-20"></i>
								</div>
								<div class="inline-block ms-20">
									<i class="fa-regular fa-bell font-20"></i>
								</div>
								<div class="inline-block ms-20">
									<div class="header-write">
										작업물 공유
									</div>
								</div>
								<div class="inline-block profile-box ms-20">
									<img class="header-profile-img" src="${pageContext.request.contextPath}/image/basicProfileImage.png">
								</div>
								<div class="inline-block ms-10">
									<i class="fa-solid fa-caret-down down-icon"></i>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="header-align-center">
								<div class="inline-block ms-20">
									<i class="fa-solid fa-magnifying-glass font-20"></i>
								</div>
								<div class="inline-block ms-20">
									<div class="header-login">
										<a href="${contextPage.request.contextPath}/member/login">로그인</a>
									</div>
								</div>
								<div class="inline-block ms-20">
									<div class="header-join positive-button">
										<a class="positive-button"href="${contextPage.request.contextPath}/member/join">회원가입</a>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</header>
		