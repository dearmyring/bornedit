<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원가입" name="title"/>
</jsp:include>
	<div class="container-500 mt-50">
		<form class="write-form" action="write" method="post">
			<label for="input-video">	
				<div class="input-video cursor-pointer text-center mb-50" style="overflow: hidden;">
					<div class="video-guide">
						<div>
							<img class="video-icon" src="${contextPage.reqeust.contextPath}/image/video-camera.png">
						</div>
						<div class="mt-10 mb-10">
							동영상 첨부 +
						</div>
					</div>
					<video controls onmouseover="this.play()" onmouseout="this.pause()" class="video-view">
					</video>
				</div>
			</label>
			<input class="mb-50" id="input-video" type="file" accept=".mp4, .avi, .mov" hidden="hidden">
			<input class="send-attachment-no" name="attachmentNo" value="" type="number" hidden="hidden">
			<div class="row">
				<label class="write-label" for="title">제목(필수)</label>
				<input id="title" class="mt-10 mb-20 w-100 input" name="boardTitle" autocomplete="off" type="text" required>
			</div>
			<div class="row">
				<label class="write-label" for="main-body">메인바디(필수)</label>
				<input id="main-body" class="mt-10 mb-20 w-100 input" name="mainBody" autocomplete="off" type="text" required>
			</div>
			<div class="row">
				<label class="write-label" for="employee">촬영인원(필수)</label>
				<input id="employee" class="mt-10 mb-20 w-100 input" name="howManyEmployee" autocomplete="off" type="number" value="1" required>
			</div>
			<div class="row">
				<label class="write-label" for="board-content">상세 내용</label>
				<textarea id="board-content" rows="20" class="mt-10 mb-20 w-100 input" name="boardContent" autocomplete="off" type="text"></textarea>
			</div>
			<div class="row">
				<div class="write-label">사용 장비 추가</div>
				<div class="add-equipment-btn w-100 mt-10 mb-30">
					<button class="add-body-btn btn body" type="button">바디</button>
					<button class="add-body-btn btn lens" type="button">렌즈</button>
					<button class="add-body-btn btn right" type="button">조명</button>
					<button class="add-body-btn btn tripod" type="button">삼각대</button>
					<button class="add-body-btn btn audio" type="button">오디오</button>
					<button class="add-body-btn btn monitor" type="button">모니터</button>
					<button class="add-body-btn btn etc" type="button">ETC</button>
				</div>
			</div>
			<div class="equipment-area mb-20">
				<div class="row body-area display-none">
					<div><label class="write-label" for="body">바디</label></div>
					<input id="body" class="mt-10 mb-20 w-85 input" name="bodyName" autocomplete="off" type="text">
					<div class="inline-block cursor-pointer add-equipment body">
						<span class="ms-10 me-5"><i class="fa-solid fa-square-plus" style="color:#67C2EB"></i></span>
						<span>추가</span>
					</div>
				</div>
				<div class="row lens-area display-none">
					<div><label class="write-label" for="lens">렌즈</label></div>
					<input id="lens" class="mt-10 mb-20 w-85 input" name="lensName" autocomplete="off" type="text">
					<div class="inline-block cursor-pointer add-equipment lens">
						<span class="ms-10 me-5"><i class="fa-solid fa-square-plus" style="color:#67C2EB"></i></span>
						<span>추가</span>
					</div>
					
				</div>
				<div class="row right-area display-none">
					<div><label class="write-label" for="right">조명</label></div>
					<input id="right" class="mt-10 mb-20 w-85 input" name="rightName" autocomplete="off" type="text">
					<div class="inline-block cursor-pointer add-equipment right">
						<span class="ms-10 me-5"><i class="fa-solid fa-square-plus" style="color:#67C2EB"></i></span>
						<span>추가</span>
					</div>
				</div>
				<div class="row tripod-area display-none">
					<div><label class="write-label" for="tripod">삼각대</label></div>
					<input id="tripod" class="mt-10 mb-20 w-85 input" name="tripodName" autocomplete="off" type="text">
					<div class="inline-block cursor-pointer add-equipment tripod">
						<span class="ms-10 me-5"><i class="fa-solid fa-square-plus" style="color:#67C2EB"></i></span>
						<span>추가</span>
					</div>
				</div>
				<div class="row audio-area display-none">
					<div><label class="write-label" for="audio">오디오</label></div>
					<input id="audio" class="mt-10 mb-20 w-85 input" name="audioName" autocomplete="off" type="text">
					<div class="inline-block cursor-pointer add-equipment audio">
						<span class="ms-10 me-5"><i class="fa-solid fa-square-plus" style="color:#67C2EB"></i></span>
						<span>추가</span>
					</div>
				</div>
				<div class="row monitor-area display-none">
					<div><label class="write-label" for="monitor">모니터</label></div>
					<input id="monitor" class="mt-10 mb-20 w-85 input" name="monitorName" autocomplete="off" type="text">
					<div class="inline-block cursor-pointer add-equipment monitor">
						<span class="ms-10 me-5"><i class="fa-solid fa-square-plus" style="color:#67C2EB"></i></span>
						<span>추가</span>
					</div>
				</div>
				<div class="row etc-area display-none">
					<div><label class="write-label" for="etc">ETC</label></div>
					<input id="etc" class="mt-10 mb-20 w-85 input" name="etcName" autocomplete="off" type="text">
					<div class="inline-block cursor-pointer add-equipment etc">
						<span class="ms-10 me-5"><i class="fa-solid fa-square-plus" style="color:#67C2EB"></i></span>
						<span>추가</span>
					</div>
				</div>
			</div>
			
			<button type="submit" class="btn btn-positive w-100 mb-50">작업물 등록</button>
		</form>
	</div>
	<script>
		$(function(){
			
  			$(".add-equipment").click(function(){
				const body = $("<input>").addClass("w-85 input mb-20").attr("name", "bodyName").attr("autocomplete", "off").attr("type", "text");
				const lens = $("<input>").addClass("w-85 input mb-20").attr("name", "lensName").attr("autocomplete", "off").attr("type", "text");
				const right = $("<input>").addClass("w-85 input mb-20").attr("name", "rightName").attr("autocomplete", "off").attr("type", "text");
				const tripod = $("<input>").addClass("w-85 input mb-20").attr("name", "tripodName").attr("autocomplete", "off").attr("type", "text");
				const audio = $("<input>").addClass("w-85 input mb-20").attr("name", "audioName").attr("autocomplete", "off").attr("type", "text");
				const monitor = $("<input>").addClass("w-85 input mb-20").attr("name", "monitorName").attr("autocomplete", "off").attr("type", "text");
				const etc = $("<input>").addClass("w-85 input mb-20").attr("name", "etcName").attr("autocomplete", "off").attr("type", "text");
				const removeBtn1 = $("<div>").addClass("inline-block cursor-pointer remove-equipment");
				const removeBtn2 = $("<span>").addClass("ms-10 me-5");
				const removeBtn3 = $("<i>").addClass("fa-solid fa-square-minus").css("color", "#EE7878");
				const removeBtn4 = $("<span>").text("삭제");
				const removeBtn5 = removeBtn2.append(removeBtn3);
				const removeBtn6 = removeBtn1.append(removeBtn5);
				const removeBtn7 = removeBtn6.append(removeBtn4);
				
				if($(this).hasClass("body")) {
					const div = $("<div>").addClass("add-equipment-success").append(body).append(removeBtn7);
					$(".body-area").append(div);
				}
				else if($(this).hasClass("lens")) {
					const div = $("<div>").addClass("add-equipment-success").append(lens).append(removeBtn7);
					$(".lens-area").append(div);
				}
				else if($(this).hasClass("right")) {
					const div = $("<div>").addClass("add-equipment-success").append(right).append(removeBtn7);
					$(".right-area").append(div);
				}
				else if($(this).hasClass("tripod")) {
					const div = $("<div>").addClass("add-equipment-success").append(tripod).append(removeBtn7);
					$(".tripod-area").append(div);
				}
				else if($(this).hasClass("audio")) {
					const div = $("<div>").addClass("add-equipment-success").append(audio).append(removeBtn7);
					$(".audio-area").append(div);
				}
				else if($(this).hasClass("monitor")) {
					const div = $("<div>").addClass("add-equipment-success").append(monitor).append(removeBtn7);
					$(".monitor-area").append(div);
				}
				else if($(this).hasClass("etc")) {
					const div = $("<div>").addClass("add-equipment-success").append(etc).append(removeBtn7);
					$(".etc-area").append(div);
				}
			}); 
			
	        $(document).on("click", ".remove-equipment", function(){
	        	$(this).parents(".add-equipment-success").remove();
	        });
	        
	        $("#input-video").change(function(){
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
	        				const videoView = $("<source>").attr("src", resp).addClass("video-size");
	        				$(".video-guide").hide();
	        				$(".video-view").css("display", "block").append(videoView).addClass("video-size");
	        				$(".input-video").css("border", "none");
	        				const attachmentNo = (resp.split("download/")[1]);
	                        $(".send-attachment-no").val(attachmentNo);
	                	}
	            	});
	        	} else {
	        		$(".video-guide").show();
	        	}
	        });
	        
	        $(".add-body-btn").click(function(){
	        	if($(this).hasClass("body")) {
	        		$(".body-area").removeClass("display-none");
	        	} 
	        	else if($(this).hasClass("lens")) {
	        		$(".lens-area").removeClass("display-none");
	        	}
	        	else if($(this).hasClass("right")) {
	        		$(".right-area").removeClass("display-none");
	        	}
	        	else if($(this).hasClass("tripod")) {
	        		$(".tripod-area").removeClass("display-none");
	        	}
	        	else if($(this).hasClass("audio")) {
	        		$(".audio-area").removeClass("display-none");
	        	}
	        	else if($(this).hasClass("monitor")) {
	        		$(".monitor-area").removeClass("display-none");
	        	}
	        	else if($(this).hasClass("etc")) {
	        		$(".etc-area").removeClass("display-none");
	        	}
	        });
	      
		});
	</script>
</body>
</html>