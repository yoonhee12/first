package com.ezen.todaytable.dto;

import java.sql.Timestamp;
import java.util.ArrayList;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class RecipeVO {
	
		private int rnum;
		private String id; 
		private String nick;
		private String img;
		@NotEmpty(message="제목을 입력하세요.")
		@NotNull(message="제목을 입력하세요.")
		private String subject; 
		@NotEmpty(message="내용을 입력하세요.")
		@NotNull(message="내용을 입력하세요.")
		private String content; 
		private Timestamp indate; 
		@NotEmpty(message="조리시간을 입력하세요.")
		@NotNull(message="조리시간을 입력하세요.")
		private int  time; 
		@NotEmpty(message="썸네일을 입력하세요.")
		@NotNull(message="썸네일을 입력하세요.")
		private String thumbnail; 
		private int views;
		private int likes;
		private int type;
		private int ing;
		private int theme;
		private int rec;
		private int report;
		

}
