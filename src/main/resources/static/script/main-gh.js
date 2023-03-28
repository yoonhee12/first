const addButton = document.getElementById("add-button");

let taskList = [];
let filterList =[];
let mode = "all";

//addButton.addEventListener("click",addTask);
/*const 내용 = `<div class="recipe-process">
                	<label>Profile</label><input type="file" name="img${}">
                	<textarea name="content" rows="4" cols="50"></textarea>
            	</div>`;
*/


let recipeSaveReply=()=>{
	document.recipeReplyAddForm.action="addReply";
	document.recipeReplyAddForm.submit();
}



let abcd = '#소고기 500g #후추 약간 #김치 반포기 #소금 한큰술 #설탕 적당히많이 #물엿 1큰술';

let words1 = abcd.split(' ');

/**
let abcd = '#소고기 500g #후추 약간 #김치 반포기 #소금 한큰술 #설탕 적당히많이 #물엿 1큰술';

let words1 = abcd.split(' ');

let tag = [];
let quantity = [];

console.log(words1);

for(let i = 0; i<words1.length; i++){
  if(words1[i].indexOf('#')==0){
    let temp = words1[i].substr(1);
    tag.push(temp);
  }else{
    quantity.push(words1[i]);
  }
}



console.log(tag);
console.log(quantity);
*/

// 레시피에서 작동할 자바스크립트 모음

function ILikeThis( rnum ){
	let url = 'likeRecipe?rnum='+rnum;
	location.href=url;
}

function IReportThis( rnum ){
	let url = 'reportRecipe?rnum='+rnum;
	location.href=url;
}

function deleteThisReply(replyseq){
   let msg = confirm("댓글 삭제하시겠습니까?")
   if (msg==true){
      document.recipeReplyAddForm.action="deleteReply?replyseq="+replyseq;
      document.recipeReplyAddForm.submit();
   }else {
      return false;
   }
}

function footer_go_to( destination ){
	location.href=destination;
}



/**
 * scrollAnimation 설명서
 * 이 메서드는 화면(window)의 스크롤에 맞춰 특정 요소에
 * 이벤트(show, hide, transform) 를 줄 수 있습니다.
 * 제이쿼리 임포트를 필수로 요구합니다.
 * show_and_hide 클래스를 이벤트를 적용할 오브젝트에 적용하면 됩니다.
 * _checkPosition에 add, remove에 있는 클래스는 자기 상황에 맞게 바꾸면 됩니다.
 */
const scrollAnimation=()=>{
    // items는 나중에 querySelectorAll을 사용할 때 쓸 수 있습니다
    // actionHeight는 가로 길이로 얼마나 스크롤했을 때 이벤트가 발동할지
    let items, actionHeight;

    // 페이지가 로드될 때 아이템에 쿼리셀렉터를 실행하고
    // actionHeight
    const initModule=()=>{
        items = document.querySelectorAll(".show_and_hide");
        actionHeight = 600;
        _addEventHandlers();
    };

    const _addEventHandlers=()=>{
        window.addEventListener("scroll", _checkPosition);
        window.addEventListener("load", _checkPosition);
        window.addEventListener("resize", initModule);
    };

    const _checkPosition=()=>{
        let here = window.scrollY;
        // if 조건일 때 사라지게 하고
        if(here>actionHeight){
            $('.show_and_hide').removeClass('show').addClass('hide');  
        }else{
            // else 조건일 때 보여지게 하는 코드입니다.
            $('.show_and_hide').removeClass('hide').addClass('show');
        }
    }
    return {
        init: initModule
    }
}

// 함수 초기화를 시켜줍니다.
scrollAnimation().init();




