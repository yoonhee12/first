let slider0 = 0;
let slider1 = 0;
let slider2 = 0;
let slider3 = 0;

$(function(){
	$('#prevBtn').on('click', function() {
		if(slider0==0) return;
		slider0--;
		let temp = slider0 * -30;
		$('#slide0').css('transform', 'translateX('+ temp +'vw)');
	});
});

$(function(){
	$('#nextBtn').on('click', function() {
		if(slider0==4) return;
		slider0++;
		let temp = slider0 * -30;
		$('#slide0').css('transform', 'translateX('+ temp +'vw)');
	});
});

$(function(){
	$('#prevBtn1').on('click', function() {
		if(slider1==0) return;
		slider1--;
		let temp = slider1 * -30;
		$('#slide1').css('transform', 'translateX('+ temp +'vw)');
	});
});

$(function(){
	$('#nextBtn1').on('click', function() {
		if(slider1==4) return;
		slider1++;
		let temp = slider1 * -30;
		$('#slide1').css('transform', 'translateX('+ temp +'vw)');
	});
});

$(function(){
	$('#prevBtn2').on('click', function() {
		if(slider2==0) return;
		slider2--;
		let temp = slider2 * -30;
		$('#slide2').css('transform', 'translateX('+ temp +'vw)');
	});
});

$(function(){
	$('#nextBtn2').on('click', function() {
		if(slider2==4) return;
		slider2++;
		let temp = slider2 * -30;
		$('#slide2').css('transform', 'translateX('+ temp +'vw)');
	});
});

$(function(){
	$('#prevBtn3').on('click', function() {
		if(slider3==0) return;
		slider3--;
		let temp = slider3 * -30;
		$('#slide3').css('transform', 'translateX('+ temp +'vw)');
	});
});

$(function(){
	$('#nextBtn3').on('click', function() {
		if(slider3==4) return;
		slider3++;
		let temp = slider3 * -30;
		$('#slide3').css('transform', 'translateX('+ temp +'vw)');
	});
});



function go_admin(){
   document.frm.action = "recipe.do?command=admin";
   document.frm.submit();
}

//----가입

function idok( userid ){
	opener.document.joinForm.id.value = userid;
	opener.document.joinForm.reid.value = userid;
	self.close();
}



function post_zip(){
   var url = "recipe.do?command=findZipNum";
   var opt = "toolbar=no, menubar=no, scrollbars=no, resizable=no, width=550, height=300, top=300, left=300";
   window.open( url, "우편번호 찾기", opt);
}




function result( zip_num, sido, gugun, dong){
   //  함수 호출 형태 - result( '123-123', '서울시', '서대문구',  '대현동')
   opener.document.joinForm.zip_num.value=zip_num;
   opener.document.joinForm.address1.value=sido+" "+gugun+" "+dong;
   self.close();
}



function go_save(){
   if (document.joinForm.id.value == "") {
      alert("아이디를 입력하여 주세요.");        
       document.joinForm.id.focus();
   }else if(document.joinForm.reid.value != document.joinForm.id.value){
      alert("아이디 중복확인을 하지 않았습니다");      
      document.joinForm.id.focus();
   }else if(document.joinForm.name.value == "") {
       alert("이름을 입력해 주세요.");       
       document.joinForm.name.focus();
   }else if(document.joinForm.nickname.value == "") {
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
   }else if(document.joinForm.address1.value == "") {
       alert("주소를 입력해 주세요.");      
       document.joinForm.address1.focus();
   }else{
      document.joinForm.action = "recipe.do?command=join";
       document.joinForm.submit();
   }
}




function go_update(){
   if(document.joinForm.name.value == "") {
       alert("이름을 입력해 주세요.");       
       document.joinForm.name.focus();
   }else if(document.joinForm.nickname.value == "") {
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
   }else if(document.joinForm.address1.value == "") {
       alert("주소를 입력해 주세요.");      
       document.joinForm.address1.focus();
   }else {
       document.joinForm.action = "recipe.do?command=updateMember";
       document.joinForm.submit();
   }
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
     
        
        $( function(){
            $("#userpwdchk").keyup( function(event){
                event.target.value = event.target.value.trim();
                let pass1 = $("#userpwd").val();
                let pass2 = $("#userpwdchk").val();
                if (pass1 != "" || pass2 != ""){
                    if (pass1 == pass2){
                        $("#error1").html('');
                    } else {
                        $("#error1").html('비밀번호가 일치하지 않습니다.');
                        $("#error1").css('color','red');
                    }
                }
            })

            $("#userpwd").keyup( function(event){
                event.target.value = event.target.value.trim();
                let pass1 = $("#userpwd").val();
                let pass2 = $("#userpwdchk").val();
                if (pass1 != '' && pass2 != ''){
                    if (pass1 == pass2){
                        $("#error1").html('');
                    } else {
                        $("#error1").html('비밀번호가 일치하지 않습니다.');
                        $("#error1").css('color','red');
                    }
                }
            })
 
            $("#useremail").keyup( function(event){
                const regExp = /[ㄱ-ㅎㅏ-ㅣ가-힣]/g;
                event.target.value = event.target.value.trim();
                if (regExp.test(event.target.value)) {
                    event.target.value = event.target.value.replace(regExp, '');
                }
                let email = $("#useremail").val();
                var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
                if (!reg_email.test(email)){
                    $("#error2").html('이메일 형식이 잘못되었습니다.');
                    $("#error2").css('color','red');
                } else {
                    $("#error2").html('');
                }
            })
        } )


// 로그인 폼
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

// 계정 찾기 폼 이동
function find_account(){
	location.href="recipe.do?command=findAccountForm";
}

// 아이디, 비밀번호 찾기
function search(param){
	document.frm.action = "recipe.do?command=findAccBy&param="+param;
	document.frm.submit();
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
      document.formm.action="recipe.do?command="+comm;
      document.formm.submit();
   }
}

function withDrawal(id,pwd){
	 let pwdcheck = prompt('비밀번호를 입력해주세요' , 'ex)1234');

	if(pwd.valueOf()==pwdcheck.valueOf()){
		 document.formm.action="recipe.do?command=withDrawal&id="+id;
      document.formm.submit();
	}else{
		alert("비밀번호가 맞지 않습니다")
		return;
	}

}

	// qna 비밀글설정
	function qnaChgChk(checkbox) {
	
	    const tbox = document.getElementById('pass');
	    tbox.disabled = checkbox.checked ? false : true;
	
	    if (tbox.disabled) {
	        tbox.value = null;
	
	    } else {
	        tbox.focus();
	    }
	}

	// qna 패스워드체크
	function qnaPwdCheck(qnapwd, qseq) {
	    let pwd = prompt('비밀번호를 입력해주세요', '비밀번호');
	
	    if (pwd.valueOf() == qnapwd.valueOf()) {
	        location.href = "qnaDetail?qseq=" + qseq;
	
	    } else {
	        alert("비밀번호가 맞지 않습니다")
	        location.href = "qnaList";
	    }
	}

	// qna 삭제
	function deleteQna(qseq, refer) {
	    let result = prompt('삭제하시려면 삭제라고 작성해주세요', '삭제');
	
	    if (result == '삭제') {
	        location.href = "recipe.do?command=deleteQna&qseq=" + qseq + "&refer=" + refer;
	    } else {
	        alert('똑같이 작성해 주세요')
	        return;
	    }
	}
    
    
    

