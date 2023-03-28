<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp"%>

<article>
	<div class="main-contents-list">
		<div class="container"><b class="search-key">${key}</b>으로 검색한 결과가 <b class="search-answer">${total}</b>건 있습니다.</div>
		<br>
		<div class="search-view">
			<c:forEach items="${recipeList}" var="recipeVO" varStatus="status">
				<div class="recipe-card">
					<c:choose>
						<c:when test="${loginUser.ID.equals(recipeVO.ID)}">
							
							<a href="recipeDetailWithoutView?rnum=${recipeVO.RNUM}" class="item">
					   			<img src="${recipeVO.THUMBNAIL}">
					   		</a>
						</c:when>
						<c:otherwise>
					   		<a href="recipeDetailView?rnum=${recipeVO.RNUM}" class="item">
					   			<img src="${recipeVO.THUMBNAIL}">
					   		</a>
					   	</c:otherwise>			
			   		</c:choose>			
			   		<h4>${recipeVO.SUBJECT}</h4>
			   		<span><img src="${recipeVO.IMG}" width=20 height=20>${recipeVO.NICK}
				   		<c:if test="${replyCountList[status.index]!=0}">
			   				<b>(${replyCountList[status.index]})</b>
			   			</c:if>
			   		</span>
			   		<h6>좋아요 ${recipeVO.LIKES} &nbsp;&nbsp;조회수 ${recipeVO.VIEWS}</h6>
			   		<h5>조리시간 : ${recipeVO.TIME}분</h5>
			   	</div>
			</c:forEach>
			<%-- <c:if test="${empty recipeList}">검색 결과가 없습니다</c:if> --%>
		</div>
	</div>
	<jsp:include page="../paging/paging.jsp">
		<jsp:param name="command" value="recipeList" />
	</jsp:include>
</article>



<%@ include file="../include/headerfooter/footer.jsp"%>