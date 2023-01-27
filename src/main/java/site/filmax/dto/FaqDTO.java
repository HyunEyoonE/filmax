package site.filmax.dto;

import java.util.Date;

import lombok.Data;

@Data
public class FaqDTO {
	private int faq_seq;
	private int type;
	private String title;
	private String content;
	private int readcount;
	private Date reg;
	private String writer;
	private int startNum;
	private int endNum;
	private String keyword;
	private String faqtype;
	private String typeName;
}