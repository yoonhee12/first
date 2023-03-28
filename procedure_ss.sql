-- 멤버,어드민리스트
create or replace procedure compareAdminOrMember(
    p_id IN members.id%type,
    p_aid IN admins.aid%type,
    p_curvar out SYS_REFCURSOR,
    p_curvar2 out SYS_REFCURSOR
)
is
    result_cur sys_refcursor;
    result_cur2 sys_refcursor;
begin
  open result_cur for 
        select * from members where id =p_id;
    p_curvar := result_cur;
  open result_cur for 
        select * from admins where aid =p_aid;
    p_curvar2 := result_cur2;
end;
select*from members;
select*from admins;
alter table members add address3 varchar2(50);

--회원가입
create or replace procedure insertMemberttable(
    p_id IN members.id%type,
    p_pwd IN members.pwd%type,
    p_name IN members.name%type,
    p_nick IN members.nick%type,
    p_email IN members.email%type,
    p_phone IN members.phone%type,
    p_zip_num IN members.zip_num%type,
    p_address1 IN members.address1%type,
    p_address2 IN members.address2%type,
    p_address3 IN members.address3%type,
    p_img in members.img%type
    
)
is
   
begin
  insert into members (id,pwd, name,nick ,email, phone, zip_num, address1, address2, address3,img)
  values (p_id,p_pwd,p_name,p_nick,p_email,p_phone,p_zip_num,p_address1,p_address2,p_address3,p_img);
  commit;
end;

alter table members add address3 varchar2(50);

--회원정보수정
create or replace procedure updateMemberttable(
    p_id IN members.id%type,
    p_pwd IN members.pwd%type,
    p_name IN members.name%type,
    p_nick IN members.nick%type,
    p_email IN members.email%type,
    p_phone IN members.phone%type,
    p_zip_num IN members.zip_num%type,
    p_address1 IN members.address1%type,
    p_address2 IN members.address2%type,
    p_address3 IN members.address3%type,
    p_img in members.img%type
)
is
   
begin
  update members set pwd=p_pwd, name=p_name,nick=p_nick, email=p_email,
  phone=p_phone, zip_num=p_zip_num, address1=p_address1, address2=p_address2, 
  address3=p_address3, img=p_img
 where id=p_id;
  commit;
end;
select*from admins;
--- 어드민
create or replace procedure getAdminttable(
    p_id IN admins.aid%type,
    p_curvar out SYS_REFCURSOR
)
is
    result_cur sys_refcursor;
begin
  open result_cur for 
        select * from admins where aid = p_id;
    p_curvar := result_cur;
end;

create or replace procedure getMembersList(
    p_id IN members.id%type,
    p_curvar out SYS_REFCURSOR
)
is
    result_cur sys_refcursor;
begin
  open result_cur for 
        select * from members where id =p_id;
    p_curvar := result_cur;
end;
select * from members;



--- myrecipe ,interest,favorite 갯수 조회

select*from recipe_page_view;

create or replace procedure getMIFAllCount(
    p_id IN recipe_page_view.id%type,
    p_tableName in number,
    p_count out number
)
is
   v_cnt number;
begin
    if p_tableName =1 then
        select Count(*) into v_cnt from recipe_page_view where id = p_id;
    elsif p_tableName=2 then
        select Count(*) into v_cnt from fi_view where interestid = p_id and likeyn='Y';
    elsif p_tableName=3 then
        select Count(*) into v_cnt from fi_view where favoriteid = p_id and fuseyn='Y' ;
  end if;
  p_count:=v_cnt;

end;


 --- myrecipe ,interest,favorite 조회
create or replace procedure getMIFListtable(
    p_id IN recipe_page_view.id%type,
    p_tableName number,
    p_startNum in number,
    p_endNUm in number,
    p_curvar out SYS_REFCURSOR
)
is
  result_cur sys_refcursor;
begin
    if p_tableName =1 then
    open result_cur for
        select * from ( 
            select * from ( 
                select rownum as rn, r.*from ((select * from recipe_page_view where id = p_id order by rnum desc) r)
            ) where rn >=p_startNum 
        ) where rn <=p_endNum;
        
    elsif p_tableName=2 then
    open result_cur for
        select * from ( 
            select * from (
             select rownum as rn, i.*from ((select * from fi_view where interestid = p_id and likeyn='Y' order by interestnum desc) i)
            ) where rn >=p_startNum 
        ) where rn <=p_endNum;
        
    elsif p_tableName=3 then
    open result_cur for
    select * from ( 
        select * from (
            select rownum as rn, f.*from ((select * from fi_view where favoriteid = p_id and fuseyn='Y'order by fnum desc ) f)
            ) where rn >=p_startNum 
        ) where rn <=p_endNum;

  end if;
  p_curvar:=result_cur;

end;
select*from favorite;
select*from fi_view;
select*from interest;

create or replace procedure getFavoriteList(
    p_id IN favorite.id%type,
    p_curvar out SYS_REFCURSOR
)
is
    result_cur sys_refcursor;
begin
  open result_cur for 
        select * from favorite where id = p_id;
    p_curvar := result_cur;
end;



select*from favorite;
select*from fi_view;


CREATE OR REPLACE PROCEDURE changeFuseyn(
   p_rnum IN favorite.rnum%type,
   p_id in favorite.id%type

)
IS
    v_fuseyn varchar2(10);
BEGIN
    select fuseyn into v_fuseyn from favorite where rnum=p_rnum and id=p_id;
   
    if v_fuseyn='Y' then
    update favorite set fuseyn='N' where rnum=p_rnum and id=p_id;
    update recipe_page set favorites=favorites-1 where rnum=p_rnum;
    elsif v_fuseyn='N'then
    update favorite set fuseyn='Y' where rnum=p_rnum and id=p_id;
    update recipe_page set favorites=favorites+1 where rnum=p_rnum;
    commit;
end if;
END;
select*from favorite where id='scott';

