package com.ezen.todaytable.dto;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class ReplyVO {

	private Integer replyseq;
	private String id;
	private Integer rnum;
	@NotEmpty(message="덧글 내용을 입력하세요.")
	@NotNull(message="덧글 내용을 입력하세요.")
	private String reply;
	private Timestamp replydate;
	
}
