<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원가입" name="title"/>
</jsp:include>
	<div class="container-1500">
		<div class="text-center">
			<div class="inline-block mypage-profile-box mt-30">
				<img class="header-profile-img" src="${pageContext.request.contextPath}/image/basicProfileImage.png">
			</div>
		</div>
		<div class="text-center mt-10">
			<div class="mt-10 font-30 mypage-nick">${memberDto.memberNick}</div>
			<div class="mt-10 font-15 mypage-email">${memberDto.memberEmail}</div>
		</div>
		<div class="mt-20 container-500">
			<form class="join-form" action="edit_myinfo" method="post">
				<div class="mt-50">
					<div class="mt-30 mb-10"><h3>비밀번호</h3></div>
					<label class="mb-5 helper-text" for="member-pw">8~16글자, 특수문자 !@#$를 포함해서 입력해 주세요.</label>
					<input class="w-100 member-pw input mt-5" name="memberPw" type="password" placeholder="비밀번호를 입력하세요.">
					<div class="mt-5 help-text"></div>
				</div>
				<div class="mt-40">
					<div class="mt-30 mb-10"><h3>비밀번호 확인</h3></div>
					<input class="w-100 pw-check input mt-5" type="password" placeholder="비밀번호를 확인하세요.">
					<div class="mt-5 help-text"></div>
				</div>
				<div class="mt-40">
					<div class="mt-30 mb-10"><h3>닉네임</h3></div>
					<label class="mb-5 helper-text">영문, 한글, 숫자 10자 이내로 입력해주세요.</label>
					<input class="w-100 input mt-5" name="memberNick" type="text" placeholder="사용하실 닉네임을 입력하세요." autocomplete="off" value="${memberDto.memberNick}">
					<div class="mt-5 help-text"></div>
				</div>
				<div class="mt-40">
					<div class="mt-30 mb-10"><h3>한줄 소개(선택)</h3></div>
					<label class="mb-5 helper-text">50자 이내로 소개글을 작성해주세요.</label>
					<input class="w-100 input mt-5 howManyLetters" name="memberIntroduce" type="text" placeholder="회원님을 소개할 내용을 입력하세요." autocomplete="off" value="${memberDto.memberIntroduce}">
					<div class="text-right mt-5">
						<span class="letter helper-text">0</span>
						<span class="helper-text">/ 50</span>
					</div>
				</div>
				<div class="mt-40">
					<div class="mt-30 mb-10"><h3>제작 의뢰 가능 여부</h3></div>
					<label class="mb-5 helper-text">시청자의 제작 외뢰를 받으시겠어요?</label>
					<div class="mt-10 offer-box">
						<c:choose>
							<c:when test="${memberDto.memberOffer == 'Y'}">
								<div>
									<input class="mb-20" type="radio" name="memberOffer" value="Y" checked>상시 가능
								</div>
								<div>
									<input type="radio" name="memberOffer" value="N">요청 불가
								</div>
							</c:when>
							<c:otherwise>
								<div>
									<input class="mb-20" type="radio" name="memberOffer" value="Y">상시 가능
								</div>
								<div>
									<input type="radio" name="memberOffer" value="N" checked>요청 불가
								</div>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="mt-5 help-text"></div>
				</div>
				<button type="submit" class="w-100 mb-10 mt-50 btn btn-positive cursor-pointer">수정 완료</button>
				<div class="join-fail text-center"></div>
			</form>
		</div>
	</div>
	
	<script>
		$(function(){
			$(".letter").text($(".howManyLetters").val().length);
			
			// 상태 객체
			const validChecking = {
					memberPwCheckValid: true,
					memberNickValid: true,
	                memberPwRegex: /^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$])[a-zA-Z0-9!@#$]{8,16}$/,
	                memberNickRegex: /^[a-zA-Z0-9가-힣]{1,10}$/,
					isAllValid: function() {
						return this.memberNickValid && this.memberPwCheckValid;
					}
			};
			
            // 한줄소개 글자수 안내
            $(".howManyLetters").on("input", function(e){
            	const letterLength = $(this).val().length;
            	$(".letter").text(letterLength);
            	
            	if(letterLength > 50) {
            		$(this).val($(this).val().substring(1, 50));
            	}
            });
            
			// 비밀번호 정규식 검사
            $("input[name=memberPw]").blur(function(){
                const memberPw = $(this).val();
                const regex = validChecking.memberPwRegex;
                $("input[name=memberPw]").next("div").text("");
                if(memberPw == "") {
                	$("input[name=memberPw]").next("div").text("");
                }
                else if(!regex.test(memberPw)) {
                    $("input[name=memberPw]").next("div").text("비밀번호 형식이 맞지 않습니다.");
                } 
            });
			
			// 비밀번호 입력 재확인
            $(".pw-check").blur(function(){
            	const memberPw = $(this).val();
            	const memberPwOrigin = $("input[name=memberPw]").val();
            	$(".pw-check").next("div").text("");
            	
            	if(memberPw == memberPwOrigin) {
            		validChecking.memberPwCheckValid = true;
            		$(".pw-check").next("div").text("");
            	} 
            	else {
                    validChecking.memberPwCheckValid = false;
                    $(this).next("div").text("비밀번호가 일치하지 않습니다.");
            	}
            });
			
         	// 닉네임 중복 검사
            $("input[name=memberNick]").change(function(){
            	const memberNick = $(this).val();
            	const regex = validChecking.memberNickRegex;
            	$(this).next("div").text("");
            	

            	if(!regex.test(memberNick)) {
					validChecking.memberNickValid = false;
					$(this).next("div").text("닉네임 형식이 맞지 않습니다.");
				}
				
				$.ajax({
					url: "${pageContext.request.contextPath}/rest/member/nick/" + memberNick,
					method: "get",
					success: function(resp) {
		            	if(memberNick == '${memberDto.memberNick}') {
							validChecking.memberNickValid = true;
							$(this).next("div").text("");
						}
		            	else if(resp == "NNNNN") {
							validChecking.memberNickValid = false;
							$("input[name=memberNick]").next("div").text("이미 사용중인 닉네임입니다.");
						} 
		            	else {
							validChecking.memberNickValid = true;
						}
					}
				});
            });
         	
            // 폼 전송 조건부 전송
            $(".join-form").submit(function(e){
            	e.preventDefault();
            	$(this).find("input").blur();
            	
                if(validChecking.isAllValid()) {
                   	this.submit();
                } else {
                	$(".join-fail").text("변경 후 조건을 확인해 주세요.").addClass("help-text");
                }
            })
		})
	</script>
</body>
</html>