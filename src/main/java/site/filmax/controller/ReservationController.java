package site.filmax.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Setter;
import lombok.extern.java.Log;
import site.filmax.dto.BillerDTO;
import site.filmax.dto.BranchDTO;
import site.filmax.dto.MoviesDTO;
import site.filmax.service.KakaoPay;
import site.filmax.service.ReservationService;

@Log
@Controller
@RequestMapping(value="/ticket/*")
public class ReservationController {
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	@Autowired
	private ReservationService reservationService;
	
	@RequestMapping("")
	public String ticket(Model model, BranchDTO dto_branch, MoviesDTO dto_movie) {
		reservationService.listMovie(model, dto_movie);
		reservationService.listRegion(model);
		reservationService.listBranch(model, dto_branch);
		return "ticket/main";
	} 
	
	@RequestMapping("branchName")
	public String branchName(Model model, String regionName, int movieId) {
		return reservationService.selectedBranch(model, regionName, movieId);
	} 
	
	@RequestMapping("selectedRegion")
	public String region(Model model, int movieId) {
		return reservationService.selectedRegion(model, movieId);
	}
	
	@RequestMapping("selectedBranch")
	public String selectedBranch(Model model, int branchId, int movieId) {
		//System.out.println("branchId: "+branchId+"   movieId: "+movieId);
		return reservationService.readDate(model, branchId, movieId);
	}
	
	@RequestMapping("selectedDate")
	public String selectedDate(Model model, int movieId, int branchId, String dateString ) {
//		System.out.println((int)selectData.get("movieId"));
//		System.out.println((int)selectData.get("branchId"));
//		System.out.println((String)selectData.get("dateStr"));
		
		//System.out.println("branchId: "+branchId+"   movieId: "+movieId+ "   dateString: "+dateString);
		return reservationService.readTime(model, movieId, branchId, dateString);
	}
	
	@RequestMapping("selectedAll")
	public String selectedAll(Model model, int movieId, int branchId, String dateString, String timeString) {
		
//		System.out.println("branchId: "+branchId+"   movieId: "+movieId+ "   dateString: "+dateString);
//		System.out.println("timeString: "+timeString);
		reservationService.readCinemaData(model, movieId, branchId, dateString, timeString);
		return reservationService.sendAllData(model, movieId, branchId, dateString, timeString);
	}
	
	@RequestMapping("selectedCinema")
	public String selectedCinema(Model model, int timetableId) {
		System.out.println("timetableId: "+timetableId);
		
		// 금액 계산 함수
		return reservationService.displaySeat(model, timetableId);
	}
	
	@RequestMapping(value="seatPrice", method=RequestMethod.POST)
	@ResponseBody
	public int seatPrice(Model model, int[] seatArray) {

		return reservationService.sumPrice(seatArray);
	}
	
//	금액 계산시 필요한 model 추가 함수
	@RequestMapping("payout")
	public String payout(Model model, int timetableId, int total, HttpSession session) {
		return reservationService.addPayModel(model, timetableId, total, session);
	}
	
	@RequestMapping("payData")
	public String payData(Model model, BillerDTO dto, HttpSession session ) {
		dto.setUser_id((String)session.getAttribute("uid"));
		
		System.out.println("BillerDTO: "+dto);
		reservationService.payData(dto);
		return "success";
	}
		
	@RequestMapping("payResult")
	public String payResult() {
		return "ticket/payResult";
	}
}
