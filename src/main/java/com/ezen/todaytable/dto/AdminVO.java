package com.ezen.todaytable.dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class AdminVO {
	
	@NotNull(message="아이디를 입력하세요")
	@NotEmpty(message="아이디를 입력하세요")
	private String aid;
	@NotNull(message="비밀번호를 입력하세요")
	@NotEmpty(message="비밀번호를 입력하세요")
	private String pwd;
	@NotNull(message="제목을 입력하세요")
	@NotEmpty(message="제목을 입력하세요")
	private String asubject;
	@NotNull(message="글 내용을 입력하세요")
	@NotEmpty(message="글 내용을 입력하세요")
	private String acontent; 
	
	private String mustread;
	private String adate; 
	private String aimage;
	private int aseq; 
	private String phone;
	
}
