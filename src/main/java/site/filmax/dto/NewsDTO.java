package site.filmax.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
	private String typeName;
	private int startNum;
	private int endNum;
}
