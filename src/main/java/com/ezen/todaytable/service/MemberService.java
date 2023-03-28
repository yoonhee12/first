package com.ezen.todaytable.service;

import java.util.HashMap;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.todaytable.dao.IMemberDao;
import com.ezen.todaytable.dto.MemberVO;

@Service
public class MemberService {

	@Autowired
	IMemberDao mdao;

//	public void compareAdminOrMember(HashMap<String, Object> paramMap) {
//		mdao.compareAdminOrMember( paramMap );
//	}

	public void insertMemberttable( HashMap<String, Object> paramMap) {
		mdao.insertMemberttable(paramMap);
	}

	public void updateMemberttable(HashMap<String, Object> paramMap) {
		mdao.updateMemberttable(paramMap);
		
	}

	public void getAdminttable(HashMap<String, Object> paramMap) {
		mdao.getAdminttable(paramMap);
	}

	public void getMembersList(HashMap<String, Object> paramMap) {
		mdao.getMembersList(paramMap);
	}

	public void findId(HashMap<String, Object> paramMap) {
		mdao.findId(paramMap);
		
	}

	public void updatePwd(HashMap<String, Object> paramMap) {
		mdao.updatePwd(paramMap);
		
	}

	public void withDrawal(String id) {
		mdao.withDrawal(id);
	}
	
}
