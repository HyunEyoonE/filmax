package site.filmax.service;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import site.filmax.dto.CouponDTO;
import site.filmax.dto.Coupon_typeDTO;
import site.filmax.dto.GuestDTO;
import site.filmax.dto.MemberDTO;
import site.filmax.dto.PointDTO;

public interface MemberService {
	public String main(Model model, HttpSession session);
	public String login(Model md, HttpSession session);
	public String loginCheck(MemberDTO dto , HttpSession session);
	
	public String join();
	public String joinMember(MemberDTO dto);
	public String joinAgreement();
	public int idCheck(String user_id );
	public int emailCheck(String email);
	public int nicknameCheck(String nickname);
	//아이디찾기
	public String findId();
	public String findIdCh(String name, String phone,String birth);
	//비밀번호찾기
	public String findPw();
	public String findPwCh(String name, String phone,String user_id);
	public String logout();
	
	public String deleteForm(String user_id , Model md);
	public String levelChange(int count, int levels, String id, Model md, HttpSession session);
	public int pwCheck(String user_id, String user_pw);
	public String update(HttpSession session, Model md, MemberDTO dto);
	public String updateMember(MemberDTO dto, Model md, HttpSession session);
	public String profileEdit(MemberDTO dto, Model model, HttpSession session);
	public String profileEditPro(MemberDTO dto, MultipartFile upload, String path);
	
	public String myCouponList(CouponDTO dto, Model model, HttpSession session);
	public String searchCouponList(String search, String searchValue, Model model);
	
	public String myPointList(PointDTO dto, Model model, HttpSession session);
	public String guestLoginForm();
	public String guestLoginCheck(GuestDTO dto, HttpSession session);
	public String guestJoin();
	public String guestJoinPro(GuestDTO dto);
	public int guestIdCheck(String phone);
	public String couponCount(HttpSession session);
	
	public String naverLogin(Model md, HttpSession session);
	public String naverSuccess(Model md, @RequestParam String code, @RequestParam String state, HttpSession session);
	
	


	
	
}
