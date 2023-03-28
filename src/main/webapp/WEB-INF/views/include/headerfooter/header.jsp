<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>The Recipe</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">
	<link  rel="stylesheet" href="/css/style.css">  
	<!--#폰트어썸 임포트  -->
	<script src="https://kit.fontawesome.com/74c64a7de1.js" crossorigin="anonymous"></script>
	<!--#제이쿼리 임포트  -->
	<script src="script/jquery-3.6.3.js" type="text/javascript"></script>
	<!--#메인.js 임포트  -->
	<script type="text/javascript" src="/script/main.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
	<script type="text/javascript">
	    $(function(){
	    	var num=0;
	    	setInterval(function(){
	            $('#imgs').animate({ left : num * -972 },1000);
	                num++;
	                if(num==5)num=0;
	        }, 2000);
	    });
	</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<script type="text/javascript">

	$(function(){
		$('#myButton').click( function(){
		
			var formselect = $("#fileupForm")[0];   // 지목된 폼을 변수에 저장
			var formdata = new FormData(formselect);   // 전송용 폼객에 다시 저장
			$.ajax({    // 웹페이지 이동 또는 새로고침이 필요없는 request요청
			
				// 밑에 부분 해당 컨트롤러의 requestMapping 목적지 설정
				url:"<%=request.getContextPath()%>/fileup",
				type : "POST",
				enctype : "multipart/form-data",
				async : false,
				data : formdata,
				timeout : 10000,
				contentType : false,
				processData : false,
				// 성공했을때
				success : function(data) {
							if (data.STATUS == 1) { //동적으로 div태그 달아주기.
								$("#filename").append("<div>" + data.FILENAME+ "</div>");
								$("#img").val(data.FILENAME);
								$("#filename").append("<img src='imageProfile/"+data.FILENAME+"' height='150'/>");
								}
									},
									// 실패했을때
									error : function() {
										alert("실패");
									}
								});
					});
	});
</script>

</head>

<body>
	<div id="wrap">
		<header>
			 <!-- container 속성은 부트스트랩의 내장 클래스이고, 좌우에 여백이 있는 큰 문서의 뼈대(가장 바깥쪽)에 무난하게 넣을 수 있는 클래스 입니다. -->
			<div class="container">
				<div class="boxFlexTop">
					<div class="col-md-1 col-sm-12 header-title">
						<a class="navbar-brand" href="/">
							<!-- 우리의 식탁 -->
							<img src="/image/todaytabletitle.jpg">
						</a>
					</div>
					<div class="col-md-6 col-sm-12 header-mid-area">
						<select name="condition" id="condition">
							<option value="title" <c:if test="${condition=='title'}">${'selected'}</c:if>>제목</option>
							<option value="con" <c:if test="${condition=='con'}">${'selected'}</c:if>>내용</option>
							<option value="ing" <c:if test="${condition=='ing'}">${'selected'}</c:if>>재료</option>
						</select>
						<input class="col-9 nav-search" type="search" placeholder="원하는 재료나 음식 이름을 입력해주세요."
							aria-label="Search" name="key" id="key">
						<!-- 부트스트랩에서 가져온 속성을 조합하거나 삭제하면서 효과를 조정할 수 있습니다. 같은 이름의 클래스로 CSS에서 작업하면 부트스트랩의 내용을 덮어씁니다. -->
						<button class="btn btn-dark" type="button" id="searchByKey" >검색</button>
					</div>

					<c:if test="${loginUser.ID==null && loginAdmin.ADMINID==null}">
						<div id="loginOrJoin" class="col-md-5 col-sm-12">
							<input type="button" value="로그인" class="header-btn"
							onClick="location.href='loginForm'" />
							<input type="button" value="회원가입" class="header-btn"
							onClick="location.href='contract'" />
						</div>
					</c:if>
					<c:if test="${loginUser.ID!=null}">
						<div id="loginOrJoin" class="col-5">
							<b>${loginUser.NAME}(${loginUser.ID})님<br>안녕하세요!</b>
							<input type="button" value="마이페이지" class="header-btn" 
								onClick="location.href='myPageView'"/>
							<input type="button" value="로그아웃" class="header-btn"
								onClick="location.href='logout'" />
							<div class="top_Icon"><a href="recipeForm"><img class="top_Icon"
										src="/image/pensil1.png"></a></div>
						</div>
					</c:if>
					<c:if test="${loginAdmin.ADMINID!=null}">
						<div id="loginOrJoin" class="col-5">
							<b>${loginAdmin.ADMINID}님<br>안녕하세요!</b>
							<input type="button" value="관리자페이지" class="header-btn"
								onClick="location.href='admin'" />
							<input type="button" value="로그아웃" class="header-btn"
								onClick="location.href='logout'" />
							<div class="top_Icon"><a href="recipeForm"><img class="top_Icon"
										src="/image/pensil1.png"></a></div>
						</div>
					</c:if>
				</div>
			</div>

			
		</header>
		<main class="">