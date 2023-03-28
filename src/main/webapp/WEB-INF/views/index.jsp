<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="include/headerfooter/header.jsp" %> 

<nav class="">
	<!-- status 라는 param을 통해서 값을 주고 받을 수 있게 jsp에서부터 세팅 -->
	<div class="container main-top-area">
		<div class="main-page-card col-md-4 col-sm-12" id="main-total">
			<div class="card-inner">
				<a class="" href="recipeCategory?status=recipe&page=1">
					<img src="/image/maintable.png" />
				</a>
				<div class="main-page-card-black-area"></div>
			</div>
		</div>
		<div class="main-page-card col-md-4 col-sm-12" id="main-type">
			<div class="card-inner">
				<a class="" href="recipeCategory?status=type&page=1">
					<img src="/image/typerecipe.png" />
				</a>
				<div class="main-page-card-black-area"></div>
			</div>
		</div>
		<div class="main-page-card col-md-4 col-sm-12" id="main-theme">
			<div class="card-inner">
				<a class="" href="recipeCategory?status=theme&page=1">
					<img src="/image/themerecipe.png" />
				</a>
				<div class="main-page-card-black-area"></div>
			</div>
		</div>
		<div class="main-page-card col-md-4 col-sm-12" id="main-ing">
			<div class="card-inner">
				<a class="" href="recipeCategory?status=ing&page=1">
					<img src="/image/ingredientsrecipe.png" />
				</a>
				<div class="main-page-card-black-area"></div>
			</div>
		</div>
		
		<div class="main-page-card col-md-4 col-sm-12" id="main-favorite">
			<div class="card-inner">
				<a class="" href="recipeFavoriteAndRec?kind=1&page=1">
					<img src="image/regularcustomerRecipe.png" />
				</a>
				<div class="main-page-card-black-area"></div>
			</div>
		</div>
		
		<div class="main-page-card  col-md-4 col-sm-12">
			<div class="card-inner">
				<!-- 여기 여섯번째 칸은 다른 탭을 넣으셔도 되고 삭제하셔도 됩니다. -->
				<a class="" href="#">사이트맵</a>
			</div>
		</div> 
		
	</div>
</nav>

	<div class="container">
		<div class="slider mt-5 mb-5" id="slider">
	      <div class="subtitle mb-3">
	        <h2>Recent Recipe</h2>
	      </div>
	      <!-- 캐러셀 컨테이너 -->
	      <div class="slide" id="slide0">
	        <c:forEach items="${allList}" var="recipeVO" end="20">
		      	<c:choose>
		      		<c:when test="${loginUser.ID == recipeVO.ID}">
		      			<div class="item">
				        	<a href="recipeDetailWithoutView?rnum=${recipeVO.RNUM}">
				            	<img src="/${recipeVO.THUMBNAIL}" width=300 height=200>
				            </a>
			            </div>
		        	</c:when>
		      		<c:otherwise>
			      		<div class="item">
			        		<a href="recipeDetailView?rnum=${recipeVO.RNUM}" class="item">
			            		<img src="/${recipeVO.THUMBNAIL}" width=300 height=200>
			          		</a>
			          	</div>
		        	</c:otherwise>
	        	</c:choose>
	        </c:forEach>
	      </div>
	      <button class="ctrl-btn pro-prev" id="prevBtn">Prev</button>
	      <button class="ctrl-btn pro-next" id="nextBtn">Next</button>
	    </div>
	</div>



<%@ include file="include/headerfooter/footer.jsp" %> 