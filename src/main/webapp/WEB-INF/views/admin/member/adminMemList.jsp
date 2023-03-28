<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/admin/admin_header.jsp"%>

<article class="admin-board container admin-mem-list">
<h1>회원리스트</h1>  
<form name="frm" method="post">
<table class="admin-search-area">
	<tr><td>회원 이름 <input type="text" name="key" value="${key}">
	<input class="btn" type="button" value="검색" onclick="go_search('memberList')">
	<input class="btn" type="button" name="btn_total" value="전체보기 "	onClick="go_total('memberList')"></td> </tr>
</table><br>
<table id="membersList">

	<tr> <th><input type='checkbox' value='selectall' onclick='selectAll(this,"id")'/>전체선택/해제</th>
	<th>아이디</th><th> 이름 </th><th>이메일</th><th>닉네임</th><th>가입일</th>
	</tr>
    <c:forEach items="${membersList}" var="membersVO">  
	    <tr>
	    <td><input type="checkbox" name="id" value="${membersVO.ID}"></td>
	    <td>
	    <c:choose>
	    <c:when test='${membersVO.USEYN=="Y"}'>	    
	    ${membersVO.ID}<span style="font-weight:bold; color:blue;">정상</span>		    
	    </c:when>
	    <c:otherwise>${membersVO.ID}<span style="font-weight:bold; color:red;">휴먼</span>		    		    
	    </c:otherwise>
	    </c:choose>
	    </td>
	    	<td><a href="#" onClick="go_view('adminMemDetail','id','${membersVO.ID}')">${membersVO.NAME}</a></td><td>${membersVO.EMAIL}</td><td>${membersVO.NICK}</td>
	    	<td><fmt:formatDate value="${membersVO.INDATE}"/></td></tr>
	  </c:forEach>
	  <tr>
	  <th><a href="#" onClick="go_sleep_member();">휴면회원 전환하기</a></th>
	  <tr>
	</table>
	<div class="paging-area">
		<jsp:include page="../../paging/paging.jsp">
    		<jsp:param value="memberList" name="command" />
		</jsp:include>
	</div>
	</form>
</article>

<%@ include file="../../include/admin/footer.jsp"%>