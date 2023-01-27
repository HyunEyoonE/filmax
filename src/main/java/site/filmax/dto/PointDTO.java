package site.filmax.dto;

import java.util.Date;

import lombok.Data;

@Data
public class PointDTO {
	private int num;
	private int pointnum;
	private String user_id;
	private int pluspoint;
	private int usepoint;
	private int totalpoint;
	private Date chargepoint;
	private Date usedate;
	private String pointinfo;
	private String idPoint;
	
	
}
