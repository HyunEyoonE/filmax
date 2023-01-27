package site.filmax.dto;

import lombok.Data;

@Data
public class TimeTableDTO {
	private int timetable_seq;
	private int branch_id;
	private int cinema_id;
	private int movie_id;
	private String screenDate;
	private String screenTime;
}
