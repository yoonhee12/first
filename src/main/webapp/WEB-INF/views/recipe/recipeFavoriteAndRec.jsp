<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp"%>

<article class="" id="recipe-category-list">
	<div class="recipe_category_filter">
			<a href="javascript:void(0);" onclick="goFavOrRec(this);"  name="1">관리자 추천 리스트</a>
			<a href="javascript:void(0);" onclick="goFavOrRec(this);"  name="2">단골 최상위 리스트</a>
	</div>
	<div class="main-contents-list">
		<div class="search-view">
		<c:forEach items="${recipeList}" var="recRecipeVO" varStatus="status">
		   	<div class="recipe-card">
		   		<div class="item">
			   		<c:choose>
		      		<c:when test="${loginUser.ID == recRecipeVO.ID}">
		      			<a href="recipeDetailWithoutView?rnum=${recRecipeVO.RNUM}">
				            	<img src="/${recRecipeVO.THUMBNAIL}" width=300 height=200>
				         </a>
			         </c:when>
		      		<c:otherwise>
			      		<a href="recipeDetailWithoutView?rnum=${recRecipeVO.RNUM}">
			            		<img src="/${recRecipeVO.THUMBNAIL}" width=300 height=200>
			          	</a>
			          </c:otherwise>
	        	</c:choose>	
		   		</div>				
		   		<div><h4>${recRecipeVO.SUBJECT}</h4></div>
		   		<div class="recipe-card-nick-area"><img src="/${recRecipeVO.IMG}" width=20 height=20>${recRecipeVO.NICK} 
		   			<c:if test="${replyCountList[status.index]!=0}">
		   				<b>(${replyCountList[status.index]})</b>
		   			</c:if>
		   		</div>
		   		<div>
		   			<h5>
   					<img src="image/likeBtn1.png" class="recipe-card-likes"/> ${recRecipeVO.LIKES} &nbsp;&nbsp;	
		   			<img src="image/viewIcon.png" class="recipe-card-likes"/> ${recRecipeVO.VIEWS}</h5>
		   		</div>
		   		<div><h6>조리시간 : ${recRecipeVO.TIME}분</h6></div>
		   	</div>
		</c:forEach>
		</div>
	</div>

	
	<%-- <jsp:include page="../paging/paging.jsp">
		<jsp:param name="command" value="recipeFavoriteAndRec" />
	</jsp:include> --%>
	<div id="paging" align="center" style="font-size:110%;">
	<c:url var="action" value="recipeFavoriteAndRec?kind=${kind}" />
	<c:if test="${paging.prev}">
		<a href="${action}&page=${paging.beginPage-1}">◀</a>&nbsp;
	</c:if>
	<c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
		<c:choose>
        	<c:when test="${paging.page==index}">
        		<span style="color:red;font-weight:bold">${index}&nbsp;</span>
        	</c:when>
	        <c:otherwise>
				<a href="${action}&page=${index}">${index}</a>&nbsp;
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${paging.next}">
			<a href="${action}&page=${paging.endPage+1}">▶</a>&nbsp;
	</c:if>	
</div>
</article>

<%@ include file="../include/headerfooter/footer.jsp"%>