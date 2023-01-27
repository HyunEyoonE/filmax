package site.filmax.dto;

import lombok.Data;

@Data
public class MemberTalkDTO {
	private int membertalk_seq;
	private int groups;
	private int levels;
	private int step1;
	private int step2;
	private int step3;
	private int step4;
	private int step5;
	private String value;
	private int isend;
	private String content;
	private String herf;
	private String img;
}
