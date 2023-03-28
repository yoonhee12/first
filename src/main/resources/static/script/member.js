function go_next(){
   // 자바스크립트에서 jsp 페이지 내의 radio 버튼을 바라볼때, 같은 name의 okon 인것이 여러개라면 
   // name  값에 의한 배열로 자동 인식되어 사용됩니다.
   // 동의함 버튼 : okon[0],  동의안함  버튼 : okon[1]
   
   if( document.contractFrm.okon[1].checked == true ){
      // 동의 안함이 선택되었다면
      alert('회원 약관에 동의 하셔야 회원으로 가입이 가능합니다');
   }else{
      document.contractFrm.action = "joinForm";
      document.contractFrm.submit();
      // contractFrm 폼에  action 도 없고 submit 버튼도 없는 것을 스크립트 명령으로 action 값을 설정하고 
      // submit() 메서드로 이동까지 실행합니다
   }
}

function idcheck(event){
   if( document.joinForm.id.value=="" ){
      alert("아이디를 입력하고 중복체크를 진행하세요" );
      documnet.joinForm.id.focus();
      return;
   }
   var url = "idCheckForm?id=" + document.joinForm.id.value;
   var opt = "toolbar=no, menubar=no, resizable=no, width=500, height=250, scrollbars=no";
   window.open(url, "IdCheck", opt);   
}

function idok( userid ){
	opener.document.joinForm.id.value = userid;
	opener.document.joinForm.reid.value = userid;
	self.close();
}



function autoHypenPhone(str){
            str = str.replace(/[^0-9]/g, '');
            var tmp = '';
            if( str.length < 4){
                return str;
            }else if(str.length < 7){
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3);
                return tmp;
            }else if(str.length < 11){
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3, 3);
                tmp += '-';
                tmp += str.substr(6);
                return tmp;
            }else{              
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3, 4);
                tmp += '-';
                tmp += str.substr(7);
                return tmp;
            }
            return str;
        }

function chkIdCode(event) {
    const regExp = /[^0-9a-zA-Z]/g;
    if (regExp.test(event.target.value)) {
        event.target.value = event.target.value.replace(regExp, '');
    }
}

function chkPhoneCode(event){
    const regExp1 = /[^0-9a-zA-Z]/g;
    if (regExp1.test(event.target.value)) {
        event.target.value = event.target.value.replace(regExp1, '');
    }

    const regExp2 = /[0-9]/g;
    if (regExp2.test(event.target.value)) {
        var _val =  event.target.value.trim();
        event.target.value = autoHypenPhone(_val);
    }

    const regExp3 = /^[a-zA-Z]*$/;
    if (regExp3.test(event.target.value)) {
        event.target.value = event.target.value.replace(regExp3, '');
    }
}
     
        
$(function() {
	$("#userpwdchk").keyup(function(event) {
		event.target.value = event.target.value.trim();
		let pass1 = $("#userpwd").val();
		let pass2 = $("#userpwdchk").val();
		if (pass1 != "" || pass2 != "") {
			if (pass1 == pass2) {
				$("#error1").html('');
			} else {
				$("#error1").html('비밀번호가 일치하지 않습니다.');
				$("#error1").css('color', 'red');
			}
		}
	})

	$("#userpwd").keyup(function(event) {
		event.target.value = event.target.value.trim();
		let pass1 = $("#userpwd").val();
		let pass2 = $("#userpwdchk").val();
		if (pass1 != '' && pass2 != '') {
			if (pass1 == pass2) {
				$("#error1").html('');
			} else {
				$("#error1").html('비밀번호가 일치하지 않습니다.');
				$("#error1").css('color', 'red');
			}
		}
	})

	$("#useremail").keyup(function(event) {
		const regExp = /[ㄱ-ㅎㅏ-ㅣ가-힣]/g;
		event.target.value = event.target.value.trim();
		if (regExp.test(event.target.value)) {
			event.target.value = event.target.value.replace(regExp, '');
		}
		let email = $("#useremail").val();
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		if (!reg_email.test(email)) {
			$("#error2").html('이메일 형식이 잘못되었습니다.');
			$("#error2").css('color', 'red');
		} else {
			$("#error2").html('');
		}
	})
})

function loginCheck(){
	if(document.loginFrm.id.value==""){
		alert("아이디는 필수입력사항입니다.");
		document.loginFrm.id.focus();
		return false;
	}else if(document.loginFrm.pwd.value==""){
		alert("비밀번호는 필수입력사항입니다.");
		document.loginFrm.pwd.focus();
		return false;
	}else{
		return true;
	}
}


function go_update(){
   if(document.joinForm.name.value == "") {
       alert("이름을 입력해 주세요.");       
       document.joinForm.name.focus();
   }else if(document.joinForm.nick.value == "") {
       alert("닉네임을 입력해 주세요.");      
       document.joinForm.nickname.focus();
   }else if(document.joinForm.pwd.value == "") {
       alert("비밀번호를 입력해 주세요.");       
       document.joinForm.pwd.focus();
   }else if(document.joinForm.pwd.value != document.joinForm.pwdCheck.value) {
       alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");       
       document.joinForm.pwd.focus(); 
   }else if(document.joinForm.phone.value == "") {
       alert("전화번호을 입력해 주세요.");      
       document.joinForm.phone.focus();
   }else if(document.joinForm.email.value == "") {
       alert("이메일을 입력해 주세요.");      
       document.joinForm.email.focus();
   }else if(document.joinForm.zip_num.value == "") {
       alert("우편번호를 입력해 주세요(주소찾기 눌러주세요)).");      
       document.joinForm.zip_num.focus();
   }else {
       document.joinForm.action = "memberUpdate";
       document.joinForm.submit();
   }
}



function go_update_mypage( oldImg ){
	alert('go_update_mypage!!!!!!');
   if(document.joinForm.name.value == "") {
       alert("이름을 입력해 주세요.");       
       document.joinForm.name.focus();
   }else if(document.joinForm.nick.value == "") {
       alert("닉네임을 입력해 주세요.");      
       document.joinForm.nickname.focus();
   }else if(document.joinForm.pwd.value == "") {
       alert("비밀번호를 입력해 주세요.");       
       document.joinForm.pwd.focus();
   }else if(document.joinForm.pwd.value != document.joinForm.pwdCheck.value) {
       alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");       
       document.joinForm.pwd.focus(); 
   }else if(document.joinForm.phone.value == "") {
       alert("전화번호을 입력해 주세요.");      
       document.joinForm.phone.focus();
   }else if(document.joinForm.email.value == "") {
       alert("이메일을 입력해 주세요.");      
       document.joinForm.email.focus();
   }else if(document.joinForm.zip_num.value == "") {
       alert("우편번호를 입력해 주세요(주소찾기 눌러주세요)).");      
       document.joinForm.zip_num.focus();
   }else {
       document.joinForm.action = "memberUpdate?oldImg="+oldImg;
       document.joinForm.submit();
   }
}
// mypage ----------------------------------------------------------------------------------------------------

// 마이레시피 체크박스 변환
function selectMyRecipeAll(selectAll)  {
  const checkboxes 
       = document.getElementsByName('rnum');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  })
}


// 마이페이지에서 레시피 삭제하는 메서드
function go_fmirecipe_delete(comm){
   let count=0;
   if(document.formm.rnum.length==undefined){
      if(document.formm.rnum.checked==true){
         count++;
      }
   }else{
      for(let i=0; i<document.formm.rnum.length; i++){
         if(document.formm.rnum[i].checked==true){
            count++;
         }
      }
   }
   if(count==0){
      alert("삭제할 항목을 선택하세요");
   }else {
      document.formm.action=comm;
      document.formm.submit();
   }
}

// 삭제시 비밀번호 체크란
function withDrawal(id,pwd){
	 let pwdcheck = prompt('비밀번호를 입력해주세요' , 'ex)1234');

	if(pwd.valueOf()==pwdcheck.valueOf()){
		 document.formm.action="withDrawal?id="+id;
      document.formm.submit();
	}else{
		alert("비밀번호가 맞지 않습니다")
		return;
	}


}


function go_favoriteindel(comm){
   /*let rnums = document.getElementsByName("rnums");
   console.log(rnums);*/
   
   let count=0;
   if(document.formm.rnum.length==undefined){
      if(document.formm.rnum.checked==true){
         count++;
      }
   }else{
      for(let i=0; i<document.formm.rnum.length; i++){
         if(document.formm.rnum[i].checked==true){
            count++;
         }
      }
   }
   if(count==0){
      alert("변환할 레시피를 선택하세요");
   }else {
      document.formm.action=comm;
      document.formm.submit();
   }
   
}


