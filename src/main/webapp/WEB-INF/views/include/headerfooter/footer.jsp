<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
</main>

<div  class="clear"></div>

	<footer class="pt-10 mt-5" style="background-color: #FFFFFF;">
 		<!-- #FFB937 -->
        <div class="container footer-upper-area">
        	<!-- col 의 뜻은 한줄을 12개로 나누었을 때 비중을 얼마나 할당할지를 뜻합니다. -->
        	<!-- 6개의 요소를 균일하게 담고 싶다면 col-2 이런 식으로 복붙을 해주면 됩니다. -->
        	<!-- 중간에 있는 md와 sm의 뜻은 화면의 크기를 말합니다. -->
        	<!-- 반응형으로 웹페이지를 설계할 때 필요한데, md는 화면 크기가 중간이거나 그 이상일 때, sm은 화면 크기가 작을 때(핸드폰 등의 화면)를 말합니다. -->
        	<!-- col-md-2 col-sm-4 화면이 클때는 12/2=6개를 한줄에 배치하고, 화면이 작을 때는 12/4=3개를 한줄에 배치합니다. -->
        	<!-- col의 숫자는 계속 달라도 상관 없으며, 12를 넘어가는 순간, 다음줄이 개행됩니다 -->
        	<!-- 이 클래스는 부트스트랩을 연동했을 경우에만 적용됩니다. -->
	        <div class="row footer-upper-left">
	        
	            <div class="footer-area-item col-md-2 col-sm-4"><a href="#" onclick="footer_go_to('ourstory')">회사 소개</a></div>
	            <div class="footer-area-item col-md-2 col-sm-4"><a href="notice?first='1'">공지사항</a></div>
	            <div class="footer-area-item col-md-2 col-sm-4"><a href="#" onclick="footer_go_to('terms')">이용약관</a></div>
	            <div class="footer-area-item col-md-2 col-sm-6"><a href="#" onclick="footer_go_to('privatePolicy')">개인정보방침</a></div>
	            <div class="footer-area-item col-md-2 col-sm-6"><a href="qnaList?page=1&refer=all">고객센터</a></div>
	            <div class="footer-area-item col-md-2 col-sm-7"><a href="admin">관리자</a></div>
	        </div>
	        <div class="footer-upper-right">
	        	<div class="icon-area">
		            <i class="fab fa-instagram icon" id="icon" aria-hidden="true"></i>
		          </div>
		          <div class="icon-area">
		            <i class="fab fa-twitter icon" id="icon" aria-hidden="true"></i>
		          </div>
		          <div class="icon-area">
		            <i class="fab fa-facebook-f icon" id="icon" aria-hidden="true"></i>
		          </div>
	        </div>
        </div>
        
        <br>
        
	 	<div class="container footer-bottom pt-5 pb-5">
	        <div>
	        	<h6>자바 웹프로그래밍 1조</h6>
	        	<h6>김성수 류승준 이건하 이서윤 이윤희</h6>
	        	<h6>대표 번호 +082 010 1234 4260</h6>
	            <h5>Copyright ⓒ 2023 EZEN JAVAB FIRST Inc All Rights Reserved</h5>
	        </div>
	    </div>
    </footer>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="/script/member.js" type="text/javascript"></script>
<!-- <script src="/script/main-sj.js" type="text/javascript"></script> -->
<script src="/script/main-gh.js" type="text/javascript"></script>
<script src="/script/main-yh.js" type="text/javascript"></script>
<script src="/script/main-sy.js" type="text/javascript"></script>
</body>
</html>