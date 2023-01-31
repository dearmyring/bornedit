<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원가입" name="title"/>
</jsp:include>
	<div class="container-500">
		<form id="join-form" action="join" method="post">
			<div>
				<div class="mt-50 mb-10"><h3>이메일</h3></div>
					<div class="w-100 flex-parent">
						<input class="w-45 input input-email email-front flex-1" placeholder="이메일을 입력하세요." type="text" autocomplete="off">
						<div class="w-10 text-center helper-text inline-block">@</div>
						<input class="w-45 input input-email email-rear direct-email" placeholder="직접입력" type="text" autocomplete="off">
						<select class="w-45 input input-email email-rear select-email">
							<option selected value="naver.com">naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="nate.com">nate.com</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="outlook.com">outlook.com</option>
							<option value="icloud.com">icloud.com</option>
							<option value="direct">직접 입력</option>
						</select>
					</div>
				<input class="origin-send-email" name="memberEmail" value="" hidden>
				<button class="w-100 mt-10 send-btn cursor-pointer btn cert-serial" type="button" disabled>이메일 인증</button>
				<div class="mt-5 help-text"></div>
				<input class="input w-100 mt-5 confirm confirm-input" placeholder="인증번호를 입력하세요" autocomplete="off">
				<button class="btn w-100 mt-10 cursor-pointer btn-positive confirm confirm-serial" type="button">번호 확인</button>
			</div>
			<div class="mt-40">
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
				<input class="w-100 input mt-5" name="memberNick" type="text" placeholder="사용하실 닉네임을 입력하세요." autocomplete="off">
				<div class="mt-5 help-text"></div>
			</div>
			<div class="mt-40">
				<div class="mt-30 mb-10"><h3>한줄 소개(선택)</h3></div>
				<label class="mb-5 helper-text">50자 이내로 소개글을 작성해주세요.</label>
				<input class="w-100 input mt-5 howManyLetters" name="memberIntroduce" type="text" placeholder="회원님을 소개할 내용을 입력하세요." autocomplete="off">
				<div class="text-right mt-5">
					<span class="letter helper-text">0</span>
					<span class="helper-text">/ 50</span>
				</div>
			</div>
			<div class="mt-40">
				<div class="mt-30 mb-10"><h3>제작 의뢰 가능 여부</h3></div>
				<label class="mb-5 helper-text">시청자의 제작 외뢰를 받으시겠어요?</label>
				<div class="mt-10 offer-box">
					<div>
						<input class="mb-20" type="radio" name="memberOffer" value="Y">상시 가능
					</div>
					<div>
						<input type="radio" name="memberOffer" value="N" checked>요청 불가
					</div>
				</div>
				<div class="mt-5 help-text asd"></div>
			</div>
			<button type="submit" class="w-100 mb-10 mt-50 btn btn-positive cursor-pointer">회원가입하기</button>
			<span class="join-fail"></span>
		</form>
		<div class="text-center mb-40 mt-10">
			<span>이미 아이디가 있으신가요?</span>
			<span><a class="in-use-id" href="../member/login">로그인</a></span>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<script>
		$(function(){
			// 상태 객체
			const validChecking = {
					memberEmailValid : false,
					memberPwValid: false,
					memberPwCheckValid: false,
					memberNickValid: false,
	                memberPwRegex: /^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$])[a-zA-Z0-9!@#$]{8,16}$/,
	                memberNickRegex: /^[a-zA-Z0-9가-힣]{1,10}$/,
					isAllValid: function() {
						return this.memberEmailValid && this.memberPwValid && this.memberNickValid && this.memberPwCheckValid;
					}
			};
			
			// input에 입력된 value값 hidden으로 넘김
			$(".input-email").on("input", function(){
				const emailFront = $(".email-front").val();
				const emailRear = $(".select-email").val();
				$("input[name=memberEmail]").attr("value", emailFront + "@" + emailRear);
				if(emailFront.length > 0) {
					$(".send-btn").prop("disabled", false).addClass("cursor-pointer btn-positive");
				} else {
					$(".send-btn").prop("disabled", true).removeClass("cursor-pointer btn-positive");
				}
			})
			
			// 이메일 직접 입력 선택시 변경
			$(".select-email").on("change", function(){
				const val = $(this).val();
				if(val == "direct") {
					$(".direct-email").css("display", "inline-block");
					$(".select-email").css("display", "none");
				} else {
					$(".select-email").css("display", "inline-block");
					$(".direct-email").css("display", "none");
				}
			})
			
			// input에 입력된 value값 hidden으로 넘김
			$(".direct-email").on("input", function(){
				const emailFront = $(".email-front").val();
				const emailRear = $(".direct-email").val();
				$("input[name=memberEmail]").attr("value", emailFront + "@" + emailRear);
				if(emailFront.length > 0) {
					$(".send-btn").prop("disabled", false).addClass("cursor-pointer btn-positive");
				} else {
					$(".send-btn").prop("disabled", true).removeClass("cursor-pointer btn-positive");
				}
			})
			
			// 이메일 입력 후 인증 버튼 누를시 중복검사 && 인증번호 전송
			$(".send-btn").click(function(){
				const memberEmail = $("input[name=memberEmail]").val();
				const btn = $(this);
				$.ajax({
					url: "${pageContext.request.contextPath}/rest/member/email/" + memberEmail,
					method: "get",
					success: function(resp) {
						if(resp == "NNNNN") {
							btn.prop("disabled", true);
							$("input[name=memberEmail]").next("button").next("div").text("이미 사용중인 이메일입니다.");
						} 
						else {
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
			
			// 인증번호 검사
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
								validChecking.memberEmailValid = true;
								btn.text("인증 완료").removeClass("cursor-pointer btn-positive");
								$(".confirm-input").remove();
								$(".input-email").attr("readonly", "readonly");
								btn.attr("disabled", true);
							} else {
								validChecking.memberEmailValid = false;
								$("input[name=memberEmail]").next("button").next("div").text("인증번호를 확인하세요.");
							}
						}
					});
				};
			});
		     
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
            
            // 닉네임 중복 검사
            $("input[name=memberNick]").blur(function(){
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
						if(resp == "NNNNN") {
							validChecking.memberNickValid = false;
							$("input[name=memberNick]").next("div").text("이미 사용중인 닉네임입니다.");
						} else {
							validChecking.memberNickValid = true;
						}
					}
				});
            });
            
            // 한줄소개 글자수 안내
            $(".howManyLetters").on("input", function(e){
            	const letterLength = $(this).val().length;
            	$(".letter").text(letterLength);
            	
            	if(letterLength > 50) {
            		$(this).val($(this).val().substring(1, 50));
            	}
            });
            
            // 폼 전송 조건부 전송
            $("#join-form").submit(function(e){
            	e.preventDefault();
            	$(this).find("input").blur();
            	
                if(validChecking.isAllValid()) {
                   	this.submit();
                } else {
                	$(".join-fail").text("입력 사항을 확인해 주세요.").addClass("btn fail-btn screen-bottom-join notice-in notice-out");
                }
            })

            
		});
	</script>
</body>
</html>