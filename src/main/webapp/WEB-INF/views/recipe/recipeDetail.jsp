<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>


<!-- <script type="text/javascript">

/* function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};

$(document).ready(function(){
	let path = $("#recipeReplyAddForm").html( getContextPath() );
}); */

$(document).on("click", '#replyBtn', function(event) {
		
		
		/* let contextPath = sessionStorage.getItem("contextpath");
		alert(contextPath); */
		/* if( document.recipeReplyAddForm.userid.value==null ){
			alert("로그인 후 댓글 등록이 가능합니다.");
			return;
		}  */
		let formselect = $("#recipeReplyAddForm")[0];  
		let formdata = new FormData(formselect);   
		$.ajax({   
			// url: contextPath+"/addReply", 
			// url: path+"/addReply",
			url:  "${pageContext.request.contextPath}/addReply",
			type:"POST",
			// enctype:"multipart/form-data",
			async: false,
			data: formdata,
	    	timeout: 10000,
	    	// contentType : false,
	    	processData : false,
	        success :  function( data ){
	            if(data.STATUS == 1){  	
	            	// 댓글 표시 내용(기존 댓글 아래)
	            	let today = new Date();
					let dd = String(today.getDate()).padStart(2, '0');
					let mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
					let yyyy = today.getFullYear();
					today = yyyy + '-' + mm + '-' + dd;
	            	$('#reply_area').append(
	            		"<tr><td>"+${loginUser.ID}+"</td>"+
	            		"<td>"+data.CONTENT+"</td>"+
	            		"<td>"+today+"</td>"+
	            		"<input type='button' value='삭제' onclick='deleteThisReply("+data.REPLYSEQ+")' /></td>"+
	            		"</tr>");
	            }
	        },
	        error: function(request,status,error) {	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);	} 
	       
		}); 
	}); 
</script> -->

<article class="container pb-5 mb-5">
<div class="recipe-top-area">
	<h1>${recipeVO.SUBJECT}</h1>
	<div class="img_thumb_view">
		<img src="${recipeVO.THUMBNAIL}"/>
		<div>view : ${recipeVO.VIEWS}</div> 
	</div>
	<div class="writer-Info">
		<div class="writer-profile">
			<img src="${recipeVO.IMG}"/>
		</div>
		<h4><b>${recipeVO.NICK}님(${recipeVO.ID})</b></h4>
	</div>
	<div class="recipe-content">
		<div>${recipeVO.CONTENT}</div>
	</div>
</div>

<%-- <div class="">
	재료 : 
	<c:forEach items="${Ings}" var="ing">
		${ing} <br>
	</c:forEach>
</div> --%>
<div class="recipe-ingredients">
	재료 : 
	<c:forEach items="${ingArray}" var="ing" varStatus="status">
		${ing.TAG}&nbsp;${qtyArray[status.index].QUANTITY} <br>
	</c:forEach>
</div>


<div class="recipe-info container">
	<div id="cooking-time" class="grayscale">
		<h2>조리 시간</h2>
		<img src="image/cookingTimer.png" width="300px" height="200px"/>
		<h2>${recipeVO.TIME}분</h2>
	</div>
	 
	<%-- <br>
	${selectedRecipeInfo.type}
	<br>
	${selectedRecipeInfo.ing}
	<br>
	${selectedRecipeInfo.theme}
	<br> --%>
	<table class="recipe-process">
		<tr><td colspan="3"><h2>조리 순서</h2></td></tr>
	<c:forEach items="${processImgs}" var="pImgs">
		<tr><td class="col-1">
			<h1><b>${pImgs.ISEQ}</b></h1></td>
			<td  class="col-5"><div class="processImgs"><img src="${pImgs.LINKS}"/></div></td>
			<td  class="col-6"><div class="processimgs-description">${pImgs.DESCRIPTION}</div></td></tr>
	</c:forEach>
	</table>
	<div>
		<div id="like-btn">
			<c:choose>
				<c:when test="${likeyn=='N'}">
					<a href="#" onClick="ILikeThis(${recipeVO.RNUM});"><img src="image/likeBtn1.png"/></a>
					좋아요 (현재 좋아요 : ${recipeVO.LIKES})
				</c:when>
				<c:otherwise>
					<a href="#" onClick="ILikeThis(${recipeVO.RNUM});"><img src="image/likeBtn1.png"/></a>
					좋아요 취소 (현재 좋아요 : ${recipeVO.LIKES} )
				</c:otherwise>
			</c:choose>
		</div>
		<div id="like-btn">
			<c:choose>
				<c:when test="${reportyn=='N'}">
					<a href="#" onClick="IReportThis(${recipeVO.RNUM});"><img src="image/reportBtn.png"/></a>
					신고하기
				</c:when>
				<c:otherwise>
					<a href="#" onClick="IReportThis(${recipeVO.RNUM});"><img src="image/reportBtn.png"/></a>
					신고 취소
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>

</article>

<!-- 덧글 영역 -->
<div id="recipe-reply-area" class="container">
	<div class="recipe-reply-view" id="reply_area">
		<c:choose>
			<c:when test="${replyList.size()==0}">
				<h5>작성된 덧글이 없습니다.</h5>
			</c:when>
			<c:otherwise>
				<table >
					<c:forEach items="${replyList}" var="replyVO">
						<tr><td>${replyVO.ID}</td>
						<td>${replyVO.CONTENT}</td>
						<td><fmt:formatDate value="${replyVO.REPLYDATE}"/></td>
						<c:if test="${loginUser.ID.equals(replyVO.ID)}">
							<td><input type="button" value="삭제" onclick="deleteThisReply('${replyVO.REPLYSEQ}')"/></td>
						</c:if></tr>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="recipe-reply-input">
		<form method="post" name="recipeReplyAddForm" id="recipeReplyAddForm">
		${replyMessage} 
			<div>
				<div>
					<textarea name="reply" rows="3" cols="70"></textarea>
					<input type="hidden" name="rnum" value="${recipeVO.RNUM}"/>
					<!-- <input type="submit" value="저장" name="submit">onClick="recipeSaveReply()" -->
			   	</div>
			   	<div><a href="#" onClick="recipeSaveReply()" >댓글 저장</a></div>
			   	<!-- <div><input type="button" id="replyBtn" value="댓글 저장"></div> -->
		   	</div>
	   	</form>
	</div>
</div>

<br>
<div id="recipe-button-area" class="container">
	<c:if test="${recipeVO.ID.equals(loginUser.ID)}">
		<input type="button" name="modify" value="수정하기" 
			onclick="location.href='recipeUpdateForm?rnum=${recipeVO.RNUM}'"/>
		<input type="button" name="modify" value="삭제하기" 
			onclick="location.href='deleteRecipe?rnum=${recipeVO.RNUM}'"/>
	</c:if>
	<input type="button" name="modify" value="메인으로" 
			onclick="location.href='/'"/>
	<input type="button" name="modify" value="목록으로" 
			onclick="history.go(-1);"/>
	
</div>

<%@ include file="../include/headerfooter/footer.jsp" %>