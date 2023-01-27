package site.filmax.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BillerDTO {
	private int biller_seq;
	private int reservation_id;
	private int movie_seq;
	private String user_id;
	private int coupon_id;
	private int usingPoint;
	private int amount;
	private Date paidDate;

}
