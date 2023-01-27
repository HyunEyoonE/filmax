package site.filmax.admin.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class GroupcsDTO {
	private int groupcs_seq;
	private int cinematype;
	private String region;
	private int branch;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date wantdate;
	private String wanttime;
	private int countpeople;
	private String content;
	private String csname;
	private String phone;
	private String email;
	private int isagree;
	private int isanswered;
	private Date reg;
	//추가변수
	private String branchName;
	private String cinemaTypeName;
}