<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/admin/admin_header.jsp"%>

<article class="admin-board container">
	<div id="memberdetail">
		<h1>회원정보</h1>
		<form method="post" name="formm">
		
			<fieldset>
			<legend>member detail Info</legend>			
				<span style="float:left; margin-right:20px">
					<img src="imageProfile/${memberVO.IMG}" onerror="this.src='imageProfile/basic.jpg'" style="border-radius:20px" 
					height="620"/>
					<!-- <img src="imageProfile/${memberVO.img}" style="border-radius:20px"/>-->
				</span>
				<h2>${memberVO.NAME}</h2>
				<label>이 름: </label><p>${memberVO.NAME}</p>
				<label>아이디: </label><p>${memberVO.ID}</p>
				<label>전화번호: </label><p>${memberVO.PHONE}</p>
				<label>이메일: </label><p>${memberVO.EMAIL}</p>
				<label>닉네임: </label><p>${memberVO.NICK}</p>
				<label>주  소: </label><p>${memberVO.ADDRESS1}&nbsp;${memberVO.ADDRESS2}</p>
				<label>우편번호: </label><p>${memberVO.ZIP_NUM}</p>
				<label>가입일자: </label><p>${memberVO.INDATE}</p>						
			</fieldset>
			<br>
			<div class="clear"></div>
			<div id="buttons">
				<input type="button" value="뒤로" class="cancel" onclick="history.go(-1);">
			</div>
		</form>
	</div>
</article>

<%@ include file="../../include/admin/footer.jsp"%>