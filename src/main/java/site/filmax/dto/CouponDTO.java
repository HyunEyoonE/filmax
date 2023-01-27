package site.filmax.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CouponDTO {
	private String user_id;
	private String num;
	private int type;
	private boolean use;
	private Date usetime;
	private String name;
	private String info;
	private int sale;
	private String idCoupon;
}
