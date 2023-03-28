
/* Drop Triggers */

DROP TRIGGER TRI_favorite_fnum;
DROP TRIGGER TRI_ingTag_tag_id;
DROP TRIGGER TRI_interest_interestnum;
DROP TRIGGER TRI_qna_qseq;
DROP TRIGGER TRI_recipe_rnum;
DROP TRIGGER TRI_reply_replyseq;



/* Drop Tables */

DROP TABLE admins CASCADE CONSTRAINTS;
DROP TABLE favorite CASCADE CONSTRAINTS;
DROP TABLE recipeTag CASCADE CONSTRAINTS;
DROP TABLE ingTag CASCADE CONSTRAINTS;
DROP TABLE interest CASCADE CONSTRAINTS;
DROP TABLE qna CASCADE CONSTRAINTS;
DROP TABLE processImg CASCADE CONSTRAINTS;
DROP TABLE recipe_page CASCADE CONSTRAINTS;
DROP TABLE reply CASCADE CONSTRAINTS;
DROP TABLE recipe CASCADE CONSTRAINTS;
DROP TABLE members CASCADE CONSTRAINTS;
DROP TABLE recipe_report CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_favorite_fnum;
DROP SEQUENCE SEQ_ingTag_tag_id;
DROP SEQUENCE SEQ_interest_interestnum;
DROP SEQUENCE SEQ_qna_qseq;
DROP SEQUENCE SEQ_recipe_rnum;
DROP SEQUENCE SEQ_reply_replyseq;

drop sequence recipe_seq;
drop sequence qseq_seq;
drop sequence reply_seq;
DROP SEQUENCE fnum_seq;
DROP SEQUENCE interestnum_seq;
drop sequence ingTag_seq;
drop sequence report_seq;

select recipe_seq.nextVal from dual;
select qseq_seq.nextVal from dual;
select reply_seq.nextVal from dual;
select fnum_seq.nextVal from dual;
select interestnum_seq.nextVal from dual;
select ingTag_seq.nextVal from dual;
select report_seq.nextVal from dual;

/* Create Sequences */

create sequence recipe_seq increment by 1 start with 1;
create sequence qseq_seq increment by 1 start with 1;
create sequence reply_seq increment by 1 start with 1;
CREATE SEQUENCE fnum_seq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE interestnum_seq INCREMENT BY 1 START WITH 1;
create sequence ingTag_seq start with 132 increment by 1; -- 숫자 수정 (recipeTag 테이블 채운 후)
create sequence report_seq increment by 1 start with 1;
create sequence tt_banner_seq start with 1;

/* Create Tables */

CREATE TABLE admins
(
	aid varchar2(50) NOT NULL,
	pwd varchar2(50) NOT NULL,
	phone varchar2(50) NOT NULL,
	PRIMARY KEY (aid)
);


CREATE TABLE favorite
(
	fnum number(5) NOT NULL,
	id varchar2(50) NOT NULL,
	rnum number(20) NOT NULL,
	fuseyn char(1) DEFAULT 'N',
	PRIMARY KEY (fnum)
);


CREATE TABLE ingTag
(
	tag_id number(20) NOT NULL,
	tag varchar2(100) NOT NULL UNIQUE,
	PRIMARY KEY (tag_id)
);


CREATE TABLE interest
(
	interestnum number(5) NOT NULL,
	id varchar2(50) NOT NULL,
	rnum number(20) NOT NULL,
	likeYN char(1) DEFAULT 'Y',
	PRIMARY KEY (interestnum)
);


CREATE TABLE members
(
	id varchar2(50) NOT NULL,
	pwd varchar2(50) NOT NULL,
	name varchar2(20) NOT NULL,
	phone varchar2(50) NOT NULL,
	email varchar2(50) NOT NULL,
	nick varchar2(50) NOT NULL,
	address1 varchar2(100) NOT NULL,
	address2 varchar2(100),
	address3 varchar2(100),
	zip_num varchar2(20) NOT NULL,
	indate date DEFAULT sysdate,
	img varchar2(1000),
	useyn char(1) DEFAULT 'Y',
	PRIMARY KEY (id)
);


CREATE TABLE processImg
(
	iseq number(5) NOT NULL,
	rnum number(20) NOT NULL,
	links varchar2(1000) NOT NULL,
	description varchar2(1000) NOT NULL
);


CREATE TABLE qna
(
	qseq number(5) NOT NULL,
	id varchar2(50) NOT NULL,
	qsubject varchar2(200) NOT NULL,
	qcontent varchar2(1000) NOT NULL,
	qnadate date DEFAULT sysdate,
	secret char(1) DEFAULT '0' NOT NULL,
	qnapass varchar2(100),
	replyQna varchar2(1000),
	rep number(1) DEFAULT 1,
	PRIMARY KEY (qseq)
);


CREATE TABLE recipe
(
	rnum number(20) NOT NULL,
	id varchar2(50) NOT NULL,
	subject varchar2(100) NOT NULL,
	content varchar2(1000) NOT NULL,
	thumbnail varchar2(500) NOT NULL,
	indate date DEFAULT sysdate,
	time number(5) NOT NULL,
	type number(5) DEFAULT 0,
	theme number(5) DEFAULT 0,
	PRIMARY KEY (rnum)
);


CREATE TABLE recipeTag
(
	rnum number(20) NOT NULL,
	tag_id number(20) NOT NULL,
	quantity varchar2(50)
);


CREATE TABLE recipe_page
(
	rnum number(20) NOT NULL,
	views number(10) DEFAULT 0 NOT NULL,
	likes number(10) DEFAULT 0,
	favorites number(10) DEFAULT 0,
	ing number(5) DEFAULT 0,
	rec number(5) DEFAULT 0,
	report number(5) DEFAULT 0
);


CREATE TABLE reply
(
	replyseq number(5) NOT NULL,
	id varchar2(50) NOT NULL,
	rnum number(20) NOT NULL,
	content varchar2(1000) NOT NULL,
	replydate date DEFAULT sysdate,
	PRIMARY KEY (replyseq)
);


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



/* Create Foreign Keys */

ALTER TABLE recipeTag
	ADD FOREIGN KEY (tag_id)
	REFERENCES ingTag (tag_id)
;


ALTER TABLE favorite
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;


ALTER TABLE interest
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;


ALTER TABLE qna
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;


ALTER TABLE recipe
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;


ALTER TABLE reply
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;


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


/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_favorite_fnum BEFORE INSERT ON favorite
FOR EACH ROW
BEGIN
	SELECT SEQ_favorite_fnum.nextval
	INTO :new.fnum
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_ingTag_tag_id BEFORE INSERT ON ingTag
FOR EACH ROW
BEGIN
	SELECT SEQ_ingTag_tag_id.nextval
	INTO :new.tag_id
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_interest_interestnum BEFORE INSERT ON interest
FOR EACH ROW
BEGIN
	SELECT SEQ_interest_interestnum.nextval
	INTO :new.interestnum
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_qna_qseq BEFORE INSERT ON qna
FOR EACH ROW
BEGIN
	SELECT SEQ_qna_qseq.nextval
	INTO :new.qseq
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_recipe_rnum BEFORE INSERT ON recipe
FOR EACH ROW
BEGIN
	SELECT SEQ_recipe_rnum.nextval
	INTO :new.rnum
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_reply_replyseq BEFORE INSERT ON reply
FOR EACH ROW
BEGIN
	SELECT SEQ_reply_replyseq.nextval
	INTO :new.replyseq
	FROM dual;
END;

/




