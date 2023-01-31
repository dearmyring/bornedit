<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/commons.css">
		<!-- 폰트어썸 CDN -->
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
		<!-- jQuery -->
		<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
		<title>비밀번호 찾기</title>
	</head>
	<body>
		<div class="container-300 screen-center">
			<div class="logo text-center">
				<a class="font-30" href="${pageContext.request.contextPath}/">BORNEDIT</a>
			</div>
			<form class="join-form" action="find_pw" method="post">
				<div class="w-100">
					<input class="input w-100 mt-10 input-email" name="memberEmail" placeholder="이메일을 입력하세요." autocomplete="off" type="email">
					<button class="btn w-100 mt-10 send-btn" type="button" disabled>이메일 인증</button>
					<div class="mt-5 help-text text-center"></div>
					<input class="input w-100 mt-5 confirm confirm-input" placeholder="인증번호를 입력하세요" autocomplete="off">
					<button class="btn w-100 mt-10 cursor-pointer btn-positive confirm confirm-serial" type="button">번호 확인</button>
				</div>
			</form>
		    <c:if test="${param.error != null}">
				<div class="container-300 mt-10">
					<div class="w-100 text-center help-text">가입된 이메일 주소가 아닙니다.</div>
				</div>
			</c:if>
		</div>
		
		<script>
			$(function(){
				$("input[name=memberEmail]").on("input", function(){
					const isManyLetters = $(this).val();
					const btn = $(".send-btn");
					if(isManyLetters.length > 0) {
						btn.attr("disabled", false).addClass("btn-positive cursor-pointer");
					} else {
						btn.attr("disabled", true).removeClass("btn-positive cursor-pointer");
					}
				});
				
				$(".send-btn").click(function(){
					const memberEmail = $("input[name=memberEmail]").val();
					const btn = $(this);
					$.ajax({
						url: "${pageContext.request.contextPath}/rest/member/email/" + memberEmail,
						method: "get",
						success: function(resp) {
							if(resp == "NNNNY") {
								btn.prop("disabled", true);
								$("input[name=memberEmail]").next("button").next("div").text("가입된 이메일이 아닙니다.");
							} 
							else {
								btn.attr("disabled", true);
								$("input[name=memberEmail]").next("button").next("div").text("");
								$.ajax({
									url:"${pageContext.request.contextPath}/rest/member/send_email",
									method: "post",
									data: {certificationEmail : memberEmail},
									success: function() {
			    						$(".input-email").attr("readonly", "readonly");
			    						btn.css("display", "none");
			    						$(".confirm").css("display", "inline-block")
									}
								})
							}
						}
					})
				});
				
				$(".confirm-serial").click(function(){
					$("input[name=memberEmail]").next("button").next("div").text("");
					const memberEmail = $("input[name=memberEmail]").val();
					const memberSerial = $(".confirm-input").val();
					const btn = $(this);
					if(memberSerial.length != 6) {
						$("input[name=memberEmail]").next("button").next("div").text("인증번호를 확인하세요.");
					} else {
						$("input[name=memberEmail]").next("button").next("div").text("");
						$.ajax({
							url:"${pageContext.request.contextPath}/rest/member/confirm_email",
							method:"get",
							data:{
								certificationEmail : memberEmail,
								certificationSerial : memberSerial
							},
							success:function(resp){
								if(resp == "NNNNY") {
									$(".join-form").submit();
								} else {
									$("input[name=memberEmail]").next("button").next("div").text("인증번호를 확인하세요.");
								}
							}
						});
					};
				});
			});
		</script>
	</body>
</html>