package com.ezen.todaytable.dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class ProcessImgVO{
	
	// 기존 : 이미지, 상세 설명을 입력하지 않았을 때 기본 이미지 + 설명 빈칸으로 뜨도록 설정
	// 수정 : 사용자가 div 추가했을 때 이미지, 상세 설명 필수로 입력하도록 설정
	private Integer iseq;  
	@NotEmpty(message="이미지를 첨부하세요.")
	@NotNull(message="이미지를 첨부하세요.")
	private String links; 
	@NotEmpty(message="상세 설명을 입력하세요.")
	@NotNull(message="상세 설명을 입력하세요.")
	private String description; 
	private Integer rnum; 
}
