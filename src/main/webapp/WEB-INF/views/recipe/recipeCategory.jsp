<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp"%>


<article class="" id="recipe-category-list">
    <div class="container">
        <div class="recipe_category_top_area">
        <c:if test="${status.equals('recipe')}"> 
            <h2><b>전체</b> 레시피 게시판 입니다~</h2>
        </c:if>
        <c:if test="${status.equals('type')}">
            <h2><b>종류별</b> 레시피 게시판 입니다~</h2>
            <div class="recipe_category_filter">
                <a href="javascript:void(0);" onclick="goRecipeCate(this, '${status}');"  name="1">밥/죽</a>
                <a href="javascript:void(0);" onclick="goRecipeCate(this, '${status}');"  name="2">국/탕/찌개</a>
                <a href="javascript:void(0);" onclick="goRecipeCate(this, '${status}');" name="3">반찬</a>
                <a href="javascript:void(0);" onclick="goRecipeCate(this, '${status}');" name="4">원플레이트</a>
                <a href="javascript:void(0);" onclick="goRecipeCate(this, '${status}');" name="5">음료</a>
                <a href="javascript:void(0);" onclick="goRecipeCate(this, '${status}');"name="6" >디저트</a>
            </div>
        </c:if>
        <c:if test="${status.equals('theme')}">
            <h2><b>테마별</b> 레시피 게시판 입니다~</h2>
            <div class="recipe_category_filter">
                <a href="javascript:void(0);" onclick="goRecipeCate(this, '${status}');" name="1">건강</a>
                <a href="javascript:void(0);" onclick="goRecipeCate(this, '${status}');" name="2">홈베이킹/홈파티/홈카페</a>
                <a href="javascript:void(0);" onclick="goRecipeCate(this, '${status}');" name="3">편의점 레시피</a>
                <a href="javascript:void(0);" onclick="goRecipeCate(this, '${status}');" name="4">5분 레시피</a>
            </div>
        </c:if>
        <c:if test="${status.equals('ing')}">
            <h2><b>재료별</b> 레시피 게시판 입니다~</h2>
            <div class="recipe_category_filter">
                <a href="javascript:void(0);" onclick="goRecipeCate(this, '${status}');" name="1">육류</a>
                <a href="javascript:void(0);" onclick="goRecipeCate(this, '${status}');" name="2">해산물</a>
                <a href="javascript:void(0);" onclick="goRecipeCate(this, '${status}');" name="3">과일/채소</a>
                <a href="javascript:void(0);" onclick="goRecipeCate(this, '${status}');" name="4">곡류</a>
            </div>
        </c:if>
        </div>
    </div>

<div class="categoryListTitle container">
총 <b>${total}</b>개의 레시피가 있습니다.

	<ul class="nav nav-tabs2 pull-right">
		<li><a href="" onclick="sortBy()">정확순</a></li>
		<li><a href="" onclick="sortBy()">최신순</a></li>
		<li><a href="" onclick="sortBy()">추천순</a></li>
	</ul> 
	
</div>
	<div class="main-contents-list">
		<c:forEach items="${RecipeCategory}" var="recipeVO" varStatus="status">
		   	<div class="recipe-card">
		   		<div class="item">
			   		<c:choose>
		      		<c:when test="${loginUser.ID == recipeVO.ID}">
		      			<a href="recipeDetailWithoutView?rnum=${recipeVO.RNUM}">
				            	<img src="/${recipeVO.THUMBNAIL}" width=300 height=200>
				         </a>
			         </c:when>
		      		<c:otherwise>
			      		<a href="recipeDetailView?rnum=${recipeVO.RNUM}">
			            		<img src="/${recipeVO.THUMBNAIL}" width=300 height=200>
			          	</a>
			          </c:otherwise>
	        	</c:choose>	
		   		</div>				
		   		<div><h4>${recipeVO.SUBJECT}</h4></div>
		   		<div class="recipe-card-nick-area"><img src="/${recipeVO.IMG}" width=20 height=20>${recipeVO.NICK} 
		   			<c:if test="${replyCountList[status.index]!=0}">
		   				<b>(${replyCountList[status.index]})</b>
		   			</c:if>
		   		</div>
		   		<div>
		   			<h5>
   					<img src="image/likeBtn1.png" class="recipe-card-likes"/> ${recipeVO.LIKES} &nbsp;&nbsp;	
		   			<img src="image/viewIcon.png" class="recipe-card-likes"/> ${recipeVO.VIEWS}</h5>
		   		</div>
		   		<div><h6>조리시간 : ${recipeVO.TIME}분</h6></div>
		   	</div>
		</c:forEach>
		
	</div>
	<%-- <jsp:include page="../paging/paging.jsp">
		<jsp:param name="command" value="recipeCategory?status=${status}" />
	</jsp:include> --%>
	<div id="paging" align="center" style="font-size:110%;">
	<c:url var="action" value="recipeCategory?kind=${kind}&status=${status}" />
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