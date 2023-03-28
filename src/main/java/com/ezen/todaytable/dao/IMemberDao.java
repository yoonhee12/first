package com.ezen.todaytable.dao;

import java.util.HashMap;

import javax.validation.Valid;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.todaytable.dto.MemberVO;

@Mapper
public interface IMemberDao {

	// void compareAdminOrMember(HashMap<String, Object> paramMap);
	
	void insertMemberttable(HashMap<String, Object> paramMap);

	void updateMemberttable(HashMap<String, Object> paramMap);

	void getAdminttable(HashMap<String, Object> paramMap);

	void getMembersList(HashMap<String, Object> paramMap);

	void findId(HashMap<String, Object> paramMap);

	void updatePwd(HashMap<String, Object> paramMap);

	void withDrawal(String id);

	

}
