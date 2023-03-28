2023.02.13 readme

깃허브를 제 깃허브에서 하지 않고
어느 정도 취합이 되고 나시면 새롭게 조원분들 중 깃허브에서 레파지토리를 생성해서 공유해보시는 것도
좋은 경험이 될 것 같습니다.

구글드라이브나 스프레드시트는 편하신 방향으로 이용하시면 될것 같습니다.


0. 사용하는 라이브러리 코드

<!--#jstl 관련 임포트  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--#폰트어썸 임포트  --> 폰트어썸이란? 무료 아이콘이나 문서 템플릿 등을 이용할 수 있는 라이브러리(현업에서도 자주 사용)
<script src="https://kit.fontawesome.com/74c64a7de1.js" crossorigin="anonymous"></script>

<!--#제이쿼리 임포트  -->
<script src="script/jquery-3.6.3.js" type="text/javascript"></script>

<!--#부트스트랩(css만) 임포트  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">


1.
테이블과 더미데이터, 뷰들은 final_table, final_values, final_view 에 최신화할 것


2. 
깃허브로 협업을 할 때 가급적이면 이름이 같은 파일은 작업을 피하고, 피치 못하게 해야할 경우 브랜치를 만들어서 3 way merge를 할 수 있으면 좋고,
그게 쉽지 않다면 파일을 수동으로 비교해서 합치는게 좋습니다. 이런 경우 vscode에서 파일을 복수 선택한 후 compare selected 옵션을 통해 비교하면 실수와 시간낭비를 줄일 수 있습니다.


3.
오류가 났을 때 가장 우선적으로 점검해야할 곳은 주소창과 콘솔창입니다. 콘솔창에서는 가장 위에 뜬 에러 메시지의 오른쪽 끝 부분에 원인이 있는 경우가 많습니다.


4.
깃허브로 처음 프로젝트를 받아서 세팅할 때, detect and configure nature를 해제하고 import한 후, 로컬에서(이클립스에서) 
프로젝트 우클릭 -> configure -> add gradle nature 를 해야합니다.


5. 
css 작업하고 싶으실 때에는 공통 css인 style.css에서 해당하는 영역의 class 혹은 id를 검색해보신 후 코드를 보고 응용해주시면 됩니다.


6.
현재 프로젝트의 css 구조는 가장 바깥쪽의 article 혹은 div에 그 파일을 대표할 수 있을 만한 단어로 id를 선정해주고
그 id의 하위에 있는 css를 선택자로 선택하는 구조로 짜여져 있습니다. 가벼운 효과를 줄 때에도 css 선택자를 이용해주세요. 다른분들이나 다른 곳의 코드와 겹칠 수 있습니다.


7.
부트스트랩이 임포트 되어 있다면 클래스에 pt-? pb-? mt-? mb-? 이런 식으로 패딩과 마진 조절을 할 수 있습니다.
예시를 들자면 <div class="pt-1 pb-5"> 입니다
해석하자면 pt-1=패딩 탑을 1의 단위만큼 / pb-5=패딩 바텀을 5의 단위만큼 (단위는 픽셀이 아닙니다. 반응형에 사용하는 최소 단위입니다.) 패딩을 줍니다
마진이나 Left, Right에도 똑같이 사용할 수 있습니다. 클래스나 id를 생성하기 애매한데 위치 조정을 하고 싶은 경우에 사용하는 방법입니다.


8. 홈페이지에 주로 사용했던 색상 코드들입니다. 값만 사용하셔도 되고, 클래스처럼 쓰셔도 됩니다.
빨간색 코드
.text-filter-red { color : #E1573A; } 

살짝 밝은 회색 코드
.text-filter-lightgray, .dark-hover-filter { color : #888; }

밝은 오렌지 필터
.bright-orange-filter { color: #FFB937; }

밝은 줄 필터
.line-bright-filter { color : #d8d8d8; }

검정색 필터
.very-dark-filter { color : #666; }

좀 더 밝은 색 필터
.little-dark-filter { color : #777; }





