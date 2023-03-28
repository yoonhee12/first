package com.ezen.todaytable.dto;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;


@Data
public class QnaVO {

	private int qseq;
	private String id;
	@NotNull(message="제목을 입력하세요")
	@NotEmpty(message="제목을 입력하세요")
	private String qsubject;
	@NotNull(message="내용을 입력하세요")
	@NotEmpty(message="내용을 입력하세요")
	private String qcontent;
	private Timestamp qnadate;
	private String secret;
	private String qnapass;
	private String replyqna;
	private String rep;


}
