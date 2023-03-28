<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/admin/admin_header.jsp"%>

<article class="admin-board container admin-rep-list">
	<h1>댓글리스트</h1>  
	<form name="frm" method="post">
	<table  class="admin-search-area">
		<tr><td>댓글작성자 ID <input type="text" name="key" value="${key}">
		<input class="btn" type="button" value="검색" onclick="go_search('adminReplyList')">
		<input class="btn" type="button" name="btn_total" value="전체보기 "	onClick="go_total('adminReplyList')"></td> </tr>
	</table><br>
	<table id="replyList">
		<tr><th>번호</th><th>아이디</th><th>레시피 번호</th><th>내용</th><th>작성일자</th></tr>
	    <c:forEach items="${replyList}" var="replyVO">  
		    <tr>
		    <td><input type="checkbox" name="replyseq" value="${replyVO.REPLYSEQ}">&nbsp;&nbsp;&nbsp;${replyVO.REPLYSEQ}</td>
		    <td>${replyVO.ID}</td><td>${replyVO.RNUM}</td><td><a href="#" onClick="go_view('recipeDetailView','rnum','${replyVO.RNUM}')">${replyVO.CONTENT}</a></td>
		    <td><fmt:formatDate value="${replyVO.REPLYDATE}"/></td></tr>
	  </c:forEach>
	  <tr>
	  <th><a href="#" onClick="go_reply_delete();">댓글 삭제하기</a></th>
	  <tr>
	</table>
	<div class="paging-area">
		<jsp:include page="../../paging/paging.jsp">   
		    <jsp:param value="adminReplyList" name="command"/>
		</jsp:include>
	</div>
	</form>
</article>

<%@ include file="../../include/admin/footer.jsp"%>