package site.filmax.admin.dto;

import java.util.Date;

import lombok.Data;

@Data
public class NewsDTO {

	private int news_seq;
	private String writer;
	private int type;
	private String title;
	private String content;
	private Date reg;
	private int readcount;
	private String typename;
	private int startNum;
	private int endNum;
}
