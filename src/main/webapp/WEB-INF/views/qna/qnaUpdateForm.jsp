<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file= "../include/headerfooter/header.jsp"%>

<article id="qna-update-form" class="container">
<h2> 1:1 문의하기</h2>
	<h3> 고객님의 질문에 대해서 운영자가 1:1답변을 드립니다.</h3>
	<div id="qna-update-form-content">
		<form name="formm" method="post" action="qnaUpdate">
		
			<input type="hidden" name="qseq" value="${qnaVO.QSEQ}">
			<input type="hidden" name="qnadate" value="${qnaVO.QNADATE}">
			<fieldset>
				<!-- <legend>문의하기</legend> -->
				<div class="qna-update-table"><label>등록일</label><fmt:formatDate value="${qnaVO.QNADATE}" type="date"/><br></div>
				<div class="qna-update-table"><label>제목</label><input type="text" name="qsubject" size="60" value="${qnaVO.QSUBJECT}"><br></div>
				<div class="qna-update-table"><label>내용</label><textarea rows="8" cols="65" name="qcontent" >${qnaVO.QCONTENT}</textarea></div>
			</fieldset>
			<div class="clear"></div>
			<h4>${message}</h4>
			<div id="buttons" style="float:right">
				<input type="submit" value="수정하기"  class="submit">
				<input type="reset" value="취소"  class="cancel">
				<input type="button" value="레시피계속보기"  class="submit" onclick="location.href='/'">
			</div>
		</form>
	</div>
</article>

<%@ include file= "../include/headerfooter/footer.jsp"%>