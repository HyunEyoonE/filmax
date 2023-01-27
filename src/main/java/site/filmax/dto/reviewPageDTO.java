package site.filmax.dto;

import lombok.Data;

@Data
public class reviewPageDTO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;
	
	
}