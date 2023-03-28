<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file= "../include/headerfooter/header.jsp"%>

<article id="qna-write" class="container">
<h2> 1:1 질문하기</h2>
	<h3> 고객님의 질문에 대해서 운영자가 1:1답변을 드립니다.</h3>

	<form name="formm" method="post" action="qnaWrite" >
	
		<fieldset> 
			<legend>문의하기</legend>
			<table>
				<tr><td colspan="2"><input type="checkbox" name="secret" value="1" onClick="qnaChgChk(this)">
				비밀글설정&nbsp;&nbsp;&nbsp;비밀번호: <input type="password" name="qnapass" id="pass" size="15" disabled><br>
				<tr><th class="col-2">제목</th><td class="col-10"><input type="text" name="qsubject" value="${dto.qsubject}" size="60" id="qsubject" placeholder="제목을 입력해주세요"></td></tr>
				<tr><th class="col-2">내용</th><td class="col-10"><textarea rows="8" cols="61" name="qcontent" placeholder="내용을 입력해주세요">${dto.qcontent}</textarea><td></tr>
			</table>		
		</fieldset>
		
		<div class="clear"></div>
		<h4 style="margin-left:300px;">${message}</h4>
		<div id="buttons">
			<input type="submit" value="글쓰기"  class="submit" class="submit">
			<input type="reset" value="취소"  class="cancel">
			<input type="button" value="레시피계속보기"  class="submit" onclick="location.href='/'">
		
		</div>
	</form>
</article>

<%@ include file= "../include/headerfooter/footer.jsp"%>