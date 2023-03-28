<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../include/headerfooter/header.jsp" %>
<%@ include file="../mypage/sub_menu_left.jsp"%>

<article>
   <div id="memberdetail" >
     
      <form method="post" name="formm">
      
         <fieldset>
         <legend>Member Detail Info</legend>         
            <span style="float:left; margin-right:20px" id="memberdetail-profile">
               <img src="${loginUser.IMG}" onerror="this.src='imageProfile/basic.jpg'"/>
            </span>

            <label><b>이 름:&nbsp;&nbsp;&nbsp; ${loginUser.NAME}</b></label><br/>
            <label><b>아이디:&nbsp;&nbsp;&nbsp; ${loginUser.ID}</b></label><br/>
            <label><b>닉네임:&nbsp;&nbsp;&nbsp; ${loginUser.NICK}</b></label><br/>
            <label><b>전화번호:&nbsp;&nbsp;&nbsp; ${loginUser.PHONE}</b></label><br/>
            <label><b>이메일:&nbsp;&nbsp;&nbsp; ${loginUser.EMAIL}</b></label><br/>
            <label><b>주  소:&nbsp; ${loginUser.ADDRESS1} &nbsp; ${loginUser.ADDRESS2}&nbsp; ${loginUser.ADDRESS3}</b></label><br/>
            <label><b>우편번호:&nbsp;&nbsp;&nbsp; ${loginUser.ZIP_NUM}</b></label><br/>
            <label><b>가입일자:&nbsp;&nbsp;&nbsp; ${loginUser.INDATE}</b></label><br/>                 
         </fieldset>
         <div class="clear"></div>
         <div id="buttons">
            <input type="button" value="정보수정" class="cancel" onclick="location.href='updateMemForm'">
			<input type="button" value="회원탈퇴" class="cancel" onclick="withDrawal('${loginUser.ID}','${loginUser.PWD}');">
         </div>
      </form>
   </div>
</article>


<%@ include file="../include/headerfooter/footer.jsp" %>