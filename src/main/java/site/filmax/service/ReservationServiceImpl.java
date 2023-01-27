package site.filmax.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import site.filmax.dao.CinemaMapper;
import site.filmax.dao.PayMapper;
import site.filmax.dto.BillerDTO;
import site.filmax.dto.BranchDTO;
import site.filmax.dto.CinemaDTO;
import site.filmax.dto.CinemaTypeDTO;
import site.filmax.dto.CouponDTO;
import site.filmax.dto.MoviesDTO;
import site.filmax.dto.TimeTableDTO;

@Service
public class ReservationServiceImpl implements ReservationService {
//	extends CinemaServiceImpl
	@Autowired
	private CinemaMapper cinemaMapper;
	
	@Autowired
	private PayMapper payMapper;
	
	@Override
	public String listBranch(Model model, BranchDTO dto_branch) {
		model.addAttribute("branchList", cinemaMapper.readBranch());
		return "/ticket/main";
	}
	
	@Override
	public String listMovie(Model model, MoviesDTO dto_movie) {
		model.addAttribute("movieList", cinemaMapper.readMovies());
		return "/ticket/main";
	}
	
	@Override
	public String listRegion(Model model) {
		model.addAttribute("regionList", cinemaMapper.readRegion());
		return "/ticket/main";
	}
	
	@Override
	public String selectedRegion(Model model, int movieId) {
		model.addAttribute("regionList", cinemaMapper.readSelectedRegion(movieId));
		model.addAttribute("movie" , movieId);
		return "/ticket/regionList";
	}

	@Override
	public String selectedBranch(Model model, String regionName, int movieId) {
		model.addAttribute("branchList",cinemaMapper.readClickedBranch(regionName, movieId));
		model.addAttribute("movie", movieId);
		return "/ticket/branchList";
	}
	
	@Override
	public String readDate(Model model, int branchId, int movieId) {
		model.addAttribute("movie_seq", movieId);
		model.addAttribute("branch_seq", branchId);
		model.addAttribute("dateList", cinemaMapper.readTimeTable(branchId, movieId));
		return "/ticket/dateList";
	}
	
	@Override
	public String readTime(Model model, int movieId, int branchId, String dateString) {
		model.addAttribute("movie_seq", movieId);
		model.addAttribute("branch_seq", branchId);
		model.addAttribute("dateStr", dateString);
		model.addAttribute("timeList", cinemaMapper.readDate(movieId, branchId, dateString));
		return "/ticket/timeList";
	}
	
	@Override
	// 선택한 시간에 대한 상영관 정보 view에 뿌리는  함수  
	public String readCinemaData(Model model, int movieId, int branchId, String dateString, String timeString) {
		// 선택한 상영시간표table에서 cinemaId만 빼냄 
		TimeTableDTO timetable = new TimeTableDTO();
		timetable = cinemaMapper.readCinema(movieId, branchId, dateString, timeString);
		int cinemaId = timetable.getCinema_id();
		
		//System.out.println("cinemaId: "+cinemaId);
		//System.out.println("timetable_seq: "+dto.getTimetable_seq());
		
		// 선택한 상영시간표 데이터로 상영관 정보 출력
		CinemaDTO cinema = new CinemaDTO();
		cinema = cinemaMapper.readClickedCinema(movieId, branchId, dateString, timeString);
		model.addAttribute("roomNum", cinema.getRoomNum());
		// cinemaTypeId로 상영관 타입 출력 
		int cinemaTypeId = cinema.getCinemaType_id(); 
		
		// 선택된 상영관의 상영관 타입이름 출력 
		CinemaTypeDTO cinemaType = new CinemaTypeDTO();
		cinemaType = cinemaMapper.readCinemaType(cinemaTypeId); 
		model.addAttribute("cinemaTypeName", cinemaType.getTypeName());	//string 
		// TODO // 잔여좌석 처리 
		// int seatCapacity = cinema.getSeatCapacity();
		//return "/ticket/cinemaData";
		return "/ticket/selectSeatBtn";
	}
	
	@Override
	public String sendAllData(Model model, int movieId, int branchId, String dateString, String timeString){
		TimeTableDTO timetable = new TimeTableDTO();
		timetable = cinemaMapper.readCinema(movieId, branchId, dateString, timeString);
		model.addAttribute("timetableSeq",timetable.getTimetable_seq());
		return "/ticket/selectSeatBtn";
	}

	@Override
	public String displaySeat(Model model, int timetableId) {
		//System.out.println(cinemaMapper.readSeat(timetableId));
		//System.out.println(timetableId);
		model.addAttribute("seatList", cinemaMapper.readSeat(timetableId));
		TimeTableDTO timetable = new TimeTableDTO();
		CinemaDTO cinema = new CinemaDTO();
		timetable = cinemaMapper.readSelectedTimetable(timetableId);
		
		int cinemaId = timetable.getCinema_id();
		cinema = cinemaMapper.readSelectedCinema(cinemaId);
		
		
		model.addAttribute("selectedMovie", cinemaMapper.readSelectedMovie(timetable.getMovie_id()));
		model.addAttribute("selectedBranch", cinemaMapper.readSelectedBranch(timetable.getBranch_id()));
		model.addAttribute("selectedCinema", cinemaMapper.readSelectedCinema(timetable.getCinema_id()));
		model.addAttribute("selectedCinemaType", cinemaMapper.readCinemaType(cinema.getCinemaType_id()));
		model.addAttribute("selectedDateTime", cinemaMapper.readSelectedDateTime(timetableId));
		model.addAttribute("timetableId", timetableId);
		
		return "ticket/seat";
	}
	
	@Override
	// 인원수 대비 전체 가격 
	public int sumPrice(int[] seatArray) {
		//List<SeatDTO> seatList = cinemaMapper.readSeatPrice(seatArray);
		
		return cinemaMapper.readSeatPriceSum(seatArray);
	}
	
	@Override
	public String addPayModel(Model model, int timetableId, int total, HttpSession session) {
		if(session.getAttribute("uid") != null) { // 회원로그인(세션)했다면
			String id = (String)session.getAttribute("uid"); // 세션값을 id로 대입
			model.addAttribute("mylist", payMapper.GoderCoupon(id)); // 내쿠폰목록
			model.addAttribute("pointCount", payMapper.pointCount(id)); // 최종포인트 불러옴
		}
		System.out.println("total: "+total);
		System.out.println("selectedMovie: "+cinemaMapper.readSelectedMovie(timetableId));
		model.addAttribute("total", total);
		model.addAttribute("selectedMovie", cinemaMapper.readSelectedMovie(timetableId));
		return "ticket/pay";
	}
	
	@Override
	public void payData(BillerDTO dto) {
		// biller table 데이터 insert
		payMapper.insertBiller(dto);
		String user_id=dto.getUser_id();
		int usingPoint=dto.getUsingPoint();
		int coupon_type = dto.getCoupon_id();
		System.out.println("ckCoupon: "+coupon_type);
		
		// point table 포인트 데이터 차감
		payMapper.minusPoint(user_id, usingPoint);
		// coupon table 포인트 사용 
		payMapper.updateCoupon(user_id, coupon_type);
	}

}












