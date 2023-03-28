-- members 테이블 샘플
insert into members(id, pwd, name, phone, email, nick, address1, address2, zip_num, img)
values('scott', '1234', '홍길동', '010-1111-1111', 'ezen@neodo.gosu', '검성길동', 
'서울시 성동구 성수동 1가', '1번지21호', '133-110', 'imageProfile/profil1.jpg');
insert into members(id, pwd, name, phone, email, nick, address1, address2, zip_num, img)
values('somi', '1234', '아이유', '010-2222-2222', 'aiu@doko.aiu', '아이유', 
'서울시 송파구 잠실2동', '리센츠 아파트 201동 505호', '130-120', 'imageProfile/profil2.jpg');
insert into members(id, pwd, name, phone, email, nick, address1, address2, zip_num, img)
values('tom', '5678', '톰', '010-3333-3333', 'tom@jerry.cat', '톰', 
'서울시 사랑구 행복동', '이편한세상 101동 303호', '130-120', 'imageProfile/basic.jpg');

-- admins 테이블 샘플
insert into ADMINS(aid, pwd, phone)
values('admin', 'admin', '010-8888-7984');

-- qna 테이블 샘플
insert into qna(qseq, id, qsubject, qcontent)
values(qseq_seq.nextval, 'scott', '문의가 있습니다 급합니다', '레시피를 올리려고 하는데 에러라고 진행이 되지 않습니다'
);
insert into qna(qseq, id, qsubject, qcontent)
values(qseq_seq.nextval, 'somi', '좋아요 버튼이 눌리지 않아요ㅠㅠ', '레시피를 올리려고 하는데 에러라고 진행이 되지 않습니다'
);
insert into qna(qseq, id, qsubject, qcontent)
values(qseq_seq.nextval, 'tom', '재료 추가 제안입니다', '레시피를 올리려고 하는데 에러라고 진행이 되지 않습니다'
);
insert into qna(qseq, id, qsubject, qcontent)
values(qseq_seq.nextval, 'scott', '문의가 있습니다 급합니다', '레시피를 올리려고 하는데 에러라고 진행이 되지 않습니다'
);
insert into qna(qseq, id, qsubject, qcontent)
values(qseq_seq.nextval, 'somi', '좋아요 버튼이 눌리지 않아요ㅠㅠ', '레시피를 올리려고 하는데 에러라고 진행이 되지 않습니다'
);
insert into qna(qseq, id, qsubject, qcontent)
values(qseq_seq.nextval, 'tom', '재료 추가 제안입니다', '레시피를 올리려고 하는데 에러라고 진행이 되지 않습니다'
);
insert into qna(qseq, id, qsubject, qcontent)
values(qseq_seq.nextval, 'scott', '문의가 있습니다 급합니다', '레시피를 올리려고 하는데 에러라고 진행이 되지 않습니다'
);
insert into qna(qseq, id, qsubject, qcontent)
values(qseq_seq.nextval, 'somi', '좋아요 버튼이 눌리지 않아요ㅠㅠ', '레시피를 올리려고 하는데 에러라고 진행이 되지 않습니다'
);
insert into qna(qseq, id, qsubject, qcontent)
values(qseq_seq.nextval, 'tom', '재료 추가 제안입니다', '레시피를 올리려고 하는데 에러라고 진행이 되지 않습니다'
);

--ingTag 샘플

insert into ingTag(tag_id, tag) values(1, '천도복숭아');
insert into ingTag(tag_id, tag) values(2,'설탕');
insert into ingTag(tag_id, tag) values(3,'계피가루');
insert into ingTag(tag_id, tag) values(4,'중력분');
insert into ingTag(tag_id, tag) values(5,'베이킹파우더');
insert into ingTag(tag_id, tag) values(6,'소금');
insert into ingTag(tag_id, tag) values(7,'우유');
insert into ingTag(tag_id, tag) values(8,'버터');
insert into ingTag(tag_id, tag) values(9, '감자');
insert into ingTag(tag_id, tag) values(10, '양파');
insert into ingTag(tag_id, tag) values(11, '물');
insert into ingTag(tag_id, tag) values(12, '생크림');
insert into ingTag(tag_id, tag) values(13, '치킨스톡큐브');
insert into ingTag(tag_id, tag) values(14, '후추');
insert into ingTag(tag_id, tag) values(15, '페이스트리생지');
insert into ingTag(tag_id, tag) values(16, '달걀');
insert into ingTag(tag_id, tag) values(17, '자른미역');
insert into ingTag(tag_id, tag) values(18, '두부');
insert into ingTag(tag_id, tag) values(19, '다시물');
insert into ingTag(tag_id, tag) values(20, '된장');
insert into ingTag(tag_id, tag) values(21, '참기름');
insert into ingTag(tag_id, tag) values(22, '국간장');
insert into ingTag(tag_id, tag) values(23, '다진마늘');
insert into ingTag(tag_id, tag) values(24, '알배추');
insert into ingTag(tag_id, tag) values(25, '쪽파'); 
insert into ingTag(tag_id, tag) values(26, '통깨');
insert into ingTag(tag_id, tag) values(27, '고춧가루');
insert into ingTag(tag_id, tag) values(28, '매실액');
insert into ingTag(tag_id, tag) values(29, '쌀');
insert into ingTag(tag_id, tag) values(30, '바지락살');
insert into ingTag(tag_id, tag) values(31, '부추');
insert into ingTag(tag_id, tag) values(32, '당근');
insert into ingTag(tag_id, tag) values(33, '레몬');
insert into ingTag(tag_id, tag) values(34, '사이다');
insert into ingTag(tag_id, tag) values(35, '믹스베리티');
insert into ingTag(tag_id, tag) values(36, '코코넛젤리');
insert into ingTag(tag_id, tag) values(37, '동결건조베리');
insert into ingTag(tag_id, tag) values(38, '돼지고기다짐육');
insert into ingTag(tag_id, tag) values(39, '우동면');
insert into ingTag(tag_id, tag) values(40, '달걀노른자');
insert into ingTag(tag_id, tag) values(41, '맛간장');
insert into ingTag(tag_id, tag) values(42, '오이고추');
insert into ingTag(tag_id, tag) values(43, '고추장');
insert into ingTag(tag_id, tag) values(44, '마늘');
insert into ingTag(tag_id, tag) values(45, '올리고당');
insert into ingTag(tag_id, tag) values(46, '마요네즈');
insert into ingTag(tag_id, tag) values(47, '깨소금');
insert into ingTag(tag_id, tag) values(48, '밀가루중력분');
insert into ingTag(tag_id, tag) values(49, '베이킹소다');
insert into ingTag(tag_id, tag) values(50, '블루베리');
insert into ingTag(tag_id, tag) values(51, '만두');
insert into ingTag(tag_id, tag) values(52, '떡국떡');
insert into ingTag(tag_id, tag) values(53, '건표고버섯');
insert into ingTag(tag_id, tag) values(54, '대파');
insert into ingTag(tag_id, tag) values(55, '크림치즈');
insert into ingTag(tag_id, tag) values(56, '전분');
insert into ingTag(tag_id, tag) values(57, '식초');
insert into ingTag(tag_id, tag) values(58, '파스타면');
insert into ingTag(tag_id, tag) values(59, '마늘쫑');
insert into ingTag(tag_id, tag) values(60, '비엔나소시지');
insert into ingTag(tag_id, tag) values(61, '간장');
insert into ingTag(tag_id, tag) values(62, '굴소스');
insert into ingTag(tag_id, tag) values(63, '돼지고기목살');
insert into ingTag(tag_id, tag) values(64, '밥');
insert into ingTag(tag_id, tag) values(65, '청경채');
insert into ingTag(tag_id, tag) values(66, '가지');
insert into ingTag(tag_id, tag) values(67, '오이');
insert into ingTag(tag_id, tag) values(68, '청양고추');
insert into ingTag(tag_id, tag) values(69, '홍고추');
insert into ingTag(tag_id, tag) values(70, '소시지');
insert into ingTag(tag_id, tag) values(71, '식용유');
insert into ingTag(tag_id, tag) values(72, '망고수박');
insert into ingTag(tag_id, tag) values(73, '연유');
insert into ingTag(tag_id, tag) values(74, '초콜릿');
insert into ingTag(tag_id, tag) values(75, '김밥용김');
insert into ingTag(tag_id, tag) values(76, '현미밥');
insert into ingTag(tag_id, tag) values(77, '닭가슴살통조림');
insert into ingTag(tag_id, tag) values(78, '쌈무');
insert into ingTag(tag_id, tag) values(79, '파프리카');
insert into ingTag(tag_id, tag) values(80, '양배추');
insert into ingTag(tag_id, tag) values(81, '라디치오');
insert into ingTag(tag_id, tag) values(82, '방울토마토');
insert into ingTag(tag_id, tag) values(83, '닭가슴살');
insert into ingTag(tag_id, tag) values(84, '블랙올리브');
insert into ingTag(tag_id, tag) values(85, '아보카도');
insert into ingTag(tag_id, tag) values(86, '단무지');
insert into ingTag(tag_id, tag) values(87, '우엉조림');
insert into ingTag(tag_id, tag) values(88, '틈새라면');
insert into ingTag(tag_id, tag) values(89, '짜파게티');
insert into ingTag(tag_id, tag) values(90, '체다치즈');
insert into ingTag(tag_id, tag) values(91, '올리브유');
insert into ingTag(tag_id, tag) values(92, '또띠아');
insert into ingTag(tag_id, tag) values(93, '함박스테이크');
insert into ingTag(tag_id, tag) values(94, '데미그라스소스');
insert into ingTag(tag_id, tag) values(95, '새우');
insert into ingTag(tag_id, tag) values(96, '밤');
insert into ingTag(tag_id, tag) values(97, '사과');
insert into ingTag(tag_id, tag) values(98, '청주');
insert into ingTag(tag_id, tag) values(99, '잣');
insert into ingTag(tag_id, tag) values(100, '연겨자');
insert into ingTag(tag_id, tag) values(101, '굴');
insert into ingTag(tag_id, tag) values(102, '콩나물');
insert into ingTag(tag_id, tag) values(103, '무');
insert into ingTag(tag_id, tag) values(104, '애호박');
insert into ingTag(tag_id, tag) values(105, '칵테일새우');
insert into ingTag(tag_id, tag) values(106, '베이컨');
insert into ingTag(tag_id, tag) values(107, '슬라이스치즈');
insert into ingTag(tag_id, tag) values(108, '부침가루');
insert into ingTag(tag_id, tag) values(109, '깐은행');
insert into ingTag(tag_id, tag) values(110, '소면');
insert into ingTag(tag_id, tag) values(111, '깻잎');
insert into ingTag(tag_id, tag) values(112, '마른미역');
insert into ingTag(tag_id, tag) values(113, '들기름');
insert into ingTag(tag_id, tag) values(114, '간 깨');
insert into ingTag(tag_id, tag) values(115, '중화면');
insert into ingTag(tag_id, tag) values(116, '해물믹스');
insert into ingTag(tag_id, tag) values(117, '참치캔');
insert into ingTag(tag_id, tag) values(118, '라이스페이퍼');
insert into ingTag(tag_id, tag) values(119, '파슬리');
insert into ingTag(tag_id, tag) values(120, '고구마');
insert into ingTag(tag_id, tag) values(121, '꿀');
insert into ingTag(tag_id, tag) values(122, '모짜렐라치즈');
insert into ingTag(tag_id, tag) values(123, '강력분');
insert into ingTag(tag_id, tag) values(124, '동태살');
insert into ingTag(tag_id, tag) values(125, '무염버터');
insert into ingTag(tag_id, tag) values(126, '시금치');
insert into ingTag(tag_id, tag) values(127, '케이엔페퍼');
insert into ingTag(tag_id, tag) values(128, '팽이버섯');
insert into ingTag(tag_id, tag) values(129, '큐브식빵');
insert into ingTag(tag_id, tag) values(130, '시나몬파우더');
insert into ingTag(tag_id, tag) values(131, '슈가파우더');


-- recipe, recipe_tag, processImg 테이블 샘플
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'scott', '복숭아 코블러', '지금 한창 제철인 천도복숭아를 활용하여 만드는 상큼한 디저트 메뉴!', 60, 6 , 'imageRecipe/peachThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'scott', '앙쿠르트 스프', '스프를 컵에 담고 그위에 페이스트리 반죽을 덮어서 오븐에 바삭하게 구운 음식', 60, 4 , 'imageRecipe/piesoupThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'scott', '미역된장국', '집에 국 없을 때 미역, 두부 넣어 간단하게 만드는 국, 미역된장국 만드는 법', 30, 2 , 'imageRecipe/swsoupThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'scott', '알배기배추무침', '반찬 없을때 간단히 만드는 알배기배추 요리', 15, 3 , 'imageRecipe/cabbageThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'scott', '바지락야채죽', '봄 제철 식재료로 만드는 요리!바지락야채죽', 30, 1 , 'imageRecipe/clamThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'somi', '믹스베리레몬에이드', '더위를 잊게 해줄 상큼한 음료 한 잔~ 과일티백으로 만드는 믹스베리레몬에이드 레시피를 소개해드릴게요.', 20, 5 , 'imageRecipe/lemonadeThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'somi', '마제소바', '다진 고기를 볶아서 비벼먹는 일본식 비빔면!', 30, 4 , 'imageRecipe/majesobaThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'somi', '오이고추 된장무침', '불 없이 간단하게 만들어 여름에 시원하고 아삭하게  즐길 수 있는 국민 밥반찬 메뉴!', 5, 3 , 'imageRecipe/cucumberThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'somi', '레몬블루베리팬케이크', '브런치 메뉴 추천 촉촉하고 새콤달콤한 레몬 블루베리 팬케이크', 30, 6 , 'imageRecipe/pancakeThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'somi', '들깨떡만두국', '저는 버섯 잔뜩 넣은 들깨수제비를 정말 좋아해요! 먹으면서 떡사리와 만두를 넣으면더 든든하고 맛있겠다! 싶어서 만들어 본 레시피!', 20, 2 , 'imageRecipe/sesameThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'scott', '크림치즈떡', '쫀득한 식감에 크림치즈의 진한 풍미와 고소한 콩가루가 합쳐진 너무 쉬운 간식메뉴에요', 20, 6 , 'imageRecipe/mochiThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'scott', '마늘쫑파스타', '제철 마늘쫑으로 고소한 건새우와 굴소스를 넣어 감칠맛을 살린 파스타를 만들어봤어요', 30, 4 , 'imageRecipe/garlicpastaThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'scott', '스리라차목살필라프', '도톰한 돼지고기 목살과 매콤 칠리소스로 맛을 낸 필라프 레시피를 소개해드릴게요', 30, 4 , 'imageRecipe/srirachaThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'scott', '청경채된장무침', '단돈 2천원으로 만들 수 있는 쉽고 빠른 밑반찬', 10, 3 , 'imageRecipe/pakchoiThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'scott', '가지냉국', '가지를 전자레인지에 살짝 쪄서 간단하게 만드는 가지냉국', 30, 2 , 'imageRecipe/coldeggplantsoupThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'scott', '분홍소세지조림', '달달하면서 매콤해 밥반찬으로 딱인 소세지조림', 15, 3 , 'imageRecipe/braisedsausageThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'scott', '망고수박빙수', '달콤함이 더 좋은 망고수박으로 시원한 망고수박빙수 만들어보세요!', 120, 6 , 'imageRecipe/mangowatermelonThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'scott', '초계김밥', '더위에 잃은 입맛을 살려줄 새콤달콤 초계김밥', 30, 1 , 'imageRecipe/vinegargimbapThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'scott', '양배추콥샐러드', '신선한 채소들을 한입 크기로 썰어 한끼 식사로도 좋은 샐러드 레시피', 15, 4 , 'imageRecipe/cabbagesaladThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'scott', '두부김밥', '밥 대신 두부로 만드는 두부김밥 레시피', 10, 1 , 'imageRecipe/tofugimbapThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'scott', '틈새게티볶음밥', '두 가지 라면이 만나 이색 볶음밥으로 재탄생!', 30, 4 , 'imageRecipe/teumsaericeThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'scott', '함박스테이크 브리또', '또띠아 속에 도톰한 함박스테이크와 볶음밥, 치즈가 한번에!', 30, 4 , 'imageRecipe/hamburgburritoThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'somi', '새우잣소스무침', '오동통한 새우로 손님맞이 고급 반찬 만들기', 20, 3 , 'imageRecipe/shrimpnutThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'somi', '콩나물굴국', '통통한 굴로 만드는 콩나물 굴국, 뜨끈한 굴국밥 시원하게 끓이는 법', 30, 2 , 'imageRecipe/beansproutsoupThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'somi', '애호박 오코노미야끼', '새우, 베이컨을 토핑으로 넣고 오코노미야끼소스를 잔뜩 뿌리면 야채를 안먹는 아이들도 좋아해요!', 30, 4 , 'imageRecipe/okonomiyakiThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'somi', '통마늘은행볶음', '노릇노릇 최고의 맥주 도둑, 통마늘 은행 볶음', 10, 3 , 'imageRecipe/ginkgoThumb.png');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'somi', '된장비빔국수', '구수하고 짭짤한 맛에 감칠맛이 최고인 된장비빔국수 레시피', 15, 4 , 'imageRecipe/doenjangnoodleThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'somi', '마른미역자반', '10분도 안걸리는 초간단 밑반찬 맛있는 마른 미역자반 만드는 법', 10, 3 , 'imageRecipe/driedseaweedThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'somi', '해물볶음짬뽕', '오늘은 흔하게 먹는 국물있는 짬뽕이 아닌 국물 없이 해물, 채소를 넣고 얼큰하게 볶은 볶음짬뽕 레시피 가져왔어요~', 30, 4 , 'imageRecipe/chinesenoodleThumb.png');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'somi', '참치미역국', '고기 없이 쉽고 맛있게 미역국 끓이는 방법', 30, 2 , 'imageRecipe/tunaseaweedThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'somi', '깐쇼달걀', '삶은 달걀에 라이스페이퍼를 감싸서 노릇하게 굽고 매콤 달달한 양념에 버무린 다음 치즈까지~~~', 30, 3 , 'imageRecipe/ganshaoThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'somi', '고구마치즈빵', '달달한 찐고구마와 치즈를 밀가루 반죽으로 싸고 밀어서 후라이팬에 굽기만 하면 완성!', 60, 6 , 'imageRecipe/sweetpotatoThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'somi', '동태감자 오픈샌드위치', '탄,단,지 골고루 들어가 있어 든든한 한끼로 정말 좋아요!', 30, 4 , 'imageRecipe/pollacksandwichThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'somi', '회오리 오이무침', '오이가 스프링처럼 쭉쭉 늘어나 먹는 재미도 있고 양념이 칼집 사이사이로 잘 배어져 더욱 맛있어요!', 15, 3 , 'imageRecipe/tornadocucumberThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'somi', '닭가슴살 시금치 스테이크', '단백질 가득 닭가슴살과 영양소 가득 시금치가 잘 어울리는 홈스토랑 메뉴', 30, 4 , 'imageRecipe/chickensteakThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'somi', '팽이버섯장조림', '꼬독꼬독 씹히는 맛이 너무 좋아요~ 청양고추를 빼면  달달하면서 짭짤해 아이들도 먹을 수 있어요!', 15, 3 , 'imageRecipe/enokiThumb.jpg');
insert into recipe(rnum, id, subject, content, time, type, thumbnail) 
values(recipe_seq.nextVal, 'somi', '시나몬 큐브 프렌치 토스트', '시나몬 향이 진하게 나는 촉촉한 프렌치토스트를 커피랑 함께~', 20, 6 , 'imageRecipe/frenchtoastThumb.jpg');

insert into processImg(rnum, links, description, iseq) values( 1, 'imageRecipe/peach1.jpg', '복숭아는 씨를 제거하고 적당한 크기로 썬다.', 1);
insert into processImg(rnum, links, description, iseq) values( 1, 'imageRecipe/peach2.jpg', '볼에 복숭아, 설탕, 계피 가루를 넣고 섞어 절인다.', 2);
insert into processImg(rnum, links, description, iseq) values( 1, 'imageRecipe/peach3.jpg', '다른 볼에 중력분, 설탕, 베이킹파우더, 소금, 우유를 넣고 섞는다.', 3);
insert into processImg(rnum, links, description, iseq) values( 1, 'imageRecipe/peach4.jpg', '오븐 용기에 버터를 넣고 전자레인지에 돌려 녹인다.', 4);
insert into processImg(rnum, links, description, iseq) values( 1, 'imageRecipe/peach5.jpg', '에어프라이어에 넣고 160℃에서 30분 굽는다.', 5);
insert into processImg(rnum, links, description, iseq) values( 2, 'imageRecipe/piesoup1.jpg', '양파는 채썰고 감자는 슬라이스한다. 냄비에 버터를 녹이고 양파를 충분히 볶는다', 1);
insert into processImg(rnum, links, description, iseq) values( 2, 'imageRecipe/piesoup2.jpg', '감자를 넣고 함께 볶다가 물, 치킨스톡을 넣고 끓인다.', 2);
insert into processImg(rnum, links, description, iseq) values( 2, 'imageRecipe/piesoup3.jpg', '감자가 익으면 핸드블렌더로 갈아준다.', 3);
insert into processImg(rnum, links, description, iseq) values( 2, 'imageRecipe/piesoup4.jpg', '생크림을 넣고 약불에서 끓여 농도를 맞춘다. 소금, 후추로 간 한다.오븐 용기에 담고 페이스트리 생지로 용기를 덮는다', 4);
insert into processImg(rnum, links, description, iseq) values( 2, 'imageRecipe/piesoup5.jpg', '오븐에 넣고 170℃에서 15분 굽는다.', 5);
insert into processImg(rnum, links, description, iseq) values( 3, 'imageRecipe/swsoup1.jpg', '미역은 물에 불리고 두부는 한입 크기로 썬다. 냄비에 불린 미역, 참기름, 국간장을 넣고 약한 불로 볶는다.', 1);
insert into processImg(rnum, links, description, iseq) values( 3, 'imageRecipe/swsoup2.jpg', '다시물을 붓고 된장을 풀어주면서 끓인다.', 2);
insert into processImg(rnum, links, description, iseq) values( 3, 'imageRecipe/swsoup3.jpg', '한소끔 끓인 국에 다진마늘과 두부를 넣고 한번 더 끓인다.', 3);
insert into processImg(rnum, links, description, iseq) values( 4, 'imageRecipe/cabbage1.jpg', '끓는 물에 소금을 넣고 배추를 데친다', 1);
insert into processImg(rnum, links, description, iseq) values( 4, 'imageRecipe/cabbage2.jpg', '찬물에 헹군 후 물기를 짜고 먹기 좋은 크기로 썬다.', 2);
insert into processImg(rnum, links, description, iseq) values( 4, 'imageRecipe/cabbage3.jpg', '쪽파는 3~4cm 길이로 썬다.', 3);
insert into processImg(rnum, links, description, iseq) values( 4, 'imageRecipe/cabbage4.jpg', '볼에 양념재료를 모두 넣고 섞는다.', 4);
insert into processImg(rnum, links, description, iseq) values( 4, 'imageRecipe/cabbage5.jpg', '알배추, 쪽파에 양념을 넣고 무친 후 통깨를 뿌려 완성한다.', 5);
insert into processImg(rnum, links, description, iseq) values( 5, 'imageRecipe/clam1.jpg', '끓는 물에 소금을 넣고 배추를 데친다', 1);
insert into processImg(rnum, links, description, iseq) values( 5, 'imageRecipe/clam2.jpg', '찬물에 헹군 후 물기를 짜고 먹기 좋은 크기로 썬다.', 2);
insert into processImg(rnum, links, description, iseq) values( 5, 'imageRecipe/clam3.jpg', '쪽파는 3~4cm 길이로 썬다.', 3);
insert into processImg(rnum, links, description, iseq) values( 5, 'imageRecipe/clam4.jpg', '볼에 양념재료를 모두 넣고 섞는다.', 4);
insert into processImg(rnum, links, description, iseq) values( 5, 'imageRecipe/clam5.jpg', '알배추, 쪽파에 양념을 넣고 무친 후 통깨를 뿌려 완성한다.', 5);
insert into processImg(rnum, links, description, iseq) values( 6, 'imageRecipe/lemonade1.jpg', '믹스베리 티백을 따뜻한 물에 진하게 우린다.', 1);
insert into processImg(rnum, links, description, iseq) values( 6, 'imageRecipe/lemonade2.jpg', '레몬은 즙을 짜서 믹스베리 티 우린 것과 섞는다.', 2);
insert into processImg(rnum, links, description, iseq) values( 6, 'imageRecipe/lemonade3.jpg', '컵에 코코넛 젤리>얼음>사이다를 넣고 2를 넣는다.', 3);
insert into processImg(rnum, links, description, iseq) values( 6, 'imageRecipe/lemonade4.jpg', '동결건조베리를 토핑으로 올려 완성한다.', 4);
insert into processImg(rnum, links, description, iseq) values( 7, 'imageRecipe/majesoba1.png', '[맛간장] 냄비에 맛간장 재료를 넣고 한소끔 끓인 다음 불을 끄고 가쓰오부시를 넣어요.', 1);
insert into processImg(rnum, links, description, iseq) values( 7, 'imageRecipe/majesoba2.png', '부추와 쪽파는 쫑쫑 썰어 담고 팬에 고추기름, 다진마늘, 돼지고기 다짐육을 넣고 볶다가 양념을 넣고 자작하게 볶아요.', 2);
insert into processImg(rnum, links, description, iseq) values( 7, 'imageRecipe/majesoba3.png', '끓는 물에 면을 삶고 찬물에 헹궈요.', 3);
insert into processImg(rnum, links, description, iseq) values( 7, 'imageRecipe/majesoba4.png', '면에 맛간장 3숟가락, 고추기름 2숟가락을 넣고 비벼준 다음 그릇에 담아요.', 4);
insert into processImg(rnum, links, description, iseq) values( 7, 'imageRecipe/majesoba5.png', '부추, 파, 김, 다진마늘, 산초가루, 볶아둔 고기를 담고 달걀노른자를 올려 마무리해요.', 5);
insert into processImg(rnum, links, description, iseq) values( 8, 'imageRecipe/cucumber1.png', '오이고추를 먹기 좋은 크기로 자른다.', 1);
insert into processImg(rnum, links, description, iseq) values( 8, 'imageRecipe/cucumber2.png', '양념 재료를 섞는다.', 2);
insert into processImg(rnum, links, description, iseq) values( 8, 'imageRecipe/cucumber3.png', '오이고추와 양념을 버무린다.', 3);
insert into processImg(rnum, links, description, iseq) values( 9, 'imageRecipe/pancake1.png', '냄비에 레몬 블루베리 콩포트 재료를 모두 넣고 저어가며 졸여요. 우유에 레몬즙을 넣어서 버터 밀크를 만들어요.', 1);
insert into processImg(rnum, links, description, iseq) values( 9, 'imageRecipe/pancake2.png', '부추와 쪽파는 쫑쫑 썰어 담고 팬에 고추기름, 다진마늘, 돼지고기 다짐육을 넣고 볶다가 양념을 넣고 자작하게 볶아요.', 2);
insert into processImg(rnum, links, description, iseq) values( 9, 'imageRecipe/pancake3.png', '볼에 가루 재료를 모두 넣고 섞은 다음 달걀, 버터 밀크, 녹인 버터를 넣고 섞어요.', 3);
insert into processImg(rnum, links, description, iseq) values( 9, 'imageRecipe/pancake4.png', '블루베리를 넣고 가볍게 섞은 다음 팬에 오일을 두르고 반죽을 올려 앞뒤로 노릇하게 구워요.', 4);
insert into processImg(rnum, links, description, iseq) values( 10, 'imageRecipe/sesame1.jpg', '건표고버섯은 물에 불린 다음 얇게 썰고 대파는 어슷 썰어요.', 1);
insert into processImg(rnum, links, description, iseq) values( 10, 'imageRecipe/sesame2.jpg', '냄비에 건표고버섯 불린 물 500ml, 생수 500ml, 만개한알을 넣고 끓여요.', 2);
insert into processImg(rnum, links, description, iseq) values( 10, 'imageRecipe/sesame3.jpg', '떡국떡, 만두, 건표고버섯을 넣고 끓인 다음 국간장, 다진마늘을 넣고 끓여요.', 3);
insert into processImg(rnum, links, description, iseq) values( 10, 'imageRecipe/sesame4.jpg', '대파, 후추를 넣고 끓여요. 들깨가루, 들기름을 넣은 다음 그릇에 담고 실고추를 올려 완성해요.', 4);
insert into processImg(rnum, links, description, iseq) values( 11, 'imageRecipe/mochi1.jpg', '크림치즈떡의 재료를 볼에 넣고 섞는다.', 1);
insert into processImg(rnum, links, description, iseq) values( 11, 'imageRecipe/mochi2.jpg', '냄비에 넣고 약불로 뭉칠 때까지 끓인다.', 2);
insert into processImg(rnum, links, description, iseq) values( 11, 'imageRecipe/mochi3.jpg', '덩어리가 충분히 뭉쳐지면 그릇에 랩을 씌워 반죽을 붓는다.', 3);
insert into processImg(rnum, links, description, iseq) values( 11, 'imageRecipe/mochi4.jpg', '동그란 모양이 나오도록 랩을 밀봉하여 얼음물에 충분히 식힌다.', 4);
insert into processImg(rnum, links, description, iseq) values( 11, 'imageRecipe/mochi5.jpg', '랩 채로 냉장한 후 먹기 직전에 꿀, 콩가루를 뿌려 완성한다.', 5);
insert into processImg(rnum, links, description, iseq) values( 12, 'imageRecipe/garlicpasta1.jpg', '마늘쫑은 4cm 길이로 썰고 마늘은 편으로 썬다.', 1);
insert into processImg(rnum, links, description, iseq) values( 12, 'imageRecipe/garlicpasta2.jpg', '비엔나소시지에 칼집을 넣는다.', 2);
insert into processImg(rnum, links, description, iseq) values( 12, 'imageRecipe/garlicpasta3.jpg', '끓는 물에 소금을 넣고 면을 삶는다.', 3);
insert into processImg(rnum, links, description, iseq) values( 12, 'imageRecipe/garlicpasta4.jpg', '달군 팬에 올리브유를 두르고 마늘, 소시지를 볶다가 마늘쫑, 건새우, 페퍼론치노를 넣는다.', 4);
insert into processImg(rnum, links, description, iseq) values( 12, 'imageRecipe/garlicpasta5.jpg', '면과 면수를 약간 넣고 볶다가 간장, 굴소스를 넣고 소금, 후추로 간한다.', 5);
insert into processImg(rnum, links, description, iseq) values( 13, 'imageRecipe/sriracha1.jpg', '목살은 한입 크기로 썬다. 양파, 당근은 굵게 다지고 마늘은 편으로 썬다.', 1);
insert into processImg(rnum, links, description, iseq) values( 13, 'imageRecipe/sriracha2.jpg', '달군 팬에 식용유를 두르고 달걀후라이를 한다.', 2);
insert into processImg(rnum, links, description, iseq) values( 13, 'imageRecipe/sriracha3.jpg', '달군 팬에 식용유를 두르고 마늘을 볶다가 목살, 맛술, 간장을 넣고 볶는다.', 3);
insert into processImg(rnum, links, description, iseq) values( 13, 'imageRecipe/sriracha4.jpg', '고기가 익으면 양파, 당근, 마늘을 넣고 함께 볶다가 밥, 굴소스, 칠리갈릭 스리라차 소스를 넣고 잘 섞은 후 소금, 후추로 간한다.', 4);
insert into processImg(rnum, links, description, iseq) values( 13, 'imageRecipe/sriracha5.jpg', '그릇에 담고 달걀후라이를 올린 후 파슬리 가루, 마요네즈, 스리라차 소스를 뿌려 완성한다.', 5);
insert into processImg(rnum, links, description, iseq) values( 14, 'imageRecipe/pakchoi1.jpg', '씻은 청경채의 밑동을 자른다.', 1);
insert into processImg(rnum, links, description, iseq) values( 14, 'imageRecipe/pakchoi2.jpg', '끓는 소금물에 청경채를 데쳐 찬물에 헹군 후 물기를 짠다', 2);
insert into processImg(rnum, links, description, iseq) values( 14, 'imageRecipe/pakchoi3.jpg', '볼에 양념재료를 모두 넣고 섞는다.', 3);
insert into processImg(rnum, links, description, iseq) values( 14, 'imageRecipe/pakchoi4.jpg', '청경채에 만들어둔 양념을 넣고 조물조물 무친다.', 4);
insert into processImg(rnum, links, description, iseq) values( 14, 'imageRecipe/pakchoi5.jpg', '그릇에 담고 통깨를 뿌려 완성한다.', 5);
insert into processImg(rnum, links, description, iseq) values( 15, 'imageRecipe/coldeggplantsoup1.jpg', '물에 국간장, 식초, 소금, 액젓을 넣고 섞어 냉장고에 차갑게 보관한다.', 1);
insert into processImg(rnum, links, description, iseq) values( 15, 'imageRecipe/coldeggplantsoup2.jpg', '가지는 깨끗하게 세척 후 한입 크기로 길게 썬다. 오이는 가늘게 채썰고 고추는 송송 썬다.', 2);
insert into processImg(rnum, links, description, iseq) values( 15, 'imageRecipe/coldeggplantsoup3.jpg', '가지를 전자레인지에 4~5분 돌려 찐다.', 3);
insert into processImg(rnum, links, description, iseq) values( 15, 'imageRecipe/coldeggplantsoup4.jpg', '한김 식혀준 후 양념 재료를 넣고 조물조물 버무린다.', 4);
insert into processImg(rnum, links, description, iseq) values( 15, 'imageRecipe/coldeggplantsoup5.jpg', '차가워진 냉국에 양념된 가지와 오이, 고추를 넣고 섞는다.', 5);
insert into processImg(rnum, links, description, iseq) values( 16, 'imageRecipe/braisedsausage1.jpg', '소세지는 두툼하게 썰고 청양고추는 송송 썬다.', 1);
insert into processImg(rnum, links, description, iseq) values( 16, 'imageRecipe/braisedsausage2.jpg', '고추장, 굴소스, 고춧가루, 올리고당, 다진마늘, 참기름을 섞어 양념을 만든다', 2);
insert into processImg(rnum, links, description, iseq) values( 16, 'imageRecipe/braisedsausage3.jpg', '팬에 식용유를 두르고 소세지를 앞뒤로 굽는다.', 3);
insert into processImg(rnum, links, description, iseq) values( 16, 'imageRecipe/braisedsausage4.jpg', '양념을 넣고 볶는다.', 4);
insert into processImg(rnum, links, description, iseq) values( 16, 'imageRecipe/braisedsausage5.jpg', '물을 넣어 약한 불로 졸이듯 볶다가 청양고추를 넣고 볶는다.', 5);
insert into processImg(rnum, links, description, iseq) values( 17, 'imageRecipe/mangowatermelon1.jpg', '망고수박은 화채스쿱을 이용해 적당히 파낸다.', 1);
insert into processImg(rnum, links, description, iseq) values( 17, 'imageRecipe/mangowatermelon2.jpg', '남은 속은 숟가락을 이용해 깔끔하게 파낸 후 우유, 연유와 함께 믹서기에 갈아준다.', 2);
insert into processImg(rnum, links, description, iseq) values( 17, 'imageRecipe/mangowatermelon3.jpg', '갈아준 수박을 밀폐용기에 담아 냉동실에 넣고 3시간 이상 얼린다.', 3);
insert into processImg(rnum, links, description, iseq) values( 17, 'imageRecipe/mangowatermelon4.jpg', '수박통에 얼린 수박을 긁어 담고 스쿱으로 파낸 수박, 연유, 장식용 초콜릿을 올려 완성한다.', 4);
insert into processImg(rnum, links, description, iseq) values( 18, 'imageRecipe/vinegargimbap1.jpg', '밥에 단촛물을 넣고 섞어 간 한다.', 1);
insert into processImg(rnum, links, description, iseq) values( 18, 'imageRecipe/vinegargimbap2.jpg', '볼에 겨자소스 재료를 섞은 후 닭가슴살에 넣어 무친다.', 2);
insert into processImg(rnum, links, description, iseq) values( 18, 'imageRecipe/vinegargimbap3.jpg', '오이는 길게 반을 갈라 얇게 어슷썰고 소금을 뿌려 살짝 절인 후 물에 헹궈 물기를 짠다.', 3);
insert into processImg(rnum, links, description, iseq) values( 18, 'imageRecipe/vinegargimbap4.jpg', '김에 밥을 펴 깔고 쌈무, 파프리카, 오이, 닭가슴살을 올려 돌돌 만다.', 4);
insert into processImg(rnum, links, description, iseq) values( 18, 'imageRecipe/vinegargimbap5.jpg', '참기름을 바르고 한 입 크기로 썰어 완성한다.', 5);
insert into processImg(rnum, links, description, iseq) values( 19, 'imageRecipe/cabbagesalad1.jpg', '양배추, 라디치오, 방울토마토, 닭가슴살, 아보카도, 삶은 달걀은 한 입 크기로 썰어 준비해요.', 1);
insert into processImg(rnum, links, description, iseq) values( 19, 'imageRecipe/cabbagesalad2.jpg', '그릇에 준비한 재료를 가지런히 담아요.', 2);
insert into processImg(rnum, links, description, iseq) values( 19, 'imageRecipe/cabbagesalad3.jpg', '플레인 요거트를 재료 위에 뿌려요.', 3);
insert into processImg(rnum, links, description, iseq) values( 19, 'imageRecipe/cabbagesalad4.jpg', '슈레드 치즈를 올려 완성해요.', 4);
insert into processImg(rnum, links, description, iseq) values( 20, 'imageRecipe/tofugimbap1.jpg', '두부는 면보로 물기를 제거한다.', 1);
insert into processImg(rnum, links, description, iseq) values( 20, 'imageRecipe/tofugimbap2.jpg', '물기를 제거한 두부에 간장, 참기름, 깨를 넣고 으깨듯이 섞어 양념을 한다.', 2);
insert into processImg(rnum, links, description, iseq) values( 20, 'imageRecipe/tofugimbap3.jpg', '달걀을 고루 풀어 팬에 지단을 부친다.', 3);
insert into processImg(rnum, links, description, iseq) values( 20, 'imageRecipe/tofugimbap4.jpg', '팬에 기름을 살짝 둘러 양념한 두부를 볶아 수분을 날린다.', 4);
insert into processImg(rnum, links, description, iseq) values( 20, 'imageRecipe/tofugimbap5.jpg', '김>지단>두부>파프리카, 단무지, 우엉을 넣고 돌돌 말아 김밥을 완성한다.', 5);
insert into processImg(rnum, links, description, iseq) values( 21, 'imageRecipe/teumsaerice1.jpg', '대파는 송송 썰고 양파는 굵게 다진다.', 1);
insert into processImg(rnum, links, description, iseq) values( 21, 'imageRecipe/teumsaerice2.jpg', '지퍼백에 면을 넣고 잘게 부신다.', 2);
insert into processImg(rnum, links, description, iseq) values( 21, 'imageRecipe/teumsaerice3.jpg', '끓는 물에 면과 건더기스프를 넣고 익힌 후 물은 자작할 정도로만 남긴다.', 3);
insert into processImg(rnum, links, description, iseq) values( 21, 'imageRecipe/teumsaerice4.jpg', '달군 팬에 올리브유를 두르고 대파, 양파를 볶다가 면, 밥을 넣는다.', 4);
insert into processImg(rnum, links, description, iseq) values( 21, 'imageRecipe/teumsaerice5.jpg', '스프를 넣고 잘 섞으며 볶다가 체다치즈를 올려 완성한다.', 5);
insert into processImg(rnum, links, description, iseq) values( 22, 'imageRecipe/hamburgburrito1.jpg', '파프리카, 양파는 굵게 다진다.', 1);
insert into processImg(rnum, links, description, iseq) values( 22, 'imageRecipe/hamburgburrito2.jpg', '달군 팬에 기름을 넉넉히 두르고 함박스테이크를 구운 후 적당한 크기로 자른다.', 2);
insert into processImg(rnum, links, description, iseq) values( 22, 'imageRecipe/hamburgburrito3.jpg', '다른 팬에 기름을 두르고 양파, 파프리카를 볶다가 밥, 소스, 마요네즈, 후추를 넣고 섞는다.', 3);
insert into processImg(rnum, links, description, iseq) values( 22, 'imageRecipe/hamburgburrito4.jpg', '또띠아에 체다치즈(2장)>볶은 밥>함박스테이크>청상추(2장)>피자치즈(1숟가락)를 올려 돌돌 만다.', 4);
insert into processImg(rnum, links, description, iseq) values( 22, 'imageRecipe/hamburgburrito5.jpg', '마른 팬에 치즈가 녹을 정도로만 구워 완성한다.', 5);
insert into processImg(rnum, links, description, iseq) values( 23, 'imageRecipe/shrimpnut1.jpg', '물에 청주를 넣고 끓으면 새우를 넣어 살짝 데친다.', 1);
insert into processImg(rnum, links, description, iseq) values( 23, 'imageRecipe/shrimpnut2.jpg', '어슷 썬 오이는 소금을 살짝 뿌려 절인 후 물기를 제거한다.', 2);
insert into processImg(rnum, links, description, iseq) values( 23, 'imageRecipe/shrimpnut3.jpg', '밤, 사과는 편 썬다.', 3);
insert into processImg(rnum, links, description, iseq) values( 23, 'imageRecipe/shrimpnut4.jpg', '절구에 잣을 넣고 빻다가 연겨자, 설탕, 소금, 식초, 물을 넣고 섞는다.', 4);
insert into processImg(rnum, links, description, iseq) values( 23, 'imageRecipe/shrimpnut5.jpg', '새우, 오이, 밤, 사과에 잣소스를 넣고 가볍게 무친다.', 5);
insert into processImg(rnum, links, description, iseq) values( 24, 'imageRecipe/beansproutsoup1.jpg', '굴은 소금물에 흔들어 씻어 준비한다.콩나물은 씻어서 준비하고, 무는 0.5cm x 4cm 정도로 나박썰기한다.', 1);
insert into processImg(rnum, links, description, iseq) values( 24, 'imageRecipe/beansproutsoup2.jpg', '대파는 어슷하게 썬다.청양고추, 홍고추는 송송 썬다.', 2);
insert into processImg(rnum, links, description, iseq) values( 24, 'imageRecipe/beansproutsoup3.jpg', '냄비에 멸치다시마육수, 무를 넣고 끓인다. 팔팔 끓으면 콩나물을 넣고 5분 정도 끓인다.', 3);
insert into processImg(rnum, links, description, iseq) values( 24, 'imageRecipe/beansproutsoup4.jpg', '다진마늘, 맛술, 국간장, 새우젓, 후추를 넣는다.', 4);
insert into processImg(rnum, links, description, iseq) values( 24, 'imageRecipe/beansproutsoup5.jpg', '굴, 대파, 청양고추, 홍고추를 넣고 한소끔 더 끓여 완성한다.', 5);
insert into processImg(rnum, links, description, iseq) values( 25, 'imageRecipe/okonomiyaki1.png', '양배추는 채 썰고 애호박은 멀티 필러를 이용해 얇고 길게 채 썰어요.', 1);
insert into processImg(rnum, links, description, iseq) values( 25, 'imageRecipe/okonomiyaki2.png', '쪽파는 송송 썰고 새우와 베이컨은 작게 썰어요.', 2);
insert into processImg(rnum, links, description, iseq) values( 25, 'imageRecipe/okonomiyaki3.png', '부침가루, 물, 달걀 1개를 넣고 섞은 다음 애호박, 양배추, 쪽파,새우,베이컨을 넣고 섞어요.', 3);
insert into processImg(rnum, links, description, iseq) values( 25, 'imageRecipe/okonomiyaki4.jpg', '팬에 식용유를 두르고 반죽을 올려서 앞뒤로 익히고 슬라이스치즈를 올려요.', 4);
insert into processImg(rnum, links, description, iseq) values( 25, 'imageRecipe/okonomiyaki5.jpg', '오코노미야끼 소스, 마요네즈, 가쓰오부시, 쪽파를 올려 완성해요.', 5);
insert into processImg(rnum, links, description, iseq) values( 26, 'imageRecipe/ginkgo1.png', '볼에 마늘을 담고 전자레인지에서 30초 익힌다.', 1);
insert into processImg(rnum, links, description, iseq) values( 26, 'imageRecipe/ginkgo2.png', '팬에 버터를 녹이고 마늘을 약불로 볶는다.', 2);
insert into processImg(rnum, links, description, iseq) values( 26, 'imageRecipe/ginkgo3.png', '마늘이 노릇해지면 은행을 넣고 볶는다.', 3);
insert into processImg(rnum, links, description, iseq) values( 26, 'imageRecipe/ginkgo4.png', '은행이 초록빛을 띄면 소금으로 간한다.', 4);
insert into processImg(rnum, links, description, iseq) values( 26, 'imageRecipe/ginkgo5.png', '노릇하게 볶아 완성한다.', 5);
insert into processImg(rnum, links, description, iseq) values( 27, 'imageRecipe/doenjangnoodle1.png', '끓는물에 소면을 삶아 찬물에 헹궈 물기를 뺀다.', 1);
insert into processImg(rnum, links, description, iseq) values( 27, 'imageRecipe/doenjangnoodle2.png', '깻잎은 돌돌 말아 채썰고 홍고추는 송송 썬다.', 2);
insert into processImg(rnum, links, description, iseq) values( 27, 'imageRecipe/doenjangnoodle3.png', '분량의 양념 재료를 섞어 된장소스를 만든다.', 3);
insert into processImg(rnum, links, description, iseq) values( 27, 'imageRecipe/doenjangnoodle4.png', '삶은 면에 된장소스를 넣고 비빈다.', 4);
insert into processImg(rnum, links, description, iseq) values( 27, 'imageRecipe/doenjangnoodle5.png', '깻잎채, 홍고추, 통깨를 뿌려 완성한다.', 5);
insert into processImg(rnum, links, description, iseq) values( 28, 'imageRecipe/driedseaweed1.jpg', '팬에 들기름, 식용유를 두르고 달군다.', 1);
insert into processImg(rnum, links, description, iseq) values( 28, 'imageRecipe/driedseaweed2.jpg', '기름이 달궈지면 마른 미역을 넣고 튀기듯 볶는다.', 2);
insert into processImg(rnum, links, description, iseq) values( 28, 'imageRecipe/driedseaweed3.jpg', '미역이 바삭해지면 키친타월에 펼친다.', 3);
insert into processImg(rnum, links, description, iseq) values( 28, 'imageRecipe/driedseaweed4.jpg', '튀긴 미역에 설탕, 간 깨를 넣고 가볍게 섞는다.', 4);
insert into processImg(rnum, links, description, iseq) values( 28, 'imageRecipe/driedseaweed5.jpg', '밥 위에 솔솔 뿌려먹으면 이게 바로 밥도둑!', 5);
insert into processImg(rnum, links, description, iseq) values( 29, 'imageRecipe/chinesenoodle1.jpg', '대파는 송송 썰고 홍고추는 반을 갈라 씨를 빼내고 어슷 썰어요.', 1);
insert into processImg(rnum, links, description, iseq) values( 29, 'imageRecipe/chinesenoodle2.jpg', '끓는 물에 중화면을 삶고 찬물에 헹궈요.', 2);
insert into processImg(rnum, links, description, iseq) values( 29, 'imageRecipe/chinesenoodle3.jpg', '식용유를 두른 팬에 대파>양파>양배추, 표고버섯, 다진마늘 순으로 볶아요.', 3);
insert into processImg(rnum, links, description, iseq) values( 29, 'imageRecipe/chinesenoodle4.jpg', '간장, 고춧가루를 넣고 볶은 다음 해물믹스, 새우를 넣고 볶아요. 닭육수, 굴소스, 설탕, 후추를 넣고 볶아요.', 4);
insert into processImg(rnum, links, description, iseq) values( 29, 'imageRecipe/chinesenoodle5.jpg', '면, 청경채, 홍고추를 넣고 볶아요.', 5);
insert into processImg(rnum, links, description, iseq) values( 30, 'imageRecipe/tunaseaweed1.jpg', '미역은 물에 불려 준비한다.', 1);
insert into processImg(rnum, links, description, iseq) values( 30, 'imageRecipe/tunaseaweed2.jpg', '참치통조림은 체에 밭쳐 기름을 빼고 기름은 남겨둔다.', 2);
insert into processImg(rnum, links, description, iseq) values( 30, 'imageRecipe/tunaseaweed3.jpg', '달군 냄비에 참치통조림의 기름, 들기름을 두르고 불린 미역을 볶는다.', 3);
insert into processImg(rnum, links, description, iseq) values( 30, 'imageRecipe/tunaseaweed4.jpg', '국간장을 넣고 볶다가 물을 넣어 끓인다.', 4);
insert into processImg(rnum, links, description, iseq) values( 30, 'imageRecipe/tunaseaweed5.jpg', '물이 끓으면 다진마늘, 참치 통조림을 넣고 끓인다. 액젓으로 간을 맞춰 완성한다.', 5);
insert into processImg(rnum, links, description, iseq) values( 31, 'imageRecipe/ganshao1.jpg', '물에 적신 라이스페이퍼에 삶은 달걀을 올려 감싼다.', 1);
insert into processImg(rnum, links, description, iseq) values( 31, 'imageRecipe/ganshao2.jpg', '팬에 기름을 두르고 달걀을 지진다.', 2);
insert into processImg(rnum, links, description, iseq) values( 31, 'imageRecipe/ganshao3.jpg', '팬에 양념재료를 모두 넣고 살짝 끓인다.', 3);
insert into processImg(rnum, links, description, iseq) values( 31, 'imageRecipe/ganshao4.jpg', '지진 달걀을 넣고 양념을 골고루 버무린다.', 4);
insert into processImg(rnum, links, description, iseq) values( 31, 'imageRecipe/ganshao5.jpg', '체다치즈를 올리고 파슬리가루를 뿌려 완성한다.', 5);
insert into processImg(rnum, links, description, iseq) values( 32, 'imageRecipe/sweetpotato1.jpg', '볼에 밀가루, 우유, 녹인 버터, 소금을 넣고 반죽한다.', 1);
insert into processImg(rnum, links, description, iseq) values( 32, 'imageRecipe/sweetpotato2.jpg', '반죽이 한 덩어리가 되면 손으로 치댄다.', 2);
insert into processImg(rnum, links, description, iseq) values( 32, 'imageRecipe/sweetpotato3.jpg', '볼에 고구마를 으깬 후 마요네즈, 꿀을 넣고 섞는다. 반죽을 밀대로 펼친 후 치즈, 고구마반죽을 올린다.', 3);
insert into processImg(rnum, links, description, iseq) values( 32, 'imageRecipe/sweetpotato4.png', '반죽의 가장자리를 모아서 붙이고 밀대로 펼친다.', 4);
insert into processImg(rnum, links, description, iseq) values( 32, 'imageRecipe/sweetpotato5.jpg', '팬에 버터를 녹인 후 반죽을 앞뒤로 노릇하게 굽는다.', 5);
insert into processImg(rnum, links, description, iseq) values( 33, 'imageRecipe/pollacksandwich1.jpg', '냄비에 우유, 생크림, 동태, 오레가노를 넣고 약불에서 끓여요.', 1);
insert into processImg(rnum, links, description, iseq) values( 33, 'imageRecipe/pollacksandwich2.jpg', '삶은 감자를 으깬 다음 1과 버터를 넣고 다시 으깨요.', 2);
insert into processImg(rnum, links, description, iseq) values( 33, 'imageRecipe/pollacksandwich3.jpg', '소금, 후추를 넣어 간을 맞춰요.', 3);
insert into processImg(rnum, links, description, iseq) values( 33, 'imageRecipe/pollacksandwich4.jpg', '구운 빵 위에 동태감자를 올리고 올리브유를 뿌려요.', 4);
insert into processImg(rnum, links, description, iseq) values( 33, 'imageRecipe/pollacksandwich5.jpg', '샐러드 채소를 올린 다음 그라나파다노 치즈를 갈아 올려서 완성해요.', 5);
insert into processImg(rnum, links, description, iseq) values( 34, 'imageRecipe/tornadocucumber1.jpg', '오이는 꼭지를 잘라낸 다음 바닥에 나무젓가락 대고 대각선으로 칼집 내고, 오이를 반대로 돌려 똑같이 칼집을 내고 먹기 좋은 크기로 썰어요.', 1);
insert into processImg(rnum, links, description, iseq) values( 34, 'imageRecipe/tornadocucumber2.jpg', '소금을 넣고 10분간 절인 다음 물에 헹구고 물기를 제거해요.', 2);
insert into processImg(rnum, links, description, iseq) values( 34, 'imageRecipe/tornadocucumber3.jpg', '양파, 대파는 굵게 다져요.', 3);
insert into processImg(rnum, links, description, iseq) values( 34, 'imageRecipe/tornadocucumber4.jpg', '다진 양파와 대파, 양념 재료를 함께 섞어요.', 4);
insert into processImg(rnum, links, description, iseq) values( 34, 'imageRecipe/tornadocucumber5.jpg', '오이를 넣고 양념과 버무린 다음 통깨를 넣고 무쳐 완성해요.', 5);
insert into processImg(rnum, links, description, iseq) values( 35, 'imageRecipe/chickensteak1.jpg', '달군 팬에 올리브유를 두르고 시금치 숨이 살짝 죽을 정도로 볶는다.', 1);
insert into processImg(rnum, links, description, iseq) values( 35, 'imageRecipe/chickensteak2.jpg', '볼에 시금치, 크림치즈를 넣고 섞는다.', 2);
insert into processImg(rnum, links, description, iseq) values( 35, 'imageRecipe/chickensteak3.jpg', '닭가슴살에 칼집을 낸 후 사이사이 섞은 재료를 넣는다.', 3);
insert into processImg(rnum, links, description, iseq) values( 35, 'imageRecipe/chickensteak4.jpg', '소금, 후추, 슈레드체다치즈, 케이엔페퍼를 뿌린다.', 4);
insert into processImg(rnum, links, description, iseq) values( 35, 'imageRecipe/chickensteak5.jpg', '에어프라이어에 넣고 180도에서 10분, 170도에서 10분 굽는다.', 5);
insert into processImg(rnum, links, description, iseq) values( 36, 'imageRecipe/enoki1.png', '세척한 팽이버섯은 밑동을 자른 후 먹기 좋게 찢는다.', 1);
insert into processImg(rnum, links, description, iseq) values( 36, 'imageRecipe/enoki2.png', '청양고추는 송송 썰고 양파는 다진다.', 2);
insert into processImg(rnum, links, description, iseq) values( 36, 'imageRecipe/enoki3.png', '팬에 간장, 설탕, 물을 1:1:1 비율로 넣고 끓인다.', 3);
insert into processImg(rnum, links, description, iseq) values( 36, 'imageRecipe/enoki4.png', '끓는 간장물에 팽이버섯과 양파, 청양고추를 넣고 끓인다.', 4);
insert into processImg(rnum, links, description, iseq) values( 36, 'imageRecipe/enoki5.png', '국물이 자작할 정도로 졸인다.', 5);
insert into processImg(rnum, links, description, iseq) values( 37, 'imageRecipe/frenchtoast1.png', '통식빵을 적당한 크기의 큐브모양으로 썬다.', 1);
insert into processImg(rnum, links, description, iseq) values( 37, 'imageRecipe/frenchtoast2.png', '계란, 우유, 설탕, 소금, 시나몬파우더를 섞어 체에 한번 내린다.', 2);
insert into processImg(rnum, links, description, iseq) values( 37, 'imageRecipe/frenchtoast3.png', '계란물에 식빵을 넣고 골고루 적신다.', 3);
insert into processImg(rnum, links, description, iseq) values( 37, 'imageRecipe/frenchtoast4.png', '팬에 버터를 녹여 토스트를 노릇하게 굽는다.', 4);
insert into processImg(rnum, links, description, iseq) values( 37, 'imageRecipe/frenchtoast5.png', '좋아하는 과일을 올리고 슈가파우더를 뿌려 완성한다.', 5);

insert into recipeTag(tag_id, rnum, quantity) values(1, 1, '2개');
insert into recipeTag(tag_id, rnum, quantity) values(2, 1, '3스푼');
insert into recipeTag(tag_id, rnum, quantity) values(3, 1, '1/3스푼');
insert into recipeTag(tag_id, rnum, quantity) values(4, 1, '80g');
insert into recipeTag(tag_id, rnum, quantity) values(5, 1, '약간');
insert into recipeTag(tag_id, rnum, quantity) values(6, 1, '약간');
insert into recipeTag(tag_id, rnum, quantity) values(7, 1, '2/3종이컵');
insert into recipeTag(tag_id, rnum, quantity) values(8, 1, '40g');
insert into recipeTag(tag_id, rnum, quantity) values(9, 2, '2개');
insert into recipeTag(tag_id, rnum, quantity) values(10, 2, '1/2개');
insert into recipeTag(tag_id, rnum, quantity) values(8, 2, '1조각');
insert into recipeTag(tag_id, rnum, quantity) values(11, 2, '2종이컵');
insert into recipeTag(tag_id, rnum, quantity) values(12, 2, '1/2종이컵');
insert into recipeTag(tag_id, rnum, quantity) values(13, 2, '1개');
insert into recipeTag(tag_id, rnum, quantity) values(6, 2, '약간');
insert into recipeTag(tag_id, rnum, quantity) values(14, 2, '약간');
insert into recipeTag(tag_id, rnum, quantity) values(15, 2, '1장');
insert into recipeTag(tag_id, rnum, quantity) values(16, 2, '1개');
insert into recipeTag(tag_id, rnum, quantity) values(17, 3, '10g');
insert into recipeTag(tag_id, rnum, quantity) values(18, 3, '1/2모');
insert into recipeTag(tag_id, rnum, quantity) values(19, 3, '1L');
insert into recipeTag(tag_id, rnum, quantity) values(20, 3, '1숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(21, 3, '1숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(22, 3, '1숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(23, 3, '1/2숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(24, 4, '300g');
insert into recipeTag(tag_id, rnum, quantity) values(6, 4, '1/2숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(25, 4, '2줄');
insert into recipeTag(tag_id, rnum, quantity) values(26, 4, '약간');
insert into recipeTag(tag_id, rnum, quantity) values(20, 4, '1.5스푼');
insert into recipeTag(tag_id, rnum, quantity) values(27, 4, '1/2숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(28, 4, '1/3숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(23, 4, '1/2숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(29, 5, '1종이컵');
insert into recipeTag(tag_id, rnum, quantity) values(30, 5, '1종이컵');
insert into recipeTag(tag_id, rnum, quantity) values(31, 5, '30g');
insert into recipeTag(tag_id, rnum, quantity) values(10, 5, '1/3개');
insert into recipeTag(tag_id, rnum, quantity) values(32, 5, '1/4개');
insert into recipeTag(tag_id, rnum, quantity) values(6, 5, '약간');
insert into recipeTag(tag_id, rnum, quantity) values(21, 5, '1숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(11, 5, '4종이컵');
insert into recipeTag(tag_id, rnum, quantity) values(33, 6, '2개');
insert into recipeTag(tag_id, rnum, quantity) values(34, 6, '300ml');
insert into recipeTag(tag_id, rnum, quantity) values(35, 6, '2개');
insert into recipeTag(tag_id, rnum, quantity) values(11, 6, '50ml');
insert into recipeTag(tag_id, rnum, quantity) values(36, 6, '1숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(37, 6, '적당량');
insert into recipeTag(tag_id, rnum, quantity) values(38, 7, '2종이컵');
insert into recipeTag(tag_id, rnum, quantity) values(31, 7, '1줌');
insert into recipeTag(tag_id, rnum, quantity) values(25, 7, '1줌');
insert into recipeTag(tag_id, rnum, quantity) values(23, 7, '1숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(39, 7, '2인분');
insert into recipeTag(tag_id, rnum, quantity) values(40, 7, '2개');
insert into recipeTag(tag_id, rnum, quantity) values(41, 7, '3숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(2, 7, '1숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(42, 8, '100g');
insert into recipeTag(tag_id, rnum, quantity) values(43, 8, '1/3숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(44, 8, '1/2숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(45, 8, '1/2숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(46, 8, '1숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(47, 8, '1숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(48, 9, '2종이컵');
insert into recipeTag(tag_id, rnum, quantity) values(2, 9, '1숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(49, 9, '1/4숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(6, 9, '1/3숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(16, 9, '2개');
insert into recipeTag(tag_id, rnum, quantity) values(7, 9, '180ml');
insert into recipeTag(tag_id, rnum, quantity) values(50, 9, '1종이컵');
insert into recipeTag(tag_id, rnum, quantity) values(51, 10, '6개');
insert into recipeTag(tag_id, rnum, quantity) values(52, 10, '2종이컵');
insert into recipeTag(tag_id, rnum, quantity) values(53, 10, '4개');
insert into recipeTag(tag_id, rnum, quantity) values(54, 10, '1/3대');
insert into recipeTag(tag_id, rnum, quantity) values(22, 10, '1숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(23, 10, '1/3숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(55, 11, '200g');
insert into recipeTag(tag_id, rnum, quantity) values(7, 11, '200g');
insert into recipeTag(tag_id, rnum, quantity) values(56, 11, '6숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(2, 11, '4숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(57, 11, '2숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(58, 12, '2인분');
insert into recipeTag(tag_id, rnum, quantity) values(59, 12, '10줄');
insert into recipeTag(tag_id, rnum, quantity) values(60, 12, '10개');
insert into recipeTag(tag_id, rnum, quantity) values(44, 12, '5알');
insert into recipeTag(tag_id, rnum, quantity) values(61, 12, '1숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(62, 12, '2숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(63, 13, '150g');
insert into recipeTag(tag_id, rnum, quantity) values(10, 13, '1/4개');
insert into recipeTag(tag_id, rnum, quantity) values(32, 13, '1/4개');
insert into recipeTag(tag_id, rnum, quantity) values(44, 13, '6알');
insert into recipeTag(tag_id, rnum, quantity) values(64, 13, '2공기');
insert into recipeTag(tag_id, rnum, quantity) values(61, 13, '1숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(65, 14, '200g');
insert into recipeTag(tag_id, rnum, quantity) values(6, 14, '약간');
insert into recipeTag(tag_id, rnum, quantity) values(26, 14, '통깨');
insert into recipeTag(tag_id, rnum, quantity) values(20, 14, '1숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(28, 14, '1/3숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(66, 15, '2개');
insert into recipeTag(tag_id, rnum, quantity) values(67, 15, '1/2개');
insert into recipeTag(tag_id, rnum, quantity) values(68, 15, '1개');
insert into recipeTag(tag_id, rnum, quantity) values(69, 15, '1개');
insert into recipeTag(tag_id, rnum, quantity) values(11, 15, '600ml');
insert into recipeTag(tag_id, rnum, quantity) values(6, 15, '1/3숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(70, 16, '300g');
insert into recipeTag(tag_id, rnum, quantity) values(68, 16, '1개');
insert into recipeTag(tag_id, rnum, quantity) values(11, 16, '1종이컵');
insert into recipeTag(tag_id, rnum, quantity) values(71, 16, '적당량');
insert into recipeTag(tag_id, rnum, quantity) values(43, 16, '1숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(72, 17, '1/2통');
insert into recipeTag(tag_id, rnum, quantity) values(7, 17, '1종이컵');
insert into recipeTag(tag_id, rnum, quantity) values(73, 17, '90g');
insert into recipeTag(tag_id, rnum, quantity) values(74, 17, '약간');
insert into recipeTag(tag_id, rnum, quantity) values(75, 18, '2장');
insert into recipeTag(tag_id, rnum, quantity) values(76, 18, '1+1/2공기');
insert into recipeTag(tag_id, rnum, quantity) values(77, 18, '1캔');
insert into recipeTag(tag_id, rnum, quantity) values(78, 18, '10장');
insert into recipeTag(tag_id, rnum, quantity) values(79, 18, '1/2개');
insert into recipeTag(tag_id, rnum, quantity) values(21, 18, '약간');
insert into recipeTag(tag_id, rnum, quantity) values(80, 19, '1/6개');
insert into recipeTag(tag_id, rnum, quantity) values(81, 19, '1/4개');
insert into recipeTag(tag_id, rnum, quantity) values(82, 19, '6개');
insert into recipeTag(tag_id, rnum, quantity) values(83, 19, '1개');
insert into recipeTag(tag_id, rnum, quantity) values(84, 19, '1/2종이컵');
insert into recipeTag(tag_id, rnum, quantity) values(85, 19, '1/2개');
insert into recipeTag(tag_id, rnum, quantity) values(75, 20, '2장');
insert into recipeTag(tag_id, rnum, quantity) values(18, 20, '2모');
insert into recipeTag(tag_id, rnum, quantity) values(79, 20, '1/2개');
insert into recipeTag(tag_id, rnum, quantity) values(16, 20, '3개');
insert into recipeTag(tag_id, rnum, quantity) values(86, 20, '2줄');
insert into recipeTag(tag_id, rnum, quantity) values(87, 20, '4줄');
insert into recipeTag(tag_id, rnum, quantity) values(88, 21, '1개');
insert into recipeTag(tag_id, rnum, quantity) values(89, 21, '1개');
insert into recipeTag(tag_id, rnum, quantity) values(64, 21, '1+1/2공기');
insert into recipeTag(tag_id, rnum, quantity) values(10, 21, '1/6개');
insert into recipeTag(tag_id, rnum, quantity) values(54, 21, '1/2대');
insert into recipeTag(tag_id, rnum, quantity) values(90, 21, '2장');
insert into recipeTag(tag_id, rnum, quantity) values(92, 22, '2장');
insert into recipeTag(tag_id, rnum, quantity) values(93, 22, '2개');
insert into recipeTag(tag_id, rnum, quantity) values(94, 22, '2개');
insert into recipeTag(tag_id, rnum, quantity) values(46, 22, '2숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(64, 22, '1+1/2공기');
insert into recipeTag(tag_id, rnum, quantity) values(79, 22, '1/4개');
insert into recipeTag(tag_id, rnum, quantity) values(95, 23, '14마리');
insert into recipeTag(tag_id, rnum, quantity) values(67, 23, '1/2개');
insert into recipeTag(tag_id, rnum, quantity) values(96, 23, '4알');
insert into recipeTag(tag_id, rnum, quantity) values(97, 23, '1/4개');
insert into recipeTag(tag_id, rnum, quantity) values(98, 23, '1숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(99, 23, '1/2종이컵');
insert into recipeTag(tag_id, rnum, quantity) values(100, 23, '1/2숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(101, 24, '200g');
insert into recipeTag(tag_id, rnum, quantity) values(102, 24, '150g');
insert into recipeTag(tag_id, rnum, quantity) values(103, 24, '100g');
insert into recipeTag(tag_id, rnum, quantity) values(54, 24, '1/2대');
insert into recipeTag(tag_id, rnum, quantity) values(68, 24, '1개');
insert into recipeTag(tag_id, rnum, quantity) values(104, 25, '2/3개');
insert into recipeTag(tag_id, rnum, quantity) values(80, 25, '약간');
insert into recipeTag(tag_id, rnum, quantity) values(105, 25, '6마리');
insert into recipeTag(tag_id, rnum, quantity) values(106, 25, '2줄');
insert into recipeTag(tag_id, rnum, quantity) values(107, 25, '2장');
insert into recipeTag(tag_id, rnum, quantity) values(108, 25, '1종이컵');
insert into recipeTag(tag_id, rnum, quantity) values(109, 26, '1종이컵');
insert into recipeTag(tag_id, rnum, quantity) values(44, 26, '15알');
insert into recipeTag(tag_id, rnum, quantity) values(8, 26, '1/2숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(6, 26, '약간');
insert into recipeTag(tag_id, rnum, quantity) values(110, 27, '1인분');
insert into recipeTag(tag_id, rnum, quantity) values(111, 27, '2장');
insert into recipeTag(tag_id, rnum, quantity) values(26, 27, '살짝');
insert into recipeTag(tag_id, rnum, quantity) values(6, 27, '1개');
insert into recipeTag(tag_id, rnum, quantity) values(20, 27, '1숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(43, 27, '1/2숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(112, 28, '40g');
insert into recipeTag(tag_id, rnum, quantity) values(113, 28, '2숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(71, 28, '2숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(2, 28, '1숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(114, 28, '1숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(115, 29, '1인분');
insert into recipeTag(tag_id, rnum, quantity) values(116, 29, '1줌');
insert into recipeTag(tag_id, rnum, quantity) values(105, 29, '4마리');
insert into recipeTag(tag_id, rnum, quantity) values(80, 29, '1/8통');
insert into recipeTag(tag_id, rnum, quantity) values(65, 29, '2개');
insert into recipeTag(tag_id, rnum, quantity) values(54, 29, '1/2줄');
insert into recipeTag(tag_id, rnum, quantity) values(17, 30, '10g');
insert into recipeTag(tag_id, rnum, quantity) values(117, 30, '1캔');
insert into recipeTag(tag_id, rnum, quantity) values(23, 30, '1숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(22, 30, '1숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(11, 30, '6종이컵');
insert into recipeTag(tag_id, rnum, quantity) values(16, 31, '6개');
insert into recipeTag(tag_id, rnum, quantity) values(118, 31, '6장');
insert into recipeTag(tag_id, rnum, quantity) values(90, 31, '1+1/2');
insert into recipeTag(tag_id, rnum, quantity) values(119, 31, '약간');
insert into recipeTag(tag_id, rnum, quantity) values(71, 31, '약간');
insert into recipeTag(tag_id, rnum, quantity) values(120, 32, '200g');
insert into recipeTag(tag_id, rnum, quantity) values(46, 32, '2숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(121, 32, '1숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(122, 32, '120g');
insert into recipeTag(tag_id, rnum, quantity) values(8, 32, '2숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(123, 32, '100g');
insert into recipeTag(tag_id, rnum, quantity) values(7, 32, '1/3종이컵');
insert into recipeTag(tag_id, rnum, quantity) values(9, 33, '3개');
insert into recipeTag(tag_id, rnum, quantity) values(124, 33, '200g');
insert into recipeTag(tag_id, rnum, quantity) values(125, 33, '1T');
insert into recipeTag(tag_id, rnum, quantity) values(12, 33, '70ml');
insert into recipeTag(tag_id, rnum, quantity) values(7, 33, '90ml');
insert into recipeTag(tag_id, rnum, quantity) values(67, 34, '2개');
insert into recipeTag(tag_id, rnum, quantity) values(6, 34, '2/3숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(10, 34, '1/6개');
insert into recipeTag(tag_id, rnum, quantity) values(54, 34, '1/4줄기');
insert into recipeTag(tag_id, rnum, quantity) values(26, 34, '약간');
insert into recipeTag(tag_id, rnum, quantity) values(83, 35, '2덩이');
insert into recipeTag(tag_id, rnum, quantity) values(126, 35, '1/2단');
insert into recipeTag(tag_id, rnum, quantity) values(55, 35, '50g');
insert into recipeTag(tag_id, rnum, quantity) values(90, 35, '2숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(127, 35, '약간');
insert into recipeTag(tag_id, rnum, quantity) values(128, 36, '600g');
insert into recipeTag(tag_id, rnum, quantity) values(10, 36, '1/2개');
insert into recipeTag(tag_id, rnum, quantity) values(68, 36, '2개');
insert into recipeTag(tag_id, rnum, quantity) values(61, 36, '2/3종이컵');
insert into recipeTag(tag_id, rnum, quantity) values(2, 36, '2/3종이컵');
insert into recipeTag(tag_id, rnum, quantity) values(11, 36, '2/3종이컵');
insert into recipeTag(tag_id, rnum, quantity) values(129, 37, '1개');
insert into recipeTag(tag_id, rnum, quantity) values(7, 37, '1종이컵');
insert into recipeTag(tag_id, rnum, quantity) values(16, 37, '3개');
insert into recipeTag(tag_id, rnum, quantity) values(2, 37, '1숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(130, 37, '1/2숟가락');
insert into recipeTag(tag_id, rnum, quantity) values(6, 37, '1꼬집');
insert into recipeTag(tag_id, rnum, quantity) values(131, 37, '약간');


-- recipe_page 테이블 샘플
insert into recipe_page(rnum) values(1);
insert into recipe_page(rnum) values(2);
insert into recipe_page(rnum) values(3);
insert into recipe_page(rnum) values(4);
insert into recipe_page(rnum) values(5);
insert into recipe_page(rnum) values(6);
insert into recipe_page(rnum) values(7);
insert into recipe_page(rnum, likes, favorites) values(8, 22, 1);
insert into recipe_page(rnum) values(9);
insert into recipe_page(rnum) values(10);
insert into recipe_page(rnum, likes, favorites) values(11, 30, 5);
insert into recipe_page(rnum) values(12);
insert into recipe_page(rnum) values(13);
insert into recipe_page(rnum) values(14);
insert into recipe_page(rnum) values(15);
insert into recipe_page(rnum) values(16);
insert into recipe_page(rnum) values(17 );
insert into recipe_page(rnum) values(18);
insert into recipe_page(rnum) values(19);
insert into recipe_page(rnum, likes, favorites) values(20, 50, 11);
insert into recipe_page(rnum) values(21);
insert into recipe_page(rnum) values(22);
insert into recipe_page(rnum) values(23);
insert into recipe_page(rnum) values(24);
insert into recipe_page(rnum) values(25);
insert into recipe_page(rnum, likes, favorites) values(26, 150, 20);
insert into recipe_page(rnum) values(27);
insert into recipe_page(rnum) values(28);
insert into recipe_page(rnum) values(29);
insert into recipe_page(rnum) values(30);
insert into recipe_page(rnum) values(31);
insert into recipe_page(rnum) values(32);
insert into recipe_page(rnum) values(33);
insert into recipe_page(rnum, likes, favorites) values(34, 10, 1);
insert into recipe_page(rnum, likes, favorites) values(35, 12, 2);
insert into recipe_page(rnum, likes, favorites) values(36, 8, 3);
insert into recipe_page(rnum, likes, favorites) values(37, 100, 12);