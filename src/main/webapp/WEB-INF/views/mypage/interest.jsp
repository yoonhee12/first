<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>
<%@ include file="../mypage/sub_menu_left.jsp"%>


<article id="interest-list-view">
   <form name="formm" method="post">
      <h2>관심 레시피</h2>

      <%--  <c:forEach items="${ylist}" var="interestRecipeVO" varStatus="status">
         ${interestRecipeVO.RNUM}
         ${replyCountList}
      </c:forEach> --%>

      <c:choose>
         <c:when test="${ylist.size()==0 }">
            <h3 style="color: red; text-align: center;">관심 레시피가 비어있습니다.</h3>
         </c:when>
         <c:otherwise>
            <table id="interestRecipeList" style="text-align: center;">
               <!-- 동일한 css 적용을 위한 id사용 -->
               <tr>
                  <th width="200"><input type='checkbox' name='selectall'
                     value='selectall' onclick='selectMyRecipeAll(this,name)' />전체선택/해제</th>
                  <th width="100">게시물 번호</th>
                  <th width="300">제 목</th>
                  <th width="200">작 성 일</th>
                  <th width="200">조 회</th>
               </tr>
               <c:forEach items="${ylist}" var="interestRecipeVO"
                  varStatus="status">
                  <tr>
                     <td><input type="checkbox" name="rnum" value="${interestRecipeVO.RNUM}">
                     <td width="100">${interestRecipeVO.RNUM}</td>
                     <td width="300"><c:choose>
                           <c:when  test="${interestRecipeVO.ID== interestRecipeVO.INTERESTID}">
                              <a  href="recipeDetailWithoutView?rnum=${interestRecipeVO.RNUM}">${interestRecipeVO.SUBJECT}
                                 <c:if test="${replyCountList[status.index] !=0}">
                                    <span style="color: #445EDD; font-size: bold;">[${replyCountList[status.index]}]</span>
                                 </c:if> <c:if test="${interestRecipeVO.FUSEYN=='Y'}">
                                    <span style="color: red; font-size: bold;">(단골)</span>
                                 </c:if>
                              </a>
                           </c:when>
                           <c:otherwise>
                              <a href="recipeDetailView?rnum=${interestRecipeVO.RNUM}">${interestRecipeVO.SUBJECT}
                                 <c:if test="${replyCountList[status.index] !=0}">
                                    <span style="color: #445EDD; font-size: bold;">[${replyCountList[status.index]}]</span>
                                 </c:if> <c:if test="${interestRecipeVO.FUSEYN=='Y'}">
                                    <span style="color: red; font-size: bold;">(단골)</span>
                                 </c:if>
                              </a>
                           </c:otherwise>
                        </c:choose></td>
                     <td width="200"><fmt:formatDate  value="${interestRecipeVO.INDATE}" type="date" /></td>
                     <td width="200">${interestRecipeVO.VIEWS}</td>
               </c:forEach>
               <tr>
                  <th colspan="4"><a href="#"  onClick="go_favoriteindel('changeFuseyn');">단골레시피 변환/해제</a></th>
            </table>
            <div id="myrecipe-list-paging">
               <jsp:include page="../paging/paging.jsp">
                  <jsp:param name="command" value="interestView" />
               </jsp:include>
            </div>

         </c:otherwise>
      </c:choose>
   </form>
</article>

<%@ include file="../include/headerfooter/footer.jsp" %>