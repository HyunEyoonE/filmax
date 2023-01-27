package site.filmax.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import site.filmax.admin.dto.CinemaTypeDTO;

public interface StaticMapper {
	public List<CinemaTypeDTO> selectCinemaType();
	public int countCinemaByCinemaTypeSeq(int cinemaTypeSeq);
	public List<HashMap> sumAllpayByMonth(@Param("startDate")String startDate,
											@Param("endDate")String endDate);
	public List<HashMap> selectMovieTop5ByAllpay(@Param("startDate")String startDate,
												@Param("endDate")String endDate,
												@Param("descOrNot")String descOrNot,
												@Param("startRNum")int startRNum,
												@Param("endRNum")int endRNum);
	public int sumThisMonthAllpay(String sumMonthDay);
	public int sumYearAllpay(@Param("startDate")String startDate,
							@Param("endDate")String endDate);
	public int countEmailNotAnswered();
	public int countGroupNotAnswered();
}
