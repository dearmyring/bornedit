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
		<title>BORNEDIT-로그인</title>
	</head>
	<body>
		<div class="container-300 screen-center">
			<div class="logo text-center">
				<a class="font-30" href="${pageContext.request.contextPath}/">BORNEDIT</a>
			</div>
			
			<form action="login" method="post">
				<div class="w-100">
					<input class="input w-100 mt-10" name="memberEmail" placeholder="이메일을 입력하세요." autocomplete="off" type="email">
				</div>
				<div class="w-100">
					<input class="input w-100 mt-10" name="memberPw" placeholder="비밀번호를 입력하세요." type="password">
				</div>
				<div class="w-100">
					<button class="btn btn-positive w-100 mt-10" type="submit">로그인</button>
				</div>
			</form>
		    <c:if test="${param.error != null}">
				<div class="container-300 mt-10">
					<div class="w-100 text-center help-text">이메일 주소나 비밀번호가 틀립니다.</div>
				</div>
			</c:if>
			<div class="mt-20">
				<div class="float-left ms-50">
					<a href="find_pw">
						비밀번호 찾기
					</a>
				</div>
				<div class="float-right me-50">
					<a href="join">
						회원가입
					</a>
				</div>
			</div>
		</div>
	</body>
</html>