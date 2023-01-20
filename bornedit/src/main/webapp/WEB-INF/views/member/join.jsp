<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원가입" name="title"/>
</jsp:include>

	<div class="container-500 a">
		<form action="join" action="post">
			<div>
				<input class="w-100" name="memberEmail" placeholder="이메일을 입력하세요." type="text" autocomplete="off">
				<button class="w-100 mt-10" type="button">이메일 인증</button>
			</div>
		</form>
	</div>
</body>
</html>