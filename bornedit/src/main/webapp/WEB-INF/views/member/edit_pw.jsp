<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<title>BORNEDIT-비밀번호 변경</title>
	</head>
	<body>
		<div class="container-300 screen-center">
			<div class="logo text-center">
				<a class="font-30" href="${pageContext.request.contextPath}/">BORNEDIT</a>
			</div>
			<form class="join-form" action="edit_pw" method="post">
				<div>
					<input class="w-100 mt-10 input" name="memberEmail" value="${memberDto.memberEmail}" hidden="hidden">
				</div>
				<div class="mt-20">
					<label class="mb-5 helper-text second" for="member-pw">8~16글자, 특수문자 !@#$를 포함해서 입력해 주세요.</label>
					<input class="w-100 mt-10 input member-pw" name="memberPw" placeholder="변경할 비밀번호를 입력하세요." type="password">
				</div>
				<div>
					<input class="w-100 mt-10 input pw-check" placeholder="비밀번호를 확인하세요." type="password">
					<div class="mt-5 help-text"></div>
				</div>
				<div>
					<button class="w-100 mt-10 btn btn-positive activation" type="submit">변경하기</button>
				</div>
			</form>
		</div>
		<script>
			$(function(){
				// 상태 객체
				const validChecking = {
						memberPwValid: false,
						memberPwCheckValid: false,
		                memberPwRegex: /^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$])[a-zA-Z0-9!@#$]{8,16}$/,
						isAllValid: function() {
							return this.memberPwValid && this.memberPwCheckValid;
						}
					}
				// 비밀번호 정규식 검사
	            $("input[name=memberPw]").blur(function(){
	                const memberPw = $(this).val();
	                const regex = validChecking.memberPwRegex;
	                $("input[name=memberPw]").next("div").text("");
	                
	                if(regex.test(memberPw)) {
	                    validChecking.memberPwValid = true;
	                } else {
	                    validChecking.memberPwValid = false;
	                    $("input[name=memberPw]").next("div").text("비밀번호 형식이 맞지 않습니다.");
	                }
	            });
				
				// 비밀번호 입력 재확인
	            $(".pw-check").blur(function(){
	            	const memberPw = $(this).val();
	            	const memberPwOrigin = $("input[name=memberPw]").val();
	            	$(".pw-check").next("div").text("");
	            	
	            	if(memberPw == "") {
	                    validChecking.memberPwCheckValid = false;
	                    $(this).next("div").text("비밀번호를 확인하세요.");
	            	} 
	            	else if(memberPw == memberPwOrigin) {
	            		validChecking.memberPwCheckValid = true;
	            	} 
	            	else {
	                    validChecking.memberPwCheckValid = false;
	                    $(this).next("div").text("비밀번호가 일치하지 않습니다.");
	            	}
	            });
				
				$(".join-form").submit(function(e){
					e.preventDefault();
					
					if(validChecking.isAllValid()) {
	                   	this.submit();
	                } else {
	                	$(".help-text").text("입력 사항을 확인해 주세요.").addClass("btn fail-btn screen-bottom-join notice-in notice-out");
	                }
				})
				
			});
		</script>
	</body>
</html>