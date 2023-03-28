<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>

<script type="text/javascript">
$(function(){
	$('#thumbButton').click( function(){
		
		let formselect = $("#thumbnailForm")[0];   
		let formdata = new FormData(formselect);   
		$.ajax({    
			url:"<%=request.getContextPath()%>/thumbnailUp", 
			type:"POST",
			enctype:"multipart/form-data",
			async: false,
			data: formdata,
	    	timeout: 10000,
	    	contentType : false,
	        processData : false,
	        success : function( data ){
	            if(data.STATUS == 1){  	
	            	// 프리뷰 이미지 src 변경
	            	$('img[name="timgPreview"]').attr('src', 'imageRecipe/'+data.FILENAME);
	            	// input hidden의 value를 변경된 이미지로 변경
	            	// $('#updateTimg').append('<input type="hidden" name="thumbnail"'); 
	            	$('#thumbnail').val('imageRecipe/'+data.FILENAME);
	            }
	        },
	        error: function(request,status,error) {	
	        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);	
	        }
		});
	});
});

$(document).on("click", '#processImgButton', function(event) {
		
		let formselect = $("#processImgForm")[0];   
		let formdata = new FormData(formselect);   
		$.ajax({   
			url:"<%=request.getContextPath() %>/processImgUp",
			type:"POST",
			enctype:"multipart/form-data",
			async: false,
			data: formdata,
	    	timeout: 10000,
	    	contentType : false,
	        processData : false,
	        success : function( data ){
	            if(data.STATUS == 1){  	
	            	let name = $('.process').length;
					let i = name + 1;
					// alert("i : " + i);
	            	$(".recipe-process").append(
	            			"<div class='process' name='process"+i +"'>"+
	            			"<img height='150' id='process"+i+"' src='imageRecipe/"+data.FILENAME+"' />"+
	            			"<input type='hidden' name='processImg"+i+"' value='imageRecipe/"+data.FILENAME+"'>"+
	            			"<textarea name='processDetail"+i+"' rows='2' cols='50'></textarea>"+
	                        "<input id='update-button' class='btn' type='button' value='이미지 수정' name='"+i+"'/>"+
	     					"<input id='delete-button' class='btn' type='button' value='삭제' name='"+i+"'/>"+
	            			"</div>");
	            }
	        },
	        error: function(request,status,error) {	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);	}
		});
	});

$(document).on("click", '#editImgButton', function(event) {
	let formselect = $("#ImgEditForm")[0];  
	let formdata = new FormData(formselect);   
	$.ajax({    
		url:"<%=request.getContextPath() %>/editImg",
		type:"POST",
		enctype:"multipart/form-data",
		async: false,
		data: formdata,
    	timeout: 10000,
    	context:this,
    	contentType : false,
        processData : false,
        success : function( data ){
            if(data.STATUS == 1){
            	let num = $(this).attr('name');
            	// alert('전달된 editImgButton의 num : ' + num);
            	$('#process'+num).attr('src', 'imageRecipe/'+data.FILENAME);
            	$('input[name="processImg'+num+'"]').val('imageRecipe/'+data.FILENAME);
            	$(this).closest('div').remove();
            	// alert("이미지 수정 후 삭제 완료");
            }
        },
        error: function(request,status,error) {	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);	}
	});
});
</script>

<article id="recipe-update-form">
	<h1>레시피 수정</h1>
	<!-- 썸네일 수정 폼 
	<div style="position:absolute;  border:1px solid black; width:500px; margin:0 auto; left: 30%; top: 20%;">
		<form name="thumbnailForm" id="thumbnailForm" method="post"  enctype="multipart/form-data" >
			<input type="file" name="timg" >
			<input type="button" id="thumbButton" value="썸네일 변경">
		</form>
	</div> -->
	<div class="recipe_process_edit_area">
		<div style="position:relative;  border:1px solid black; width:500px; margin:0 auto;">
			<form name="thumbnailForm" id="thumbnailForm" method="post"  enctype="multipart/form-data" >
				<input type="file" name="timg">
				<input type="button" id="thumbButton" value="썸네일 변경">
			</form>
		</div> 
		${message}
	</div>
	
	<form name="frm" method="post">
		<input type="hidden" name="id" value="${loginUser.ID}"/>
		<%-- <input type="hidden" name="nick" value="${loginUser.NICK}"/> --%>
		<input type="hidden" name="count" id="count" value=""/>
		<input type="hidden" name="rnum" value="${recipeVO.RNUM}"/>
		
		<table id="list">
			<tr>
				<th>제목</th><td width="343" colspan="5">
		       	<input type="text" name="subject" size="47" maxlength="100" value="${recipeVO.SUBJECT}"></td>
		    </tr>
		    <tr class="flex" style="height: 20vh; vertical-align: top;">
				<th>작성자</th><td width="343" colspan="5">${loginUser.NICK}(${loginUser.ID})</td>
		    </tr>
		    <tr>
				<th>썸네일 이미지</th>
				<td width="343" colspan="5">
					<div id="updateTimg">
						<img name="timgPreview" src="${recipeVO.THUMBNAIL}" height="150"/>
						<input type="hidden" name="thumbnail" value="${recipeVO.THUMBNAIL}" id="thumbnail">
						<!-- <input id='timgEditbutton' class='btn' type='button' value='썸네일 수정' name=''/> -->
					</div>
				</td>
			</tr>  

			<tr>
				<th>종류</th>
				<td colspan="5">
					<select name="type">
						<option value="0">선택</option>
						<option value="1">밥/죽</option>
						<option value="2">국/탕/찌개</option>
						<option value="3">반찬</option>
						<option value="4">원플레이트</option>
						<option value="5">음료</option>
						<option value="6">디저트</option>
						<!-- <option value="7">직접 입력</option> -->
					</select>
				</td>
			</tr>
			
			<tr>
				<th>테마</th>
				<td colspan="5">
					<select name="theme">
						<option value="0">선택</option>
						<option value="1">건강</option>
						<option value="2">홈베이킹/홈파티/홈카페</option>
						<option value="3">편의점레시피</option>
						<option value="4">5분 레시피</option>
					</select>
				</td>
			</tr>
			<tr> 
				<th>재료</th>
				<td>
					<div id="ex">
					<label>기존 재료</label><br>
					<c:forEach items="${ingArray}" var="ing" varStatus="status">
						<span id="ex${status.index}" class="ex">#${ing.TAG} ${qtyArray[status.index].QUANTITY} </span><input type="button" value="x" onClick="deleteIng(${status.index}, this);" />
					</c:forEach>
					<%-- <c:forEach items="${exIng}" var="ing" varStatus="status">
						<span id="ex${status.index}" class="ex">${ing}</span> <input type="button" value="x" onClick="deleteIng(${status.index}, this);" />
					</c:forEach> --%>
					</div>
					<br><label>재료의 이름과 양을 입력한 후 엔터를 누르세요. </label><br>
					<input type="text" name="ingredient" placeholder="재료 이름 입력"  onPaste="return false" />
					<input type="text" name="quantity" placeholder="양 입력(예: 300g)" onkeypress="passString()"  onPaste="return false"/> 
					<!-- <input type="text" name="checkIng" placeholder="양 입력(예: 300g )" />위에서 입력한 내용 자동 전환 -->
					<br><input class="ingredients-area" type="text" name="checkIng" readonly/><input type="button" onClick="clearIng()" value="초기화"/>
				</td> 
			</tr> 
			<tr>
				<th>소요 시간</th><td width="70"><input type="text" name="cookingTime" size="11" value="${recipeVO.TIME}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" onPaste="return false">분</td>
				<%-- <th>소요 시간</th><td width="70"><input type="text" name="cookingTime" size="11" value="${recipeVO.time}" onkeydown="return onlyNumberKey(event)"></td> --%>
			</tr>
			<tr>
				<th>상세설명</th><td colspan="5">
				<textarea name="content" rows="5" cols="40" >${recipeVO.CONTENT}</textarea></td>
			</tr>
			<tr class="recipe-update-form-process" >
				<th>요리과정</th>
				<td colspan="5"><!-- 기존 사용자가 입력한 사진과 설명 -->
					<div class="recipe-process" class="recipe-update-form-process"   >
						<c:forEach items="${processImgs}" var="processImg" varStatus="status">
							<div class="process" class="recipe-update-form-process"  name="process${processImg.ISEQ}">
								<b>${status.count}번</b><br>
								<img src="${processImg.LINKS}" id="process${processImg.ISEQ}" height="150"/>
								<input type="hidden" name = "processImg${processImg.ISEQ}" value="${processImg.LINKS}"/>
								<textarea name="processDetail${processImg.ISEQ}" rows="4" cols="50">${processImg.DESCRIPTION}</textarea>
								<input id='update-button' class='btn' type='button' value='이미지 수정' name='${processImg.ISEQ}'/>
	     						<input id='delete-button' class='btn' type='button' value='삭제' name='${processImg.ISEQ}'/>
								<br>
							</div>
						</c:forEach>
					</div>
				</td>
			</tr> 
		</table>
		<div class="recipe-update-form-btn-area">
			<!-- <input type="submit" value="수정" onClick="noenter();"/> -->
			<input class="btn" type="button" value="수정" onClick="go_recipe('updateRecipe')" id="updateBtn" disabled="disabled">          
			<!-- <input class="btn" type="button" value="목록" onClick="go_recipe(list)"> --> 
			<!-- <input class="btn" type="button" value="목록" onClick="location.href='recipeCategory'"> -->
			<input class="btn" type="button" value="목록" onClick="history.go(-1);">
		</div> 
	</form> 
	
	<div style="position:relative;  border:1px solid black; width:500px; margin:0 auto;">
		<form name="processImgForm" id="processImgForm" method="post"  enctype="multipart/form-data" >
			<input type="file" name="processImg">
			<input type="button" id="processImgButton" value="상세과정 추가">
		</form>
	</div>
		
</article>

<script type="text/javascript">
document.frm.querySelector('input[name="ingredient"]').addEventListener('keydown', function(e) {
  	console.log(e.code);
  if (e.code === 'Space') {
    	e.preventDefault();
  	}
});
document.frm.querySelector('input[name="quantity"]').addEventListener('keydown', function(e) {
  	console.log(e.code);
  if (e.code === 'Space') {
    	e.preventDefault();
  	}
});
</script>

<%@ include file="../include/headerfooter/footer.jsp" %>