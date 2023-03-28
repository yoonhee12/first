<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/admin/noticeHeader.jsp"%>

<article class="admin-board container admin-qna-detail">
	<h1>공지사항</h1>   
	<form name="frm" method="post">
	<input type="hidden" name="qseq" value="${noticeVO.ASEQ}">
	<table> <!-- 게시물의 내용 -->
		<tr><th colspan='2' style="width:800px; text-align: center;"><img src="imageNotice/${noticeVO.AIMAGE}" style="height:250px; width:250px;"></th>
		<tr><th width="400px">제목</th><td align="left"width="400px"> ${noticeVO.ASUBJECT}</td></tr>
		<tr><th width="400px">등록일</th><td align="left"width="400px"> <fmt:parseDate value = "${noticeVO.ADATE}" var = "aDate" pattern = "yy/MM/dd" />
                 <fmt:formatDate type = "date" value="${aDate}"/></td></tr>
		<tr><th width="400px">내용</th><td  align="left"width="400px"> ${noticeVO.ACONTENT}</td></tr>
		<tr><th colspan='2' style="width:800px; text-align: center;"><input type="button"  value="목록" 	onClick="location.href='notice'"></th></tr>
	</table>
	<!-- 관리자가 쓴 답글 또는 답글 쓰는 입력란 표시 -->
	
	</form>
	
</article>



<%@ include file="../../include/admin/footer.jsp"%>