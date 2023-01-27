package site.filmax.admin.dto;

import java.util.Date;

import lombok.Data;

@Data
public class GreplyDTO {
	private int ereply_seq;
	private int groupcs_seq;
	private String writer;
	private String email;
	private String title;
	private String content;
	private Date reg;
}
