package com.ezen.todaytable.dto;

import java.sql.Timestamp;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class MemberVO {
	
	
	@NotNull(message="아이디를 입력하세요")
	@NotEmpty(message="아이디를 입력하세요")
	private String id;
	
	@NotNull(message="비밀번호를 입력하세요")
	@NotEmpty(message="비밀번호를 입력하세요")
    private String pwd;
	
	@NotNull(message="이름을 입력하세요")
	@NotEmpty(message="이름을 입력하세요")
    private String name;
	
	@NotNull(message="이메일을 입력하세요")
	@NotEmpty(message="이메일을 입력하세요")
    private String email;
	
	@NotNull(message="핸드폰번호를 입력하세요")
	@NotEmpty(message="핸드폰번호를 입력하세요")
	private String phone;
	
	@NotNull(message="닉네임을 입력하세요")
	@NotEmpty(message="닉네임을 입력하세요")
	private String nick; // 닉네임
	
	private String address1; // 주소1
	private String address2; // 주소2
	private String address3; // 주소3
	private String zip_num; // 집우편주소?
	private Timestamp indate; // 가입날짜?
	private String img; // 프로필사진?
	private String useyn; // 휴면회원 여부

}
