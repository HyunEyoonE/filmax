package site.filmax.admin.dto;

import java.util.Date;

import lombok.Data;

@Data
public class EreplyDTO {
	private int ereply_seq;
	private int emailcs_seq;
	private String writer;
	private String email;
	private String title;
	private String content;
	private Date reg;
}
