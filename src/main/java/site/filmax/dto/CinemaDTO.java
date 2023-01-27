package site.filmax.dto;

import lombok.Data;

@Data
public class CinemaDTO {
	private int cinema_seq;
	private int branch_id;
	private int cinemaType_id;
	private int cinemaStatus_id;
	private int roomNum;
	private int seatCapacity;
}
