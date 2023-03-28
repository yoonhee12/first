<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>

<article id="loginForm">
	<h1 class="login">Login</h1>
	<form method="post" action="login" name="loginFrm">
		<input type="hidden" name="command" value="login"/>
		<fieldset id="loginField"> 
			<legend></legend>
				<label>User ID</label><input name="id" type="text"/><br>
				<label>Password</label><input name="pwd" type="password"/><br>
		</fieldset>
		<div id="buttons" class="pt-5">
			<input type="submit" value="로그인" class="submit" />
			<input type="button" value="회원가입" class="cancel" onClick="location.href='contract'"/>
			<input type="button" value="아이디 비밀번호 찾기" class="submit" onClick="find_account();"/>
		</div><br><br>
		<div>&nbsp;&nbsp;&nbsp;${message}</div>
	</form>
</article>
<%@ include file="../include/headerfooter/footer.jsp" %>