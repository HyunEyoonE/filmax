package site.filmax.dto;



import java.util.Date;

import lombok.Data;

@Data
public class ReservationDTO {
	private int reservation_seq;
	private String user_id;
	private int timetable_id;
	private int isActive;
	private int isPaid;
	private Date reserveDate;
}
