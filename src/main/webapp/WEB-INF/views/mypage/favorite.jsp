<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>
<%@ include file="../mypage/sub_menu_left.jsp"%>


<article id="favorite-list-view">
	<form name="formm" method="post">
		<h2>단골 레시피</h2>
		<c:choose>
			<c:when test="${fflist.size()==0 }">
				<h3 style="color: red; text-align: center;">단골레시피가 비었습니다</h3>
			</c:when>
			<c:otherwise>
				<table id="favoriteRecipeList" style="text-align: center;">
					<!-- 동일한 css 적용을 위한 id사용 -->
					<tr>
						<th width="100">게시물 번호</th>
						<th width="300">제 목</th>
						<th width="200">작 성 일</th>
						<th width="200">조 회</th>
					</tr>
					<c:forEach items="${fflist}" var="favoriteRecipeVO" varStatus="status">
						<tr>
							<td width="100">${favoriteRecipeVO.RNUM}</td>
							<td width="300">
							<c:choose>
									<c:when test="${favoriteRecipeVO.ID == favoriteRecipeVO.FAVORITEID}">
										<a  href="recipeDetailWithoutView?rnum=${favoriteRecipeVO.RNUM}">${favoriteRecipeVO.SUBJECT}
											<c:if test="${replyCountList[status.index] !=0}">
												<span style="color: #445EDD; font-size: bold;">[${replyCountList[status.index]}]</span>
											</c:if>
										</a>
									</c:when>
									<c:otherwise>
										<a
											href="recipeDetailView?rnum=${favoriteRecipeVO.RNUM}">${favoriteRecipeVO.SUBJECT}
											<c:if test="${replyCountList[status.index] !=0}">
												<span style="color: #445EDD; font-size: bold;">[${replyCountList[status.index]}]</span>
											</c:if>
										</a>
									</c:otherwise>
								</c:choose></td>
							<td width="200"><fmt:formatDate value="${favoriteRecipeVO.INDATE}" type="date" /></td>
							<td width="200">${favoriteRecipeVO.VIEWS}</td>
					</c:forEach>
				</table>
				<div id="myrecipe-list-paging">
					<jsp:include page="../paging/paging.jsp">
						<jsp:param name="command" value="favoriteView" />
					</jsp:include>
				</div>
			</c:otherwise>
		</c:choose>
	</form>
</article>

<%@ include file="../include/headerfooter/footer.jsp" %>