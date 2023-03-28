<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>

<script type="text/javascript">
$(function(){
	$('#thumbButton').click( function(){
		
		let formselect = $("#thumbnailForm")[0];   // 지목된 폼을 변수에 저장
		let formdata = new FormData(formselect);   // 전송용 폼객에 다시 저장
		$.ajax({    // 웹페이지 이동 또는 새로고침이 필요없는 request요청
			url:"<%=request.getContextPath()%>/thumbnailUp", 
			type:"POST",
			enctype:"multipart/form-data",
			async: false,
			data: formdata,
	    	timeout: 10000,
	    	contentType : false,
	        processData : false,
	        success : function( data ){
	            if(data.STATUS == 1){  	//동적으로 div태그 달아주기.
	            	$("#thumbname").append("<div name='thumbnailName'>"+data.FILENAME+"</div>");
	            	$("#thumbnail").val(data.FILENAME);
	            	$("#thumbname").append("<img src='imageRecipe/"+data.FILENAME+"' height='150'/>");
	            	// 썸네일 삭제 버튼 추가 예정
	            }
	        },
	        error: function(request,status,error) {	
	        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);	
	        }
		});
	});
});

$(function(){
	$('#processImgButton').click( function(){
		
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
	            	$("#recipe-process").append(
	            			"<div class='process' name='process"+i +"'>"+
	            			"<img height='150' id='process"+i+"' src='imageRecipe/"+data.FILENAME+"' />"+
	            			"<input type='hidden' name='processImg"+i+"' value='"+data.FILENAME+"'>"+
	            			"<textarea name='processDetail"+i+"' rows='2' cols='50'></textarea>"+
	                        "<input id='update-button' class='btn' type='button' value='이미지 수정' name='"+i+"'/>"+
	     					"<input id='delete-button' class='btn' type='button' value='삭제' name='"+i+"'/>"+
	            			"</div>");
	            }
	        },
	        error: function(request,status,error) {	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);	}
		});
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
	            	$('input[name="processImg'+num+'"]').val(data.FILENAME);
	            	$(this).closest('div').remove();
	            	// alert("이미지 수정 후 삭제 완료");
	            }
	        },
	        error: function(request,status,error) {	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);	}
		});
	});

</script>

<article id="recipe-update">
	<h1>레시피&nbsp;&nbsp;작성&nbsp;/&nbsp;등록</h1>
	<c:if test="${not empty message}">
		테스트
		<script type="text/javascript">alert(${message});</script>
	</c:if>
	<!-- 썸네일 업로드 폼 -->
	<div class="recipe_process_edit_area">
		<div style="position:relative;  border:1px solid black; width:500px; margin:0 auto;">
			<form name="thumbnailForm" id="thumbnailForm" method="post"  enctype="multipart/form-data" >
				<input type="file" name="timg">
				<!-- <input type="file" name="thumbnail" required> -->
				<input type="button" id="thumbButton" value="썸네일 추가">
			</form>
		</div> 
		
	</div>
	<form name="frm" method="post">
		<%-- <input type="hidden" name="id" value="${loginUser.ID}"/> --%>
		<input type="hidden" name="nick" value="${loginUser.NICK}"/>
		<input type="hidden" name="count" id="count" value=""/>
		<table id="list">
			<tr>
				<th>제목</th><td width="343" colspan="5">
		       	<input type="text" name="subject" size="47" maxlength="100" placeholder="제목을 입력해주세요" value="${rvo.subject}" ></td>
		    </tr>
		    <tr>
				<th>작성자</th><td width="343" colspan="5">
		       	<input type="text" name="id" size="47" value="${loginUser.ID}" readonly></td>
		    </tr>
		    <tr>
		    	<th>썸네일 이미지</th>
			    <td width="343" colspan="5" style="vertical-align:top;">
			   		<input type="hidden" name="thumbnail" id="thumbnail" >
			   		<div id="thumbname"></div>
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
				<th>재료(대분류)</th>
				<td colspan="5">
					<select name="ing">
						<option value="0">선택</option>
						<option value="1">육류</option>
						<option value="2">해산물</option>
						<option value="3">과일/채소</option>
						<option value="4">곡류</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>재료 상세</th>
				<td>
					<label>재료의 이름과 양을 입력한 후 엔터를 누르세요. </label><br>
					<input type="text" name="ingredient" placeholder="재료 이름 입력" onPaste="return false"/>
					<input type="text" name="quantity" placeholder="양 입력(예: 300g)" onkeypress="passString()" onPaste="return false"/> 
					<br><input class="ingredients-area" type="text" name="checkIng" value="${rvo.checkIng}" readonly/><input type="button" onClick="clearIng()" value="초기화"/>
				</td>
				
			</tr> 
			<tr>
				<th>소요 시간</th>
				<td width="70"><input type="text" name="cookingTime" size="11" placeholder="예시) 30" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" onPaste="return false" value="${rvo.cookingTime}"> 분</td> 
			</tr>
			<tr>
				<th>상세설명</th><td colspan="5">
				<textarea name="content" rows="5" cols="40" placeholder="요리에 대한 간단한 소개나 짧은 이야기를 들려주세요 :)" value="${rvo.content}" >${rvo.content}</textarea></td>
			</tr>
		</table>
		
		<div class="flex">
			<div>요리과정</div>
			<div class="recipe-process" id="recipe-process">
				
			</div>
			
		</div>
		
		<div id="recipe-form-bottom-btn-area">
			<input class="btn" type="button" value="등록" onClick="go_recipe('writeRecipe')"  id="writeBtn" disabled="disabled" /> 
			<!-- <input class="btn" type="button" value="등록" id="writeBtn">   -->          
			<input class="btn" type="button" value="목록" onClick="history.go(-1)"> 
		</div>
	</form>
	
	<div class="pif_add" style="position:relative;  border:1px solid black; width:500px; margin:0 auto;">
		<form name="processImgForm" id="processImgForm" method="post"  enctype="multipart/form-data" >
			<input type="file" name="processImg">
			<input type="button" id="processImgButton" value="상세과정 추가">
		</form>
	</div>
	
</article>
	


<!-- 썸네일 폼, 이미지 업로드 폼 따로 만드는 경우 -->
<!-- <div style="position:relative;  border:1px solid black; width:500px; margin:0 auto;">
	<form name="thumnailForm" method="post"  enctype="multipart/form-data" >
		<input type="file" name="thumbnail" required>
	</form>
</div> 
<div style="position:relative;  border:1px solid black; width:500px; margin:0 auto;">
	<form name="processImgForm" method="post"  enctype="multipart/form-data" >
		<input type="file" name="processImg" required>
	</form>
</div>  -->
<!-- 한번에 통합 -->
<!-- <div style="position:relative;  border:1px solid black; width:500px; margin:0 auto;">
	<form name="uploadForm" method="post"  enctype="multipart/form-data" >
		<input type="file" name="image" required>
	</form>
</div> --> 

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