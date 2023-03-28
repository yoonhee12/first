<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>
<%@ include file="../mypage/sub_menu_left.jsp"%>


<article id="myrecipe-list">
	<form name="formm" method="post">
		<h2>내가 만든레시피</h2>
		<c:choose>
			<c:when test="${rlist.size()==0 }">
				<h3 style="color: red; text-align: center;">내가 만든레시피가 비어있습니다</h3>
			</c:when>
			<c:otherwise>
				<table id="myRecipeList;" style="text-align: center;">
					<!--  -->
					<!-- 동일한 css 적용을 위한 id사용 -->
					<tr>
						<th width="200"><input type='checkbox' name='selectall'
							value="selectall" onclick="selectMyRecipeAll(this,name)" />전체선택/해제</th>
						<th width="100">게시물 번호</th>
						<th width="300">제 목</th>
						<th width="200">작 성 일</th>
						<th width="200">조 회</th>
					</tr>
					<c:forEach items="${myRecipeList}" var="myRecipeVO" varStatus="status">
						<tr>
							<td><input type="checkbox" name="rnum"
								value="${myRecipeVO.RNUM }"></td>
							<td>${myRecipeVO.RNUM}</td>
							  <td width="300"><a href="recipeDetailWithoutView?rnum=${myRecipeVO.RNUM}">
									${myRecipeVO.SUBJECT}
								<c:if test="${replyCountList[status.index] !=0}">
									<span style="color: #445EDD; font-size: bold;">[${replyCountList[status.index]}]</span>
								</c:if>
									</a></td>  
							<td width="200"><fmt:formatDate value="${myRecipeVO.INDATE}"
									type="date" /></td>
							<td width="200">${myRecipeVO.VIEWS}</td>
					</c:forEach>
					<tr>
						<th colspan="3"><a href="#" onClick="recipeForm'">작성하기</a></th>
						<th><a href="#"
							onClick="go_fmirecipe_delete('myRecipeDelete');">삭제하기</a></th>
					</tr>
				</table>
				<div id="myrecipe-list-paging">
					<jsp:include page="../paging/paging.jsp">
						<jsp:param name="command" value="myRecipeList" />
					</jsp:include>
				</div>
			</c:otherwise>
		</c:choose>
	</form>
</article>


<%@ include file="../include/headerfooter/footer.jsp" %>
