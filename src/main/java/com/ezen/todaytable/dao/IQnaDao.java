package com.ezen.todaytable.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IQnaDao {

	void getAllCount(HashMap<String, Object> paramMap);

	void listQna(HashMap<String, Object> paramMap);

	void oneQna(HashMap<String, Object> paramMap);

	void insertQnas(HashMap<String, Object> paramMap);

	void qnaUpdate(HashMap<String, Object> paramMap);

	void deleteQna(int qseq);

	void mylistQna(HashMap<String, Object> paramMap);

}
