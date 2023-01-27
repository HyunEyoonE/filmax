package site.filmax.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data

public class MemberDTO {

	private int user_no;
	private String user_id;
	private String user_pw;
	private String user_pwd;
	private String name;
	private String gender;
	private String birth;
	private String phone;
	private String email;
	private int levels;
	private String levels_name;
	private Date joindate;
	private Date lastlogin;
	private String nickname;
	private String profile;
	private int marketing;

}

