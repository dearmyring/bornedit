<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="BORNEDIT" name="title"/>
</jsp:include>
	<div class="container-1500 mb-50">
		<div class="top-menu mt-30 flex align-center space-around">
			<div class="">
				<div class="inline-block font-20 font-weight-700 me-20">
					<a href="${contextPage.request.contextPath}/">	
						<i class="fa-regular fa-clock me-5"></i>최근
					</a>
				</div>
				<div class="inline-block font-20 font-weight-700 present-select">
					<i class="fa-solid fa-arrow-trend-up me-5"></i>인기
				</div>
			</div>
			<div class="">
				<select class="select-align">
					<option value="">정렬 선택</option>
					<option value="board_like desc">좋아요 높은 순</option>
					<option value="board_view desc">조회수 높은 순</option>
				</select>
			</div>
		</div>
		
		<div class="w-100 mt-40 flex">
			<div class="row-warp" id="clone-parent">
				<div class="list-box inline-block" id="clone-child">
					<div class="list-video-box top">
						<a class="link-to-detail">
							<video class="w-100 video-size" onmouseover="this.play()" onmouseout="this.pause()" muted>
								<source class="video-no">
							</video>
						</a>
					</div>
					<div class="video-title">
						<a class="link-to-detail">
							<!-- jQuery로 동적 추가 -->
						</a>
					</div>
					<div class="video-content ">
						<!-- jQuery로 동적 추가 -->
					</div>
					<div class="use-equipment">
						<span class="home-body"></span>
						<span class="home-lens"></span>
						<span class="home-tripod"></span>
						<span class="home-right"></span>
						<span class="home-audio"></span>
						<span class="home-monitor"></span>
						<span class="home-etc"></span>
					</div>
					<div class="bottom-box flex align-center space-around nick-like">
						<div class="flex align-center">
							<div class="list-profile-box inline-block ">
								<a class="throw-info">
									<img class="main-profile-img" src="/image/basicProfileImage.png">
								</a>
							</div>
							<div class="ms-5 me-5 font-12 inline-block" style="color:#33333354">
								by
							</div>
							<div class="font-weight-500 board-nick inline-block">
								<a class="throw-info">
									<!-- jQuery로 동적 추가 -->
								</a>
							</div>
						</div>
						<div class="flex align-center ">
							<i class="fa-solid fa-heart"></i>
							<span class="ms-10 board-like">
								<!-- jQuery로 동적 추가 -->
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		// 무한 스크롤
	    const doc = $(document);    
	    const win = $(window);
	    
		// 페이지
		let p = 1;
		
		// 보여줄 리스트 개수
		let size = 16;
		
		
		$(function(){
			// 첫 목록 호출
			loadList();
			
			
			// 찍어논 html 태그 숨김
			$("#clone-child").hide();
			
			// 첫 로딩시 16개 조회
			function loadList(){
				// 페이징
				let endRow = p * size;
				let startRow = endRow - (size - 1);
				
				let data = {
						startRow : startRow,
						endRow : endRow,
						}
				
				$.ajax({
					url:"${contextPage.request.contextPath}/rest/home/popular/list",
					method:"post",
					contentType:"application/json",
					data:JSON.stringify(data),
					success: function(resp) {
						for(let i = 0; i < resp.length; i++){
							let clone = $("#clone-child").clone()
															.addClass("data-" + resp[i].homeList.rn)
															.appendTo("#clone-parent");
							$(".data-" + resp[i].homeList.rn).show();
							
							$(".data-" + resp[i].homeList.rn).children(".list-video-box")
												.children(".link-to-detail")
												.attr("href", "${contextPage.request.contextPath}/board/detail?boardNo=" + resp[i].homeList.boardNo);
							
							$(".data-" + resp[i].homeList.rn).children(".list-video-box")
												.find(".video-no")
												.attr("src", "${contextPage.request.contextPath}/rest/download/" + resp[i].homeList.videoNo);
							
							$(".data-" + resp[i].homeList.rn).children(".video-title")
												.children(".link-to-detail")
												.attr("href", "${contextPage.request.contextPath}/board/detail?boardNo=" + resp[i].homeList.boardNo)
												.text(resp[i].homeList.boardTitle);
							
							$(".data-" + resp[i].homeList.rn).children(".video-content")
												.text(resp[i].homeList.boardContent);
							
							if(resp[i].homeList.profileNo > 0) {
								$(".data-" + resp[i].homeList.rn).children(".nick-like")
												.children(".flex")
												.find(".main-profile-img")
												.attr("src", "${contextPage.request.contextPath}/rest/download/" + resp[i].homeList.profileNo);
							}
							
							$(".data-" + resp[i].homeList.rn).children(".nick-like")
												.children(".flex")
												.find(".throw-info")
												.attr("href", "${contextPage.request.contextPath}/member/profile?memberEmail=" + resp[i].homeList.memberEmail);
							
							$(".data-" + resp[i].homeList.rn).children(".nick-like")
												.children(".flex")
												.children(".board-nick")
												.children(".throw-info")
												.text(resp[i].homeList.memberNick);
							
							$(".data-" + resp[i].homeList.rn).children(".nick-like")
												.children(".flex")
												.children(".board-like")
												.text(resp[i].homeList.boardLike);
							
							for(let j = 0; j < resp[i].bodyDetail.length; j++) {
								$(".data-" + resp[i].homeList.rn).children(".use-equipment")
																	.children(".home-body")
																	.text("[" + resp[i].bodyDetail[j].bodyName + "]");
							}
							
							for(let j = 0; j < resp[i].lensDetail.length; j++) {
								$(".data-" + resp[i].homeList.rn).children(".use-equipment")
																	.children(".home-lens")
																	.text("[" + resp[i].lensDetail[j].lensName + "]");
							}
							
							for(let j = 0; j < resp[i].rightDetail.length; j++) {
								$(".data-" + resp[i].homeList.rn).children(".use-equipment")
																	.children(".home-right")
																	.text("[" + resp[i].rightDetail[j].rightName + "]");
							}
							
							for(let j = 0; j < resp[i].tripodDetail.length; j++) {
								$(".data-" + resp[i].homeList.rn).children(".use-equipment")
																	.children(".home-tripod")
																	.text("[" + resp[i].tripodDetail[j].tripodName + "]");
							}
							
							for(let j = 0; j < resp[i].audioDetail.length; j++) {
								$(".data-" + resp[i].homeList.rn).children(".use-equipment")
																	.children(".home-audio")
																	.text("[" + resp[i].audioDetail[j].audioName + "]");
							}
							
							for(let j = 0; j < resp[i].monitorDetail.length; j++) {
								$(".data-" + resp[i].homeList.rn).children(".use-equipment")
																	.children(".home-monitor")
																	.text("[" + resp[i].monitorDetail[j].monitorName + "]");
							}
							
							for(let j = 0; j < resp[i].etcDetail.length; j++) {
								$(".data-" + resp[i].homeList.rn).children(".use-equipment")
																	.children(".home-etc")
																	.text(resp[i].etcDetail[j].etcName);
							}
						}
					}
				});
			};
			
			// 스크롤 하단 도달시 조회목록 추가
			$(window).scroll(function(){ 
				if (doc.height() - win.height() - $(this).scrollTop() == 0) {
					// 페이지수 증가
					p++;
					
					// 페이징
					let endRow = p * size;
					let startRow = endRow - (size - 1);
					
					let data = {
							startRow : startRow,
							endRow : endRow
							}
					
					$.ajax({
						url:"${contextPage.request.contextPath}/rest/home/popular/list",
						method:"post",
						contentType:"application/json",
						data:JSON.stringify(data),
						success: function(resp) {
							for(let i = 0; i < resp.length; i++){
								let clone = $("#clone-child").clone()
																.addClass("data-" + resp[i].homeList.rn)
																.appendTo("#clone-parent");
								$(".data-" + resp[i].homeList.rn).show();
								
								$(".data-" + resp[i].homeList.rn).children(".list-video-box")
													.children(".link-to-detail")
													.attr("href", "${contextPage.request.contextPath}/board/detail?boardNo=" + resp[i].homeList.boardNo);
								
								$(".data-" + resp[i].homeList.rn).children(".list-video-box")
													.find(".video-no")
													.attr("src", "${contextPage.request.contextPath}/rest/download/" + resp[i].homeList.videoNo);
								
								$(".data-" + resp[i].homeList.rn).children(".video-title")
													.children(".link-to-detail")
													.attr("href", "${contextPage.request.contextPath}/board/detail?boardNo=" + resp[i].homeList.boardNo)
													.text(resp[i].homeList.boardTitle);
								
								$(".data-" + resp[i].homeList.rn).children(".video-content")
													.text(resp[i].homeList.boardContent);
								
								if(resp[i].homeList.profileNo > 0) {
									$(".data-" + resp[i].homeList.rn).children(".nick-like")
													.children(".flex")
													.find(".main-profile-img")
													.attr("src", "${contextPage.request.contextPath}/rest/download/" + resp[i].homeList.profileNo);
								} 
								
								$(".data-" + resp[i].homeList.rn).children(".nick-like")
													.children(".flex")
													.children(".board-nick")
													.text(resp[i].homeList.memberNick);
								
								$(".data-" + resp[i].homeList.rn).children(".nick-like")
													.children(".flex")
													.children(".board-like")
													.text(resp[i].homeList.boardLike);
								
								for(let j = 0; j < resp[i].bodyDetail.length; j++) {
									$(".data-" + resp[i].homeList.rn).children(".use-equipment")
																		.children(".home-body")
																		.text("[" + resp[i].bodyDetail[j].bodyName + "]");
								}
								
								for(let j = 0; j < resp[i].lensDetail.length; j++) {
									$(".data-" + resp[i].homeList.rn).children(".use-equipment")
																		.children(".home-lens")
																		.text("[" + resp[i].lensDetail[j].lensName + "]");
								}
								
								for(let j = 0; j < resp[i].rightDetail.length; j++) {
									$(".data-" + resp[i].homeList.rn).children(".use-equipment")
																		.children(".home-right")
																		.text("[" + resp[i].rightDetail[j].rightName + "]");
								}
								
								for(let j = 0; j < resp[i].tripodDetail.length; j++) {
									$(".data-" + resp[i].homeList.rn).children(".use-equipment")
																		.children(".home-tripod")
																		.text("[" + resp[i].tripodDetail[j].tripodName + "]");
								}
								
								for(let j = 0; j < resp[i].audioDetail.length; j++) {
									$(".data-" + resp[i].homeList.rn).children(".use-equipment")
																		.children(".home-audio")
																		.text("[" + resp[i].audioDetail[j].audioName + "]");
								}
								
								for(let j = 0; j < resp[i].monitorDetail.length; j++) {
									$(".data-" + resp[i].homeList.rn).children(".use-equipment")
																		.children(".home-monitor")
																		.text("[" + resp[i].monitorDetail[j].monitorName + "]");
								}
								
								for(let j = 0; j < resp[i].etcDetail.length; j++) {
									$(".data-" + resp[i].homeList.rn).children(".use-equipment")
																		.children(".home-etc")
																		.text(resp[i].etcDetail[j].etcName);
								}
							}
						}
					});
				}
			});
			
		});	
	</script>
	</body>
</html>