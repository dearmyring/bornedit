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
	    <script>
	    	$(function(){
	    		$.ajax({
	    			url:"${pageContext.request.contextPath}/rest/PersonalImgNo/${loginId}",
	    			method:"get",
	    			success: function(resp) {
	    				if(resp.attachmentNo > 0) {
		    				$(".header-profile-img").attr("src", "${pageContext.request.contextPath}/rest/download/" + resp.attachmentNo);
	    				} else {
	    					$(".header-profile-img").attr("src", "${pageContext.request.contextPath}/image/basicProfileImage.png");
	    				}
	    			}
	    		});
		        $(".file-input").change(function(){
		               if(this.files.length > 0){
		                   const imgData = new FormData();
		                   imgData.append("attach", this.files[0]);
		                   $.ajax({
		                       url: "${pageContext.request.contextPath}/rest/upload",
		                       method: "post",
		                       data: imgData,
		                       processData:false,
		                       contentType:false, 
		                       success: function(resp) {
		                           $(".header-profile-img").attr("src", resp);
		                            
		                           const attachmentNo = (resp.split("download/")[1]);
		                            
		                      	 $.ajax({
		                               url: "${pageContext.request.contextPath}/rest/profileImg?attachmentNo="+attachmentNo,
		                               method: "post",
		                               data: JSON.stringify({attachmentNo:attachmentNo}),
		                               success: function(resp1) {
		                               }
		                    	});
		                	}
		            	});
		        	} 
		        });
		        
				$(".profile-img-delete").click(function(){
					$.ajax({
						url:"${pageContext.request.contextPath}/rest/deleteImgNo/${loginId}",
						method:"delete",
						success: function(resp) {
							$(".header-profile-img").attr("src", "${pageContext.request.contextPath}/image/basicProfileImage.png");
						}
					});
				});
	    	});
	    </script>
		<title>BORNEDIT</title>
	</head>
	<body>
		<header>
			<div class="container-1500">
				<div class="header mt-0 w-100">
					<div class="logo">
						<a href="${pageContext.request.contextPath}/">BORNEDIT</a>
					</div>
					<c:choose>
						<c:when test="${login}">
							<div class="header-align-center">
								<div class="inline-block ms-20">
									<i class="fa-solid fa-magnifying-glass font-20"></i>
								</div>
								<div class="inline-block ms-20">
									<i class="fa-regular fa-bell font-20"></i>
								</div>
								<div class="inline-block ms-20">
									<div class="header-write">
										<a href="${contextPage.request.contextPath}/board/write">작업물 공유</a>
									</div>
								</div>
								<div class="inline-block profile-box ms-20">
									<img class="header-profile-img">
								</div>
								<div class="inline-block ms-10 dropdown">
									<div class="dropdown-btn" type="button"><i class="fa-solid fa-caret-down down-icon"></i></div>
									<div class="dropdown-submenu">
										<a href="${contextPage.request.contextPath}/member/mypage">마이페이지</a>
										<a href="${contextPage.request.contextPath}/member/logout">로그아웃</a>
									</div>
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
		