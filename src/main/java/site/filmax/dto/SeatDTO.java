package site.filmax.dto;

import lombok.Data;

@Data
public class SeatDTO {
	private int seat_seq;
	private int cinema_id;
	private int seatType_id;
	private int seatAlpa;
	private int seatNum;
	private String seatName;
	private int isBroken;
	private int isReserved;
	
	private int price;
}
