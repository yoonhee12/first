<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/admin/noticeHeader.jsp"%>

<article class="admin-board container">
<form name="frm" method="post" >
	<table class="admin-search-area" style="margin:0 auto">
		<tr><td>제목+내용 검색 
			<input type="text" name="key" value="${key}" > 
			    <input class="btn" type="button" value="검색"   onClick="go_search('notice');">
			    <input class="btn" type="button" name="btn_total" value="전체보기 "  onClick="go_total('notice');">		    
		    </td></tr>
		<tr>    		    
	</table>

<table id="adminRecipeList">
		<tr><th>중요도</th>
		<th>글번호</th><th>이미지</th><th>제목</th><th>작성자</th><th>작성날짜</th></tr>
	  	<c:forEach items="${noticeList}" var="noticeVO">		
	    	<tr>
	    	<td>
	    	<c:choose>
	      	<c:when test="${noticeVO.MUSTREAD=='Y'}">
	      	<span style="font-weight:bold; color:red;">(중요)</span>
	      	</c:when>
	      	<c:otherwise>
	      	<span style="font-weight:bold; color:blue;">(일반)</span>
	      	</c:otherwise>
	      	</c:choose>
	    	</td>
	    	<td>${noticeVO.ASEQ}</td>
	    	<td>	    	
	    	<img src="imageNotice/${noticeVO.AIMAGE}" style="width:100px;"/>	    	
	    	</td>
	      	<td><a href="#" onClick="go_view('noticeDetail','aseq','${noticeVO.ASEQ}')">${noticeVO.ASUBJECT}</a></td>
	      	<td>${noticeVO.AID}(관리자)</td>
	      	<td>
	      		 <fmt:parseDate value = "${noticeVO.ADATE}" var = "aDate" pattern = "yy/MM/dd" />
                 <fmt:formatDate type = "date" value="${aDate}"/>
	      	</td>
	    </c:forEach>
</table><br>
</form>
<div class="paging-area">
	<jsp:include page="../../paging/paging.jsp">
		<jsp:param name="command" value="notice" />
	</jsp:include>
</div>
</article>

<%@ include file="../../include/admin/footer.jsp"%>