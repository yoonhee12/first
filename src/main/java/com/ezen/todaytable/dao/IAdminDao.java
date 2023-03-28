package com.ezen.todaytable.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.todaytable.dto.AdminVO;

@Mapper
public interface IAdminDao {
	//페이징 카운트
	void adminGetAllCount(HashMap<String, Object> cntMap);
	//회원목록
	void getAdminMemberList(HashMap<String, Object> paramMap);
	//휴면전환
	void adminSleepMem(String useid);
	//회원디테일
	void getAdminMemDetail(HashMap<String, Object> paramMap);
	//Qna목록
	void getAdminQnaList(HashMap<String, Object> paramMap);
	//Qna게시글삭제
	void adminDeleteQna(int qseq);
	//Qna디테일
	void getAdminQnaDetail(HashMap<String, Object> paramMap);
	//Qna답변
	void adminSaveReply(int qseq,String replyQna);
	//댓글목록조회
	void getAdminReplyList(HashMap<String, Object> paramMap);
	//댓글삭제
	void adminDeleteReply(int replyseq);
	//대쉬보드 getCount목록 
	void adminGetCounts(HashMap<String, Object> paramMap);
	//어드민 리스트 조회(id)
	void getAdminList(HashMap<String, Object> paramMap);
	//대쉬보드 (베스트 조회 레시피, 최근 댓글 (3개씩))
	void adminDashList(HashMap<String, Object> paramMap);
	//레시피리스트
	void getAdminRecipeList(HashMap<String, Object> paramMap);
	//레시피추천
	void adminChangeRecommend(String rnum);
	//추천레시피 리스트
	void getAdminPickRecipeList(HashMap<String, Object> paramMap);
	//레시피 삭제
	void adminDeleteRecipe(int rnum1);
	//공지사항 리스트(어드민 테이블)
	void getnoticeList(HashMap<String, Object> paramMap);
	//공지사항 디테일
	void getNoticeDetail(HashMap<String, Object> paramMap);
	//공지사항 입력
	void insertNotice(AdminVO adminvo);
	//공지사항 삭제
	void adminDeleteNotice(int aseq);
	
}
