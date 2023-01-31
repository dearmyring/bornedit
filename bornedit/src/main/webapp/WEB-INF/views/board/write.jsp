<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원가입" name="title"/>
</jsp:include>
	<div class="container-500 mt-50">
		<label for="input-video">	
			<div class="input-video cursor-pointer text-center">
				<div>
					<div>
						<img class="video-icon" src="${contextPage.reqeust.contextPath}/image/video-camera.png">
					</div>
					<div class="mt-10 mb-10">
						동영상 첨부 +
					</div>
				</div>
			</div>
		</label>
		<input id="input-video" type="file" accept=".mp4, .avi, .mov">
	</div>
	
</body>
</html>