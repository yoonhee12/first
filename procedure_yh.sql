-- 겟 올 카운트
CREATE OR REPLACE PROCEDURE getAllCount(
    p_id in varchar2,
    p_refer varchar2,
    p_cnt OUT NUMBER
)
IS
BEGIN
    if (p_refer = 'all') then
    select Count(*) into p_cnt from qna;
    elsif (p_refer = 'my') then
    select Count(*) into p_cnt from qna where id= p_id;
  end if;
END;
    
    
select * from member;

commit;

-- 리스트 qna  
CREATE OR REPLACE PROCEDURE listQna (
    p_id IN varchar2,
    p_refer varchar2,
    p_startNum IN NUMBER,
    p_endNum IN NUMBER,
    p_rc   OUT     SYS_REFCURSOR )
IS
BEGIN
    if (p_refer = 'all') then
        OPEN p_rc FOR
        SELECT * FROM (
        SELECT * FROM (
        SELECT ROWNUM AS rn, q.* FROM ((SELECT * FROM QNA ORDER BY qseq desc) q) 
        ) WHERE rn>= p_startNum
        ) WHERE rn<= p_endNum;
    elsif (p_refer = 'my') then
        OPEN p_rc FOR
        SELECT * FROM (
        SELECT * FROM (
        SELECT ROWNUM AS rn, q.* FROM ((SELECT * FROM QNA where id=p_id ORDER BY qseq desc) q) 
        ) WHERE rn>= p_startNum
        ) WHERE rn<= p_endNum;
  end if;
END;

-- qna 하나 열기
CREATE OR REPLACE PROCEDURE oneQna (
    p_qseq IN   Qna.qseq%TYPE,
    p_rc   OUT     SYS_REFCURSOR )
IS
BEGIN
    OPEN p_rc FOR
        SELECT * FROM qna WHERE qseq=p_qseq;
END;


-- qna 글입력
CREATE OR REPLACE PROCEDURE insertQnas(
    p_qsubject  IN qna.qsubject%TYPE,
    p_qcontent  IN qna.qcontent%TYPE,
    p_secret   IN qna.secret%TYPE,
    p_qnapass     IN qna.qnapass%TYPE
)
IS
BEGIN
    insert into qna(qseq, id, qsubject, qcontent, secret, qnapass) 
    values( qna_seq.nextVal, 'scott', p_qsubject, p_qcontent, p_secret, p_qnapass);
    commit;    
END;

select * from qna order by qseq desc

update qna set rep='1'

-- qna 업데이트
CREATE OR REPLACE PROCEDURE qnaUpdate(
    p_qseq  IN qna.qseq%TYPE,
    p_qsubject  IN qna.qsubject%TYPE,
    p_qcontent   IN qna.qcontent%TYPE
)
IS
BEGIN
    update qna set qsubject=p_qsubject, qcontent=p_qcontent where qseq=p_qseq;
    commit;    
END;

-- qna 삭제 --
CREATE OR REPLACE PROCEDURE deleteQna(
    p_qseq  IN qna.qseq%TYPE
)
IS
BEGIN
    delete from qna where qseq=p_qseq;
    commit;
END;

-- mylist qna 
CREATE OR REPLACE PROCEDURE mylistQna (
    p_id IN varchar2,
    p_startNum IN NUMBER,
    p_endNum IN NUMBER,
    p_rc   OUT     SYS_REFCURSOR 
)
IS
BEGIN
    OPEN p_rc FOR
        SELECT * FROM (
        SELECT * FROM (
        SELECT ROWNUM AS rn, q.* FROM ((SELECT * FROM QNA where id=p_id ORDER BY qseq desc) q) 
        ) WHERE rn>= p_startNum
        ) WHERE rn<= p_endNum;
END;