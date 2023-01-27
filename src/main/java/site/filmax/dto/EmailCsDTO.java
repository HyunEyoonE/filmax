package site.filmax.dto;

import java.util.Date;

import lombok.Data;

@Data
public class EmailCsDTO {
	private int emailcs_seq;
	private String name;
	private String phone;
	private String email;
	private int etype;
	private int thchoice;
	private String region;
	private int branch_seq;
	private String title;
	private String content;
	private String files;
	private Date reg;
	private int isanswered;
	private String branchName;
}
