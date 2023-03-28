package com.ezen.todaytable.dto;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class RecipeFormVO {
	// @NotEmpty(message="아이디가 전달돼야 합니다. 로그인하세요.")
	// @NotNull(message="아이디가 전달돼야 합니다. 로그인하세요.")
	private String id; 
	// @NotEmpty(message="닉네임이 전달되지 않았어요.")
	// @NotNull(message="닉네임이 전달되지 않았어요.")
	// private String nick;
	@NotEmpty(message="제목을 입력하세요.")
	@NotNull(message="제목을 입력하세요.")
	private String subject; 
	@NotEmpty(message="내용을 입력하세요.")
	@NotNull(message="내용을 입력하세요.")
	private String content; 
	// private Timestamp indate; 
	// @NotEmpty(message="조리시간을 입력하세요.")
	// @NotNull(message="조리시간을 입력하세요.") : int에 적용 불가
	private int cookingTime; 
	@NotEmpty(message="썸네일을 첨부하세요.")
	@NotNull(message="썸네일을 첨부하세요.")
	private String thumbnail; 
	// @NotEmpty(message="요리 사진을 최소 하나 이상 첨부하세요.")
	// @NotNull(message="요리 사진을 최소 하나 이상 첨부하세요.")
	// private String processImg1;
	@NotEmpty(message="요리 과정을 최소 하나 이상 입력하세요.")
	@NotNull(message="요리 과정을 최소 하나 이상 입력하세요.")
	private String processDetail1;
	@NotEmpty(message="재료를 입력하세요.")
	@NotNull(message="재료를 입력하세요.")
	private String checkIng;
	private int type;
	private int theme;
	private int rnum;
	private int ing;
	// private int count;
	
	// private ArrayList<HashMap<String, Object>> replyList;
	
}
