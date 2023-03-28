-- final_table 에도 수정해뒀지만 recipe_report 관련 코드만 따로 복붙해왔습니다

--# 레시피 리포트 삭제 및 시퀀스 삭제 생성, 테이블 생성 코드
DROP TABLE recipe_report CASCADE CONSTRAINTS;

drop sequence report_seq;

select report_seq.nextVal from dual;

create sequence report_seq increment by 1 start with 1;

CREATE TABLE recipe_report
(
	reportseq number(5) NOT NULL,
	id varchar2(50) NOT NULL,
	rnum number(20) NOT NULL,
	reportyn char(1) DEFAULT 'Y',
	PRIMARY KEY (reportseq)
);

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


-- 레시피 배너 테이블 추가 구문입니다.
create table recipebanner(
    bseq number(5) primary key,
    name varchar2(100),
    order_seq number(1),
    image varchar2(50),
    useyn char(1) default 'y',
    indate date default sysdate
);


create sequence tt_banner_seq start with 1;



--# 모든 레시피 뷰를 가져오는 태그(recipeCategory 와 통합)
create or replace procedure getAllRecipe(
    p_cur OUT SYS_REFCURSOR
)
is 
begin
    open p_cur FOR
        select * from recipe_page_view;
end;


create or replace procedure getTypeRecipe(	-- 안쓰는데 일단 냅둡니다
    p_cur OUT SYS_REFCURSOR
)
is 
begin
    open p_cur FOR
        select * from type_page_view;
end;


-- 배너리스트를 가져오는 프로시져입니다.
CREATE OR REPLACE PROCEDURE getRecipeBannerList(
    p_cur OUT   SYS_REFCURSOR
)
IS
BEGIN
    open p_cur for
        select * from recipebanner order by useyn desc, order_seq asc;
END;


-- 레시피 카테고리 동적 쿼리 프로시져(적용 안했음)
create or replace procedure recipeCategory(
    p_recipekey IN varchar2,
    p_cur OUT SYS_REFCURSOR,
    p_cur2 OUT SYS_REFCURSOR
)
IS
    v_cur		SYS_REFCURSOR;
	v_SQL       VARCHAR2(1000);
begin
	-- varchar 형태의 데이터를 변수에 저장하고 execute immediate 로 실행할 수 있습니다. 그 결과를 into에 담습니다.
    v_SQL := 'select * from '||p_recipekey||'_page_view';
    EXECUTE IMMEDIATE v_SQL INTO p_cur ;
    p_cur := v_cur;
end;


-- 레시피 카테고리 정적 쿼리 프로시져(현재 이거로 진행 중)
create or replace procedure recipeCategory(
    p_recipekey IN varchar,
    p_cur OUT SYS_REFCURSOR
)
is 
begin
	-- 들어온 key가 무엇인지에 따라서 분기를 잡습니다.
    if p_recipekey='recipe' then
        open p_cur FOR select * from recipe_page_view;
        close p_cur;
    elsif p_recipekey='type' then
        open p_cur FOR select * from type_page_view;
        close p_cur;
    elsif p_recipekey='theme' then
        open p_cur FOR select * from theme_page_view;
        close p_cur;
    elsif p_recipekey='ing' then
        open p_cur FOR select * from ing_page_view;
        close p_cur;
    end if;
    
end;



CREATE OR REPLACE PROCEDURE adminGetAllCount(
    p_tableName number,
    p_key IN varchar,
    p_cnt out number
)
IS
v_cnt number;
BEGIN
  if p_tableName =1 then
    select Count(*) into v_cnt from members where name like '%'||p_key||'%' ;

  end if;
  p_cnt:=v_cnt;
END;


-- 단골레시피 상위권 및 관리자 추천 페이지 들어갈 때 실행될 프로시져
CREATE OR REPLACE PROCEDURE recipeFavoriteAndRec(
    p_cur OUT   SYS_REFCURSOR,
    p_cur2 OUT   SYS_REFCURSOR
)
IS
BEGIN
    open p_cur for
        select * from recipe_page_view where rec>0 order by rec desc;
    open p_cur2 for 
        select * from recipe_page_view where favorites>0 order by favorites desc;
END;


-- 덧글 추가 프로시져
CREATE OR REPLACE PROCEDURE addReply(
    p_id IN     reply.id%TYPE,
    p_rnum IN  reply.rnum%TYPE,
    p_content IN  reply.content%TYPE
)
IS
BEGIN
    insert into reply(replyseq, rnum, content, id) values(reply_seq.nextVal, p_rnum, p_content, p_id);
    commit;
END;


-- 개별적으로 실행될 덧글 세기 프로시져
create or replace procedure countReply(
    p_cur OUT SYS_REFCURSOR
)
IS
BEGIN
    open p_cur for select count(*) as cnt from reply where rnum = ?
END;


-- 레시피 좋아요 프로시져
CREATE OR REPLACE PROCEDURE likeRecipe(
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


-- 레시피 신고하기 프로시져
CREATE OR REPLACE PROCEDURE reportRecipe(
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


update recipe_page set report = 1 where rnum = 37;