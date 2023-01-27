package site.filmax.dto;

import lombok.Data;

@Data
public class ReservedSeatDTO {
	private int reservedSeat_seq;
	private int seat_id;
	private int timetable_id;
	private int reservation_id;
}
