<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>


<article>
        <h2>Edit Profile</h2>
        <form method="post" name="joinForm"  enctype="multipart/form-data">
         <input type="hidden" name="oldImg" value="${loginUser.IMG}">
            <!-- <input type="hidden" name="command" value="memberUpdate" /> -->
            <fieldset>
                <legend>Basic Info</legend>
                <label>이     름</label><input type="text" name="name"  value="${loginUser.NAME}"><br> 
                <label>아 이 디</label><input type="text" name="id" value="${loginUser.ID}" readonly><br>
                <label>닉 네 임</label><input type="text" name="nick" value="${loginUser.NICK }"><br>
                <label>비밀번호</label><input type="password"  name="pwd" id="userpwd"><br> 
                <label>비밀번호 확인</label><input type="password"  name="pwdCheck" id="userpwdchk" ><br>
                <p id="error1" style="color:red"> </p>
                <label>전화번호</label><input  type="text" name="phone"  value="${loginUser.PHONE}" onkeyup="chkPhoneCode(event)"><br>
                <label>이메일</label><input type="text" name="email" value="${loginUser.EMAIL}" id="useremail"><br>
                <label>우편번호</label><input type="text" name="zip_num" id="sample6_postcode" size="10" value="${loginUser.ZIP_NUM}">      
                    <input type="button" value="주소 찾기" class="dup" onclick="sample6_execDaumPostcode()"><br>
                <label>주    소</label><input type="text" name="address1" id="sample6_address" size="50" value="${loginUser.ADDRESS1}" ><br>
                <label>상세주소</label><input type="text" name="address2" id="sample6_detailAddress"  size="25" value="${loginUser.ADDRESS2}"><br>
                <label>상세주소</label><input type="text" name="address3" id="sample6_extraAddress" size="25" value="${loginUser.ADDRESS3}"><br>
                <input type="hidden" name="indate" value="${loginUser.INDATE }">
                <input type="hidden" name="useyn" value="${loginUser.USEYN }">
                 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            <script>
		    function sample6_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수
		
		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
		
		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                    document.getElementById("sample6_extraAddress").value = extraAddr;
		                
		                } else {
		                    document.getElementById("sample6_extraAddress").value = '';
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('sample6_postcode').value = data.zonecode;
		                document.getElementById("sample6_address").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("sample6_detailAddress").focus();
		            }
		        }).open();
		    }
		</script><br>
<%--                 <div><label>프로필사진</label><input type="hidden" name="img" id="img" value="${loginUser.IMG }"><div id="filename"></div></div>
 --%>          <label>프로필사진</label><img src="${loginUser.IMG}" width="200pt"><br>
      <input type="file" name="img"> * 주의 : 이미지를 수정할때에만 선택해주세요
                
               
            </fieldset>
            <div id="buttons"><input type="button" value="정보수정" class="submit" onclick="go_update_mypage('${loginUser.IMG}')"> 
                <input type="reset" value="취소" class="cancel" onclick="myPageView'"></div>
        </form>

	<!-- <div
		style="position: relative; margin: 0 auto; top: -140px; width: 500px; left: 100px;">
		<form name="fromm" id="fileupForm" method="post"
			enctype="multipart/form-data">
			<input type="file" name="fileimage"><input type="button"
				id="myButton" value="추가">
		</form>
	</div> -->
</article>
        
 <%@ include file="../include/headerfooter/footer.jsp" %>