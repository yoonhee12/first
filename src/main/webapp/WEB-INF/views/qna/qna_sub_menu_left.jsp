<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="UTF-8">

<nav id="qna_sub_menu">		
	
	<ul>
		<li><a href="qnaList?page=1&refer=all">전체 Q&amp;A</a></li>
		<c:if test="${loginAdmin == null && loginUser != null}">
		<li><a href="qnaList?page=1&refer=my">나의 Q&amp;A</a></li>
		<li><a href="qnaWriteForm?page=1&">Q&amp;A 작성</a></li>
		</c:if> 
	</ul>
</nav>
