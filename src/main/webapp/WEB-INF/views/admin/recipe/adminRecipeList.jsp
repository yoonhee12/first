<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/admin/admin_header.jsp"%>

<article class="admin-board container">
<h1>레시피 리스트</h1>
<jsp:include page="adminRecipeNav.jsp"/>

<form name="frm" method="post">
	<table class="admin-search-area">
		<tr><td>제목+내용 검색 
			<input type="text" name="key" value="${key}" > 
			    <input class="btn" type="button" value="검색"   onClick="go_search('adminRecipeList');">
			    <input class="btn" type="button" name="btn_total" value="전체보기 "  onClick="go_total('adminRecipeList');">		    
		    </td></tr>
		<tr>    		    
	</table>

<table id="adminRecipeList">
		<tr><th><input type='checkbox' value='selectall' onclick="selectAll(this,'rnum')"/>전체선택/해제</th>
		<th>글번호</th><th colspan="2">레시피</th><th>작성자</th><th>작성날짜</th><th>좋아요</th><th>신고횟수(50회)</th><th>조회수</th><th>추천하기</th></tr>
	  	<c:forEach items="${recipeList}" var="recipeVO">	  		
	    	<tr>
	    	<td><input type="checkbox" name="rnum" value="${recipeVO.RNUM}">
	    	<c:choose>
	      	<c:when test="${recipeVO.REC==1}">
	      	<span style="font-weight:bold; color:red;">(추천)</span>
	      	</c:when>
	      	<c:otherwise>
	      	<span style="font-weight:bold; color:blue;">(일반)</span>
	      	</c:otherwise>
	      	</c:choose>
	    	</td>
	    	<td>${recipeVO.RNUM}</td>
	    	<td>	    	
	    	<img src="${recipeVO.THUMBNAIL}" style="width:100px;"/>	    	
	    	</td>
	      	<td><a href="#" onClick="go_view('recipeDetailView','rnum','${recipeVO.RNUM}')">${recipeVO.SUBJECT}</a></td>
	      	<td>${recipeVO.ID}</td>
	      	<td> <fmt:formatDate value="${recipeVO.INDATE}"/></td>
	      	<td>${recipeVO.LIKES}</td>     	
	      	<c:choose>
	      		<c:when test="${recipeVO.REPORT>=50}">
	      			<td style="color:red; font-weight: bold;">${recipeVO.REPORT}</td>
	      		</c:when>
	      		<c:otherwise>
	      			<td>${recipeVO.REPORT}</td>
	      		</c:otherwise>
	      	</c:choose>	
	      	<td>${recipeVO.VIEWS}</td>
	      	<td><input type="button" value="추천하기" onclick="go_recommendlist('${recipeVO.RNUM}','rs')"></td></tr>
	    </c:forEach>
	    		<tr>
	    		<th><a href="#" onClick="go_adminRecipe_delete()">게시글 삭제하기</a></th></tr>
	    		<tr>
	    		<th><a href="#" onClick="go_recommendlist(0,'rs');">추천하기</a></th></tr>
</table><br>
</form>
<div class="paging-area">
	<jsp:include page="../../paging/paging.jsp">
		<jsp:param name="command" value="adminRecipeList" />
	</jsp:include>
</div>
</article>
	
<%@ include file="../../include/admin/footer.jsp"%>