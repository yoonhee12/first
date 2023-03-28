<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%@ include file="../include/headerfooter/header.jsp" %>

<article>
   <div id="joinForm">
      <form method="post" name="joinForm"  action="join">
         <fieldset id="join">
         <legend>Basic Info</legend><br>
           <!--  <div><label>프로필사진</label><input type="file" name="img"><br></div> -->
            <div><label>아 이 디</label><input type="text" name="id" size="12" onkeyup="chkIdCode(event)" value="${dto.id}">
            <input type="hidden" name="reid" value="${reid}">
             <input type="button" value="중복 체크" class="dup" onclick="idcheck(event)"><br></div>
             <div><label>이     름</label><input type="text"  name="name" value="${dto.name}"><br> </div>
             <div><label>닉 네 임</label><input type="text" name="nick" size="12" value="${dto.nick}"><br></div>
             <div><label>비밀번호</label><input type="password" name="pwd" id="userpwd"><br> </div>
             <div><label>비밀번호 확인</label><input type="password" name="pwdCheck" id="userpwdchk"><br> </div>
               <p id="error1" style="color:red"> </p>
               <div><label>전화번호</label><input  type="text" name="phone" onkeyup="chkPhoneCode(event)" value="${dto.phone}"><br></div>
              <div><label>이메일</label><input type="text"  name="email" id="useremail" value="${dto.email}" placeholder="ex)abc@naver.com"  ><br> </div>
               <p id="error2" style="color:red"> </p>
             <div><label>우편번호</label><input type="text" name="zip_num" id="sample6_postcode"  size="10" value="${dto.zip_num}" readonly>     
             <input type="button" value="주소 찾기" class="dup" onclick="sample6_execDaumPostcode()"><br> </div>
            <div><label>주     소</label><input type="text" name="address1" id="sample6_address"   value="${dto.address1}"  size="50"><br></div>
            <div><label>상세주소</label><input type="text" name="address2" id="sample6_detailAddress" value="${dto.address2}"  size="25"> <br></div>
            <div><label>상세주소</label><input type="text" name="address3" id="sample6_extraAddress"  value="${dto.address3}" size="25"> <br></div>
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
               <div><label>프로필사진</label><input type="hidden" name="img" id="img"><div id="filename"></div></div>
  		<input type="hidden" name="useyn" value="Y">
			</fieldset>
        
         
         <div class="clear"></div>
         <div id="buttons">
             <input type="submit" value="회원가입" class="submit" > 
             <input type="reset" value="취소" class="cancel" >
         </div>
          <div >${message }</div>
      </form>
      <div style="position:relative;   margin:0 auto; top:-140px; width:500px; left:100px;">
	<form name="fromm" id="fileupForm" method="post" enctype="multipart/form-data">
				<input type="file" name="fileimage"><input type="button" id="myButton" value="추가">
	</form>
</div>
   </div>
</article>

<%@ include file="../include/headerfooter/footer.jsp" %>
