-- <데이터베이스 작업> : 필요한 사람들만 실행

-- recipe_report, recipebanner 테이블 생성(final_table.sql에도 추가했습니다.)
CREATE TABLE recipe_report
(
	reportseq number(5) NOT NULL,
	id varchar2(50) NOT NULL,
	rnum number(20) NOT NULL,
	reportyn char(1) DEFAULT 'Y',
	PRIMARY KEY (reportseq)
);


create table recipebanner(
    bseq number(5) primary key,
    name varchar2(100),
    order_seq number(1),
    image varchar2(50),
    useyn char(1) default 'y',
    indate date default sysdate
);

create sequence report_seq increment by 1 start with 1;
create sequence tt_banner_seq start with 1;

ALTER TABLE recipe_report
	ADD FOREIGN KEY (rnum)
	REFERENCES recipe (rnum)
	ON DELETE CASCADE
;

ALTER TABLE recipe_report
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
	ON DELETE CASCADE
;

-- members 테이블에 address3이 없다면
alter table members add address3 varchar2(100);

-- recipe와 관련한 외래키 삭제 => 다시 생성
-- ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건명 (** 개인별로 제약조건명 다르니 조회 후 이름 변경)
ALTER TABLE favorite DROP CONSTRAINT SYS_C007397;
ALTER TABLE interest DROP CONSTRAINT SYS_C007398;
ALTER TABLE processImg DROP CONSTRAINT SYS_C007399;
ALTER TABLE recipeTag DROP CONSTRAINT SYS_C007400;
ALTER TABLE reply DROP CONSTRAINT SYS_C007402;
ALTER TABLE recipe_page DROP CONSTRAINT SYS_C007401;

-- 외래키 재생성 

ALTER TABLE favorite
	ADD FOREIGN KEY (rnum)
	REFERENCES recipe (rnum)
	ON DELETE CASCADE
;
ALTER TABLE interest
	ADD FOREIGN KEY (rnum)
	REFERENCES recipe (rnum)
	ON DELETE CASCADE
;
ALTER TABLE processImg
	ADD FOREIGN KEY (rnum)
	REFERENCES recipe (rnum)
	ON DELETE CASCADE
;
ALTER TABLE recipeTag
	ADD FOREIGN KEY (rnum)
	REFERENCES recipe (rnum)
	ON DELETE CASCADE
;
ALTER TABLE recipe_page
	ADD FOREIGN KEY (rnum)
	REFERENCES recipe (rnum)
	ON DELETE CASCADE
;
ALTER TABLE reply
	ADD FOREIGN KEY (rnum)
	REFERENCES recipe (rnum)
	ON DELETE CASCADE
;


-- ing_view 뷰 생성(재료 불러올 때 필요)
CREATE OR REPLACE VIEW ing_view 
AS
SELECT r.rnum, r.tag_id, i.tag, r.quantity FROM recipeTag r, ingTag i where r.tag_id=i.tag_id;
select * from ing_view;

-- favorite 필드가 없다면
alter table recipe_page add favorites number(10) default 0;
-- 위 명령 실행한 후 final_view.sql에서 view 생성 

-- 배너리스트를 가져오는 프로시져입니다.
CREATE OR REPLACE PROCEDURE getRecipeBannerList(
    p_cur OUT   SYS_REFCURSOR
)
IS
BEGIN
    open p_cur for
        select * from recipebanner order by useyn desc, order_seq asc;
END;

-- 사용 X
create or replace procedure recipeCategory(
    p_recipekey IN varchar,
    p_cur OUT SYS_REFCURSOR
)
is 
begin
    if p_recipekey='recipe' then
        open p_cur FOR select * from recipe_page_view;
    elsif p_recipekey='type' then
        open p_cur FOR select * from type_page_view;
    elsif p_recipekey='theme' then
        open p_cur FOR select * from theme_page_view;
    elsif p_recipekey='ing' then
        open p_cur FOR select * from ing_page_view;
    end if;

end;

-- 레시피 카테고리 

create or replace procedure getCategory(
    p_recipekey IN varchar,
    p_cur OUT SYS_REFCURSOR,
    p_startNum IN NUMBER,
    p_endNum IN NUMBER,
    p_kind IN NUMBER
)
is
begin
    if p_recipekey='recipe' then
        open p_cur FOR 
        select * from (select * from (select rownum as rn, r.* from ((select * from recipe_page_view) r)) where rn>=p_startNum) where rn<=p_endNum;
    elsif p_recipekey='type' then
        open p_cur FOR 
        select * from (select * from (select rownum as rn, t.* from ((select * from type_page_view where type=p_kind) t)) where rn>=p_startNum) where rn<=p_endNum;
    elsif p_recipekey='theme' then
        open p_cur FOR 
        select * from (select * from (select rownum as rn, h.* from ((select * from theme_page_view where theme=p_kind) h)) where rn>=p_startNum) where rn<=p_endNum;
    elsif p_recipekey='ing' then
        open p_cur FOR 
        select * from (select * from (select rownum as rn, i.* from ((select * from ing_page_view where ing=p_kind) i)) where rn>=p_startNum) where rn<=p_endNum;
    end if;

end;

-- 레시피 count
create or replace procedure getRecipeCounts(
    p_recipekey IN varchar,
    p_kind IN NUMBER,
    p_cnt OUT NUMBER
)
is 
begin
    if p_recipekey='recipe' then
         select count(*) into p_cnt from recipe_page_view;
    elsif p_recipekey='type' then
         select count(*) into p_cnt from type_page_view where type=p_kind;
    elsif p_recipekey='theme' then
         select count(*) into p_cnt from theme_page_view where theme=p_kind;
    elsif p_recipekey='ing' then
         select count(*) into p_cnt from ing_page_view where ing=p_kind;
    elsif p_recipekey='favorite' then -- favorite에서는 kind값 안 들어오는 것 고려
        select count(*) into p_cnt from recipe_page_view where favorites>0;
    elsif p_recipekey='adminRec' then 
        select count(*) into p_cnt from recipe_page_view where rec>0;
    end if;

end;

-- 레시피 조회수 증가
create or replace PROCEDURE addRecipeView(
    p_rnum IN recipe.rnum%TYPE
)
IS
BEGIN
    update recipe_page set views=views+1 where rnum=p_rnum;
    commit;
END;

-- 관리자 추천 리스트/단골 상위 리스트 조회
create or replace PROCEDURE recipeFavoriteAndRec(
    p_cur OUT   SYS_REFCURSOR,
    p_startNum IN NUMBER,
    p_endNum IN NUMBER,
    p_kind IN NUMBER
)
IS
BEGIN
    IF p_kind=1 THEN
        OPEN p_cur FOR
        select * from (select * from (select rownum as rn, r.* from ((select * from recipe_page_view where rec>0 order by rnum desc) r)) where rn>=p_startNum) where rn<=p_endNum;
    ELSE 
        OPEN p_cur FOR
        select * from (select * from (select rownum as rn, f.* from ((select * from recipe_page_view where favorites>0 order by favorites desc) f)) where rn>=p_startNum) where rn<=p_endNum;
    END IF;       
END;

-- 레시피 가져오기
create or replace PROCEDURE getRecipe(
    p_rnum IN recipe.rnum%TYPE,
    p_cur1 OUT SYS_REFCURSOR,
    p_cur2 OUT SYS_REFCURSOR,
    p_cur3 OUT SYS_REFCURSOR,
    p_cur4 OUT SYS_REFCURSOR,
    p_cur5 OUT SYS_REFCURSOR,
    p_likeyn OUT VARCHAR,
    p_reportyn OUT VARCHAR,
    p_id IN recipe.id%TYPE
)
IS  
    v_likeyn VARCHAR(1);
    v_reportyn VARCHAR(1);
BEGIN
    OPEN p_cur1 FOR 
        select * from recipe_page_view where rnum=p_rnum;
    OPEN p_cur2 FOR
        -- select tag from ing_view where rnum=p_rnum;
        select * from (select rownum as rn, t.* from ((select tag from ing_view where rnum=p_rnum) t)) order by rn;
    OPEN p_cur3 FOR
        -- select quantity from recipeTag where rnum=p_rnum;
        select * from (select rownum as rn, q.* from ((select quantity from recipeTag where rnum=p_rnum) q)) order by rn;
    OPEN p_cur4 FOR
        select * from processImg where rnum=p_rnum order by iseq;
    OPEN p_cur5 FOR
        select * from reply where rnum=p_rnum;
    BEGIN
        select likeyn into v_likeyn from interest where rnum=p_rnum and id=p_id;
        EXCEPTION WHEN NO_DATA_FOUND then v_likeyn := 'N'; 
    END;
    p_likeyn := v_likeyn;
    BEGIN
        select reportyn into v_reportyn from recipe_report where rnum=p_rnum and id=p_id;
       EXCEPTION WHEN NO_DATA_FOUND then v_reportyn := 'N';
    END;
    p_reportyn := v_reportyn;
END;

-- getRecipeForUpdate
create or replace PROCEDURE getRecipeForUpdate(
    p_rnum IN recipe.rnum%TYPE,
    p_cur1 OUT SYS_REFCURSOR,
    p_cur2 OUT SYS_REFCURSOR,
    p_cur3 OUT SYS_REFCURSOR,
    p_cur4 OUT SYS_REFCURSOR
)
IS  
BEGIN
    OPEN p_cur1 FOR 
        select * from recipe_page_view where rnum=p_rnum;
    OPEN p_cur2 FOR
        -- select tag from ing_view where rnum=p_rnum;
        select * from (select rownum as rn, t.* from ((select tag from ing_view where rnum=p_rnum) t)) order by rn;
    OPEN p_cur3 FOR
        -- select quantity from recipeTag where rnum=p_rnum;
        select * from (select rownum as rn, q.* from ((select quantity from recipeTag where rnum=p_rnum) q)) order by rn;
    OPEN p_cur4 FOR
        select * from processImg where rnum=p_rnum order by iseq;
END;

-- 레시피 삭제
create or replace PROCEDURE deleteRecipe(
    p_rnum IN recipe.rnum%TYPE
)
IS
BEGIN
    delete from recipe where rnum=p_rnum;
END;

-- 댓글 작성
create or replace PROCEDURE addReply(
    p_id recipe.id%TYPE,
    p_rnum recipe.rnum%TYPE,
    p_reply reply.content%TYPE
)
IS
BEGIN
    insert into reply(replyseq, id, rnum, content) values(reply_seq.nextVal, p_id, p_rnum, p_reply);
    commit;
END;

-- 레시피 삽입
create or replace PROCEDURE insertRecipe(
    p_id IN recipe.id%TYPE,
    p_subject IN recipe.subject%TYPE,
    p_content IN recipe.content%TYPE,
    p_thumbnail IN recipe.thumbnail%TYPE,
    p_cookingtime IN recipe.time%TYPE,
    p_type IN recipe.type%TYPE,
    p_theme IN recipe.theme%TYPE,
    p_ing IN recipe_page.ing%TYPE,
    rnum OUT recipe.rnum%TYPE
)
IS
    max_rnum recipe.rnum%TYPE;
BEGIN
    insert into recipe(rnum, id, subject, content, thumbnail, time, type, theme) 
    values(recipe_seq.nextVal, p_id, p_subject, p_content, p_thumbnail, p_cookingtime, p_type, p_theme);
    -- insert into recipe_page(ing) values(p_ing);  -- 또는 recipe 테이블에 ing 필드 추가
    commit;
    select max(rnum) into max_rnum from recipe;
    rnum := max_rnum;
    insert into recipe_page(rnum, ing) values(max_rnum, p_ing);
    commit;

    EXCEPTION WHEN OTHERS THEN
    ROLLBACK;
END;

-- 레시피 과정 삽입
create or replace PROCEDURE insertProcess(
    p_rnum IN processImg.rnum%TYPE,
    p_iseq IN processImg.iseq%TYPE,
    p_links IN processImg.links%TYPE,
    p_description IN processImg.description%TYPE
)
IS
BEGIN
    insert into processImg(rnum, iseq, links, description) values(p_rnum, p_iseq, p_links, p_description);
    commit;
END;

-- tag 수 리턴(ingTag 테이블에 기존 태그가 존재하는지 확인하는 과정)
create or replace PROCEDURE getTagCnt(
     p_tag IN ingTag.tag%TYPE,
     p_cnt OUT NUMBER
)
IS
    v_cnt NUMBER;
BEGIN
     select count(*) into v_cnt from ingTag where tag=p_tag;
     p_cnt := v_cnt;
END;

-- 재료 태그 삽입
create or replace PROCEDURE insertTag(
     p_tag IN ingTag.tag%TYPE,
    p_rnum IN recipeTag.rnum%TYPE,
     p_qty IN recipeTag.quantity%TYPE
)
IS
    lastTagId ingTag.tag_id%TYPE;
BEGIN
    insert into ingTag(tag_id, tag) values(ingTag_seq.nextVal, p_tag);
    select max(tag_id) into lastTagId from ingTag;
    insert into recipeTag(rnum, tag_id, quantity) values(p_rnum, lastTagId, p_qty); 
    commit;

    EXCEPTION WHEN OTHERS THEN
    ROLLBACK;
END;

-- recipeTag만 삽입(ingTag에 기존 태그가 존재하는 경우)
create or replace PROCEDURE insertRecipeTag(
    p_tag IN ingTag.tag%TYPE,
    p_rnum IN recipeTag.rnum%TYPE,
     p_qty IN recipeTag.quantity%TYPE
)
IS
    lastTagId ingTag.tag_id%TYPE;
BEGIN
    select tag_id into lastTagId from ingTag where tag=p_tag;
    insert into recipeTag(rnum, tag_id, quantity) values(p_rnum, lastTagId, p_qty);
    commit;
END;

-- 레시피 수정
create or replace PROCEDURE updateRecipe(
    p_subject IN recipe.subject%TYPE, 
    p_content IN recipe.content%TYPE,
    p_thumbnail IN recipe.thumbnail%TYPE,
    p_time IN recipe.time%TYPE,
    p_type IN recipe.type%TYPE,
    p_theme IN recipe.theme%TYPE,
    p_rnum IN recipe.rnum%TYPE
)
IS
BEGIN
    update recipe set subject=p_subject, content=p_content, thumbnail=p_thumbnail, time=p_time, type=p_type, theme=p_theme where rnum=p_rnum;
    commit;
END;

-- 레시피 수정을 위해 기존 레시피의 재료, 과정 삭제
create or replace PROCEDURE deleteProcess(
     p_rnum IN recipe.rnum%TYPE
)
IS
BEGIN
    delete from recipeTag where rnum=p_rnum;
    delete from processImg where rnum=p_rnum;
    commit;

    EXCEPTION WHEN OTHERS THEN
    ROLLBACK;
END;

-- 검색한 결과의 수 리턴
create or replace PROCEDURE getCountsByKey(
    p_table IN NUMBER,
    p_key IN VARCHAR2,
    p_cnt OUT NUMBER
)
IS
     v_cnt NUMBER;
BEGIN
    IF p_table = 1 THEN
        SELECT COUNT(*) INTO v_cnt FROM ingTag i, recipeTag r WHERE i.tag_id = r.tag_id and i.tag LIKE '%'||p_key||'%';
    ELSIF  p_table = 2 THEN
        SELECT COUNT(*) INTO v_cnt FROM recipe WHERE subject LIKE '%'||p_key||'%';
    ELSIF  p_table = 3 THEN
        SELECT COUNT(*) INTO v_cnt FROM recipe WHERE content LIKE '%'||p_key||'%';
    END IF;
    p_cnt := v_cnt;
END;

-- 검색 결과 리스트 리턴
create or replace PROCEDURE selectListByKey(
    p_table IN NUMBER,
    p_key IN recipe.content%TYPE,
    p_startNum IN NUMBER,
    p_endNum IN NUMBER,
    p_rc OUT SYS_REFCURSOR
)
IS
    v_cursor1 SYS_REFCURSOR;
    v_cursor2 SYS_REFCURSOR;
    v_cursor3 SYS_REFCURSOR;
BEGIN
    IF p_table = 1 THEN
        OPEN v_cursor1 FOR
        select * from (
			select * from (
				select rownum as rn, r.* from (
                    (select distinct t.rnum, v.id, v.subject, v.thumbnail, v.nick, v.img, v.likes, v.views, v.time 
                from recipeTag t, recipe_page_view v, ingTag i 
            where t.rnum = v.rnum and t.tag_id = i.tag_id and i.tag like '%'||p_key||'%' ) r ) 
         ) where rn >=p_startNum 
		) where rn <= p_endNum ;
        p_rc := v_cursor1;
    ELSIF  p_table = 2 THEN
        OPEN v_cursor2 FOR
        select * from (
			select * from (
                select rownum as rn, r.* from (
                    (select distinct rnum, id, subject, thumbnail, nick, img, likes, views, time 
                from recipe_page_view
            where subject like '%'||p_key||'%' ) r ) 
         ) where rn >=p_startNum
        ) where rn <=p_endNum ;
         p_rc := v_cursor2;
    ELSIF  p_table = 3 THEN
        OPEN v_cursor3 FOR
        select * from (
			select * from (
                select rownum as rn, r.* from (
                    (select distinct rnum, id, subject, thumbnail, nick, img, likes, views, time 
                from recipe_page_view
            where content like '%'||p_key||'%' ) r ) 
         ) where rn >=p_startNum
        ) where rn <=p_endNum ;
         p_rc := v_cursor3;
    END IF;
END;

-- 레시피마다 달린 댓글 수 리턴
create or replace PROCEDURE getReplyCount(
    p_rnum IN recipe.rnum%TYPE,
    p_replycnt OUT NUMBER
)
IS
    v_cnt NUMBER;
BEGIN
    select count(*) into v_cnt from reply where rnum = p_rnum;
    p_replycnt := v_cnt;
END;

-- 레시피 좋아요(관심리스트 등록)
create or replace PROCEDURE likeRecipe(
    p_id IN recipe.id%TYPE,
    p_rnum IN recipe.rnum%TYPE
)
IS
	v_idcount NUMBER;
	v_yn varchar2(10);
	v_likecount NUMBER;
BEGIN
    -- 누른적이 있는지 없는지 검사합니다. 눌렀다면 1 이상의 값이 v_idcount 에 삽입될 것이고 누르지 않았다면 v_idcount는 0입니다.
	select count(rownum) into v_idcount from interest where rnum = p_rnum and id =p_id;

    if v_idcount>0 then
        select likeyn into v_yn from interest where id=p_id and rnum=p_rnum;
        if v_yn='Y' then
            update interest set likeyn='N' where id = p_id and rnum=p_rnum;
            commit;
        elsif v_yn='N' then
            update interest set likeyn='Y' where id = p_id and rnum=p_rnum;
            commit;
        end if;
    elsif v_idcount=0 then 
        insert into interest (interestnum, rnum , id, likeyn) values( interestnum_seq.nextVal, p_rnum, p_id, 'Y');
        insert into favorite (fnum, rnum, id, fuseyn) values( fnum_seq.nextVal, p_rnum, p_id, 'N');
        commit;
    end if;

	-- 위의 과정까지 종료되었다면, 고유한 interestNum, favoriteNum을 가진 행이 삽입되어 Y또는 N값을 가지게 되었습니다.
	-- 이젠 다시 카운트해서 recipe_page의 값을 업데이트 해줍니다.
	select count(*) into v_likecount from interest where rnum = p_rnum and likeyn='Y';
	update recipe_page set likes = v_likecount where rnum = p_rnum;
    commit;
END;

-- 레시피 신고
create or replace PROCEDURE reportRecipe(
    p_id IN recipe.id%TYPE,
    p_rnum IN recipe.rnum%TYPE
)
IS
	v_idcount NUMBER;
	v_yn varchar2(10);
	v_reportcount NUMBER;
BEGIN
    -- 로그인한 "아이디"로 "해당 고유한 게시물(rnum)"에 누른적이 있는지 없는지 검사합니다. 
    -- 눌렀다면 1 이상의 값이 v_idcount 에 삽입될 것이고 누르지 않았다면 v_idcount는 0입니다.
	select count(rownum) into v_idcount from recipe_report where rnum = p_rnum and id =p_id;

    if v_idcount>0 then
        select reportyn into v_yn from recipe_report where id=p_id and rnum=p_rnum;
        if v_yn='Y' then
            update recipe_report set reportyn='N' where id = p_id and rnum=p_rnum;
            commit;
        elsif v_yn='N' then
            update recipe_report set reportyn='Y' where id = p_id and rnum=p_rnum;
            commit;
        end if;
    elsif v_idcount=0 then 
        insert into recipe_report (reportseq, rnum , id, reportyn) values( report_seq.nextVal, p_rnum, p_id, 'Y');
        commit;
    end if;

	-- 위의 과정까지 종료되었다면, 고유한 reportseq을 가진 행이 삽입되어 Y또는 N값을 가지게 되었습니다.
	-- 이젠 다시 카운트해서 recipe_page의 report 값을 업데이트 해줍니다.
	select count(*) into v_reportcount from recipe_report where rnum = p_rnum and reportyn='Y';
	update recipe_page set report = v_reportcount where rnum = p_rnum;
    commit;
END;

-- 아이디 찾기
create or replace PROCEDURE findId(
    p_name IN members.name%TYPE,
    p_phone IN members.phone%TYPE,
    p_rc OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN p_rc FOR
    select * from members where name=p_name and phone=p_phone;
END;

-- 인증 후 비밀번호 변경
create or replace PROCEDURE updatePwd(
    p_id IN members.id%TYPE,
    p_pwd IN members.pwd%TYPE,
    p_result OUT NUMBER
)
IS
BEGIN
    p_result := 1;
    update members set pwd=p_pwd where id=p_id;
    commit;

    EXCEPTION WHEN OTHERS THEN
    p_result := 0;
END;

