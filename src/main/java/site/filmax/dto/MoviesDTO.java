package site.filmax.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MoviesDTO {
	private int movie_seq;
	private int genre_id;
	private int country_id;
	private int ageLimit_id;
	private int subtitle_id;
	private int screening_id;
	private int poster_id;
	private String director;
	private String actor;
	private String title;
	private int runtime;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date releaseDate;
	private String summary;
	private String poster;

}
