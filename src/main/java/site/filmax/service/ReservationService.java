package site.filmax.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import site.filmax.dto.BillerDTO;
import site.filmax.dto.BranchDTO;
import site.filmax.dto.CouponDTO;
import site.filmax.dto.MoviesDTO;

public interface ReservationService {
	public String listBranch(Model model, BranchDTO dto_branch);

	public String listMovie(Model model, MoviesDTO dto_movie);

	public String selectedRegion(Model model, int movieId);
	
	public String listRegion(Model model);
	
	public String selectedBranch(Model model, String regionName, int movieId);

	public String readDate(Model model, int branchId, int movieId);

	public String readTime(Model model, int movieId, int branchId, String dateStr);

	public String sendAllData(Model model, int movieId, int branchId, String dateString, String timeString);

	public String readCinemaData(Model model, int movieId, int branchId, String dateString, String timeString);

	public String displaySeat(Model model, int timetableId);

	public int sumPrice(int[] seatArray);

	public String addPayModel(Model model, int timetableId, int total, HttpSession session);
	
	public void payData(BillerDTO dto);

}
