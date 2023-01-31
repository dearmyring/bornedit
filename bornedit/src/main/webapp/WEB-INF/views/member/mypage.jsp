<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원가입" name="title"/>
</jsp:include>
	<div class="container-1500">
		<div class="text-center">
			<div class="inline-block mypage-profile-box mt-50">
				<label for="file-input"><img class="header-profile-img cursor-pointer"></label>
			</div>
			<div class="mt-10 cursor-pointer">
				<div class="btn btn-negertive profile-img-delete" style="font-size: 12px">사진 삭제</div>
				<a type="button" class="btn btn-positive" href="edit_myinfo" style="font-size: 12px">정보 수정</a>
			</div>
			<input id="file-input" class="file-input" type="file" accept=".jpg, .png, .mp4">
		</div>
		<div class="text-center mt-30">
			<div class="mt-10 font-30 mypage-nick">${nickAndEmail.memberNick}</div>
			<div class="mt-10 font-15 mypage-email">${nickAndEmail.memberEmail}</div>
		</div>
	</div>
	
	<script>
		 $(function(){
			 
	     });
	</script>
</body>
</html>