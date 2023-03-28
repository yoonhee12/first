<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/admin/admin_header.jsp"%>


<article id="loginForm" style="margin:0 auto">
	<h1 class="login">Login</h1>
	<form method="post" action="adminlogin" name="loginFrm">
		<fieldset id="loginField"> 
			<legend></legend>
				<label>Admin ID</label>&nbsp;<input name="aid" type="text"/><br>
				<label>Password</label>&nbsp;<input name="pwd" type="password"/><br>
		</fieldset>
		<div id="buttons" class="pt-5">
			<input type="submit" value="로그인" class="submit" />
		</div><br><br>
		<div>&nbsp;&nbsp;&nbsp;${message}</div>
	</form>
</article>
<%@ include file="../../include/admin/footer.jsp"%>
