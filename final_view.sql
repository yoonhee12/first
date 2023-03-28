-- 기존 존재하는 뷰 삭제
DROP VIEW recipe_page_view;
DROP VIEW type_page_view;
DROP VIEW fi_view;

-- 기본 레시피 페이지 뷰
create or replace view recipe_page_view
as
select r.rnum, r.id, m.nick, m.img, r.subject, r.content, r.thumbnail, r.time, r.indate, r.type, r.theme, p.views, p.likes,  p.favorites,  p.ing, p.rec, p.report
from recipe r, members m, recipe_page p
where r.rnum = p.rnum and r.id = m.id
order by indate desc;

select * from recipe_page_view;

-- 재료별 페이지 뷰
create or replace view ing_page_view
as
select r.rnum, r.id, m.nick, m.img, r.subject, r.content, r.thumbnail, r.time, r.indate, r.type, r.theme, p.views, p.likes,  p.favorites,  p.ing, p.rec, p.report
from recipe r, members m, recipe_page p
where r.rnum = p.rnum and r.id = m.id
order by ing, indate desc;

select * from ing_page_view;

-- 테마별 페이지 뷰
create or replace view theme_page_view
as
select r.rnum, r.id, m.nick, m.img, r.subject, r.content, r.thumbnail, r.time, r.indate, r.type, r.theme, p.views, p.likes,  p.favorites, p.ing, p.rec, p.report
from recipe r, members m, recipe_page p
where r.rnum = p.rnum and r.id = m.id
order by theme, indate desc;

select * from theme_page_view;

-- 타입별 페이지 뷰
create or replace view type_page_view
as
select r.rnum, r.id, m.nick, m.img, r.subject, r.content, r.thumbnail, r.time, r.indate, r.type, r.theme, p.views, p.likes,  p.favorites,  p.ing, p.rec, p.report
from recipe r, members m, recipe_page p
where r.rnum = p.rnum and r.id = m.id
order by type, indate desc;

select * from type_page_view;

-- 페이버릿 인터레스트 뷰
create or replace view fi_view
as
select r.rnum, r.id, i.id as interestid, f.id as favoriteid, r.subject, r.content, r.indate, p.views, f.fuseyn, i.likeyn, i.interestnum, f.fnum
from recipe r, members m, favorite f, interest i, recipe_page p
where r.rnum = p.rnum and r.rnum = i.rnum  and r.rnum =f.rnum  and m.id = i.id
order by indate desc;

select * from fi_view;


select * from recipe;

