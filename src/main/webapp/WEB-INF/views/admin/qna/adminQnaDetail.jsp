<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/admin/admin_header.jsp"%>

<article class="admin-board container admin-qna-detail">
	<h1>Q&amp;A 게시판</h1>   
	<form name="frm" method="post">
	<input type="hidden" name="qseq" value="${qnaVO.QSEQ}">
	<table id="qnaList"> <!-- 게시물의 내용 -->
		<tr><th width="20%">제목</th><td align="left"> ${qnaVO.QSUBJECT}</td></tr>
		<tr><th>등록일</th><td align="left"> <fmt:formatDate value="${qnaVO.QNADATE}"/></td></tr>
		<tr><th>내용</th><td  align="left"> ${qnaVO.QCONTENT}</td></tr>
	</table>
	<!-- 관리자가 쓴 답글 또는 답글 쓰는 입력란 표시 -->
	<c:choose>          
		<c:when test='${qnaVO.REP=="1"}'> 
			<table id="qnaList">
	    		<tr><td colspan="2"><textarea name="replyQna" rows="3" cols="50"></textarea>
	   				<input type="button" class="btn" value="답변등록" onClick="go_rep()"></td></tr>
			</table>
		</c:when>
		<c:otherwise> 
			<table id="qnaList"><tr><th>답글</th><td>${qnaVO.REPLYQNA}</td></tr></table>
		</c:otherwise>
	</c:choose>
	<input type="button" class="btn" value="목록" 	onClick="location.href='adminQnaList'">
	</form>
</article>



<%@ include file="../../include/admin/footer.jsp"%>