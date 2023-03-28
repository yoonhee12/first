<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findAccountByForm.jsp</title>
<script src="script/jquery-3.6.3.js" type="text/javascript"></script>
<script src="script/main.js" type="text/javascript"></script>
</head>
<body>
	<form name="frm" method="post">
		<c:if test="${param.param=='id'}"> 
			<h1>아이디 찾기 </h1>
			이름 <input type="text" name="name"/><br>
			전화번호 <input type="text" name="phone" placeholder="전화번호를 입력하세요" onkeyup="chkPhoneCode(event)"/><br>
			인증번호를 입력하세요 <input type="text" name="certiNum" value=""/>
			<span style="color:red; font-weight:bold;" id="timerspan"></span>
			<input type="button" id="timerBtn" onClick="timerStart(); this.onClick=' ';" value="전송"/>
			<input type="button" value="인증" disabled="disabled" id="certi" onClick="confirmNum();"/>
			<div><label id="certinoti"></label></div>
			<c:if test="${account.ID != null}">회원님의 아이디는 ${account.ID} 입니다.</c:if>
		</c:if>
		<c:if test="${param.param=='pwd'}">
			<h1>비밀번호 찾기</h1>
			<c:choose>
				<c:when test="${account.PWD == null}">
					이름 <input type="text" name="name"/><br>
					아이디 <input type="text" name="id"/><br>
					전화번호 <input type="text" name="phone" placeholder="전화번호를 입력하세요" onkeyup="chkPhoneCode(event)"/><br>
					인증번호를 입력하세요 <input type="text" name="certiNum" value=""/>
					<span style="color:red; font-weight:bold;" id="timerspan"></span>
					<input type="button" id="timerBtn" onClick="timerStart(); this.onClick=' ';" value="전송"/>
					<input type="button" value="인증" disabled="disabled" id="certi" onClick="confirmNum();"/>
					<div><label id="certinoti"></label></div>
				</c:when>
				<c:otherwise>
					새 비밀번호를 설정하세요
					비밀번호 : <input type="password" name="pwd" id="userpwd"/><br>
					비밀번호 확인 : <input type="password" name="pwdchk" id="userpwdchk"/>
					<input type="hidden" name="id" value="${account.ID}"/>
					<p id="error1" style="color:red"> </p>
				</c:otherwise>
			</c:choose>
		</c:if>
		${message}<br>
		<c:choose>
			<c:when test = "${account.PWD == null || account.ID == null}">
				<input type="button" class="buttons" value="찾기" onClick="search('${param.param}')" disabled="disabled" id="searchBtn"/>
			</c:when>
			<c:when test="${account.PWD != null && param.param=='pwd'}">
				<input type="button" value="설정" onClick="updatePass();"/>
			</c:when>
		</c:choose>
		<!-- <input type="submit" class="buttons" value="찾기"/> -->
		<input type="button" class="buttons" value="닫기" onClick="self.close();"/>
	</form>
	<script src="script/main-sy.js" type="text/javascript"></script>
</body>
</html>