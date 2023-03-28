<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../include/admin/admin_header.jsp"%>

<article class="admin-board container">
	<div id="joinForm">
		<form method="post" name="frmm" action="noticeWrite">
		<input type="hidden" name="aid" value="${loginAdmin.AID}">
		<input type="hidden" name="pwd" value="${loginAdmin.PWD}">
			<fieldset id="join">
				<legend>Notice Write</legend><br>
				<div>
					<label>제 목</label>&nbsp;<input type="text" name="asubject" size="60" value="${dto.asubject}">
					&nbsp;&nbsp; 중요 <input type="checkbox" name="mustread" value="Y">
					<br>
				</div>
				<div>
					<label>내 용:</label> <textarea cols="70" rows="15"	name="acontent" style="vertical-align:middle;">${dto.acontent}</textarea><br>
				</div>
				<div>
					<label>이미지 사진</label><input type="button" value="파일선택"
						onClick="selectimg();"><br>
					<div id="image" style="float: left"></div>
					<div>
						<input type="hidden" name="aimage">
					</div>
					<!-- 멀티파트 쓰면 오류나서 여기서 두개실행 해서 따로 하는것 -->
					<img src="" id="previewimg" width="150" style="display: none" />
				</div>
			</fieldset>
			<div class="clear"></div>
			<div id="buttons">
				<input type="submit" value="글쓰기" class="submit">
				<input type="reset" value="취소" class="cancel">
			</div>
			<div>${message }</div>
		</form>
	</div>
</article>

<%@ include file="../../include/admin/footer.jsp"%>
