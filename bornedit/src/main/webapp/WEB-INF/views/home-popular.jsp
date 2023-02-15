<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="BORNEDIT" name="title"/>
</jsp:include>
	<div class="container-1500 mb-50 ">
		<div class="top-menu mt-30 flex align-center space-around ">
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
				<div class="list-box inline-block mb-50" id="clone-child">
					<div class="list-video-box top">
						<a href="${contextPage.request.contextPath}/board/detail?boardNo={{boardNo}}">
							<video class="w-100 video-size">
								<source class="video-no" src="${contextPage.request.contextPath}/video/11.mp4">
							</video>
						</a>
					</div>
					<div class="video-title">
						<a href="${contextPage.request.contextPath}/board/detail?boardNo={{boardNo}}">
							{{videoTitle}}
						</a>
					</div>
					<div class="video-content ">
						{{videoContent}}
					</div>
					<div class="use-equipment">
						-
					</div>
					<div class="bottom-box flex align-center space-around nick-like">
						<div class="flex align-center">
							<div class="list-profile-box inline-block ">
								<img class="main-profile-img" src="/image/basicProfileImage.png">
							</div>
							<div class="ms-5 me-5 font-12 inline-block" style="color:#33333354">
								by
							</div>
							<div class="font-weight-500 board-nick inline-block">
								{{memberNick}}
							</div>
						</div>
						<div class="flex align-center ">
							<i class="fa-solid fa-heart"></i>
							<span class="ms-10 board-like">{{boardLike}}</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(function(){
			loadList();
			$("#clone-child").hide();			
			
			function loadList(){
				$.ajax({
					url:"${contextPage.request.contextPath}/rest/home/list",
					success: function(resp) {
						for(let i = 0; i < resp.length; i++){
							let clone = $("#clone-child").clone().addClass("data-" + i).appendTo("#clone-parent");
							$(".data-" + i).show();
							$(".data-" + i).children(".list-video-box").find(".video-no").attr("src", "${contextPage.request.contextPath}/rest/download/" + resp[i].homeList.videoNo);
							$(".data-" + i).children(".video-title").text(resp[i].homeList.boardTitle);
							$(".data-" + i).children(".video-content").text(resp[i].homeList.boardContent);
							if(resp[i].homeList.profileNo > 0) {
								$(".data-" + i).children(".nick-like").children(".flex").find(".main-profile-img").attr("src", "${contextPage.request.contextPath}/rest/download/" + resp[i].homeList.profileNo);
							} 
							$(".data-" + i).children(".nick-like").children(".flex").children(".board-nick").text(resp[i].homeList.memberNick);
							$(".data-" + i).children(".nick-like").children(".flex").children(".board-like").text(resp[i].homeList.boardLike);
							
							for(let j = 0; j < resp[i].lensDetail.length; j++) {
								$(".data-" + i).children(".use-equipment").text(resp[i].lensDetail[j].lensName);
							}
						}
					}
				});
			};
			
		});	
	</script>
	</body>
</html>