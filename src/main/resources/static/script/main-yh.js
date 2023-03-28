function selectBoxChange(value){
document.formm.action="qnaWriteForm&secrett="+value;
document.formm.submit();
}

function pwdcheck(qnapwd,qseq){
   let pwd = prompt('비밀번호를 입력해주세요' , '비밀번호');
   if(pwd==qnapwd) location.href = "qnaDetail?qseq="+qseq;
   else alert("비밀번호가 맞지 않습니다");
}

function chgChk(checkbox){
   
     const tbox = document.getElementById('pass');
     tbox.disabled = checkbox.checked ? false : true;
     
     if(tbox.disabled) {
       tbox.value = null;
       
     }else {
       tbox.focus();
     }
     }
     
     
function deleteQna(qseq){
  let result = confirm('삭제하시겠습니까?');
  
   if ( result ){
      location.href="deleteQna?qseq="+qseq;
      }
      
   }
     
     