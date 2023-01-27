package site.filmax.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import site.filmax.dto.BranchDTO;
import site.filmax.dto.CinemaDTO;
import site.filmax.dto.CinemaTypeDTO;
import site.filmax.dto.MoviesDTO;
import site.filmax.dto.SeatDTO;
import site.filmax.dto.TimeTableDTO;

public interface CinemaMapper {
	public List<BranchDTO> readBranch();
	public List<MoviesDTO> readMovies();
	public List<BranchDTO> readRegion();
	public List<BranchDTO> readSelectedRegion(int movieId);
	public List<TimeTableDTO> readTimeTable(@Param("branch_seq")int branchId, @Param("movie_seq")int movieId);
	public List<TimeTableDTO> readDate(@Param("branch_seq")int branchId, @Param("movie_seq")int movieId, @Param("date")String dateString);
	
	public String readBranchAddress(int branch_seq);
	
	public List<BranchDTO> readClickedBranch(@Param("regionName")String regionName, @Param("movie_seq")int movieId);
	public TimeTableDTO readCinema(@Param("movie_seq")int movieId, @Param("branch_seq")int branchId, @Param("date") String dateString, @Param("time")String timeString);
	
	public CinemaDTO readClickedCinema(@Param("movie_seq")int movieId, @Param("branch_seq")int branchId, @Param("date") String dateString, @Param("time")String timeString);
	public CinemaTypeDTO readCinemaType(int cinemaTypeId);
	public TimeTableDTO readSelectedTimetable(int timetableId);
	public MoviesDTO readSelectedMovie(int movieId);
	public BranchDTO readSelectedBranch(int branchId);
	public CinemaDTO readSelectedCinema(int cinemaId);
	public TimeTableDTO readSelectedDateTime(int timetableId);
	
	public List<SeatDTO> readSeat(int timetableId);
	
	public List<SeatDTO> readSeatPrice(int [] seatId);
	public int readSeatPriceSum(int [] seatId);
	

}
