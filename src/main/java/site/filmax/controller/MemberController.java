package site.filmax.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.scribejava.core.model.OAuth2AccessToken;

import site.filmax.dto.CouponDTO;
import site.filmax.dto.Coupon_typeDTO;
import site.filmax.dto.GuestDTO;
import site.filmax.dto.MemberDTO;
import site.filmax.dto.PointDTO;
import site.filmax.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@Autowired
	private HttpSession session;
	
	//네이버 간편로그인
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	// 마이페이지 메인
	@GetMapping("main")
	public String main(Model model) {
		return service.main(model, session);
	}
	//pom.xml 추가해야됨 2개
	//로그인,네이버 로그인 첫 화면 요청 메소드
	@GetMapping("loginForm")
	public String loginForm(Model md, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //System.out.println("네이버:" + naverAuthUrl);
        
        //네이버  로그인
        md.addAttribute("url", naverAuthUrl);
 
        /* 생성한 인증 URL을 View로 전달 */
		return service.login(md, session);
	}
	//네이버 로그인 성공시 callback호출 메소드
    @RequestMapping("callback")
    public String callback(Model md, @RequestParam String code, @RequestParam String state, HttpSession session)throws IOException {
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);

        // 로그인한 사용자의 모든 정보가 JSON타입으로 저장되어 있음
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        md.addAttribute("result", apiResult); //
        
        /* 네이버 로그인 성공 페이지 View 호출 */
        return service.naverSuccess(md,code,state,session);
    }
	@PostMapping("loginPro")
	public String loginPro(MemberDTO dto , HttpSession session) {
		return service.loginCheck(dto , session);
	}
	//네이버 로그인 회원정보가져오기
	@GetMapping("naverId")
	public @ResponseBody String naverId(String id ,String name, HttpSession session) {
		session.setAttribute("nid" , id);
		session.setAttribute("nname" , name);
		return "success";
	}
	// 로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 모든 세션 삭제
		return "redirect:/main/home";
	}
	
	
	//회원가입
	@GetMapping("join")
	public String join() {
		return service.join();
	}
	@PostMapping("joinPro")
	public String joinPro(MemberDTO dto) { 
		return service.joinMember(dto); 
	}
	//회원가입시 개인정보 체크동의
	@GetMapping("joinAgreement")
	public String joinAgreement() {
		return service.joinAgreement();
	}
	@PostMapping("joinAgreementPro")
	public String joinAgreementPro(MemberDTO dto) { 
		return service.joinMember(dto);  
	}
	//아이디 중복확인
	@GetMapping("idCheck")
	public @ResponseBody int idCheck(String user_id){
		return service.idCheck(user_id);
	}
	//이메일중복확인
	@GetMapping("emailCheck")
	public @ResponseBody int emailCheck(String email ){
		return service.emailCheck(email);
	}
	//닉네임중복확인
	@GetMapping("nicknameCheck")
	public @ResponseBody int nicknameCheck(String nickname){
		return service.nicknameCheck(nickname);
	}
	//아이디찾기
	@GetMapping("findId")
	public String findId() {
		return service.findId();
	}			  
	
	@PostMapping("findIdPro")
	public @ResponseBody String findIdPro(@RequestParam("name") String name, @RequestParam("phone") String phone, @RequestParam("birth") String birth) {
		System.out.println(name);
		System.out.println(phone);
		System.out.println(birth);
		String result = service.findIdCh(name, phone,birth);
		return result;
	}
	//비밀번호찾기
	@GetMapping("findPw")
	public String findPw() {
		return service.findPw();
	}
	@PostMapping("findPwPro")
	public @ResponseBody String findPwPro(@Param("user_id") String user_id, @Param("name") String name, @Param("phone") String phone) {
		System.out.println(user_id);
		System.out.println(name);
		System.out.println(phone);
		String result = service.findPwCh(user_id,name, phone);
		return result;
	}
	// 회원탈퇴
	@GetMapping("deleteForm")
	public String deleteForm(HttpSession session, Model md) {
		String user_id = (String)session.getAttribute("uid");
		return service.deleteForm(user_id ,md);
	}
	@PostMapping("deletePro")
	public String deletePro(String user_pw, HttpSession session, Model md) {
		String user_id = (String)session.getAttribute("uid");
		int count = service.pwCheck(user_id,user_pw);
		return service.levelChange(count,80,user_id,md,session);
	}
	
	@GetMapping("update")
	public String update(HttpSession session, Model md ,MemberDTO dto) {
		return service.update(session, md, dto);
	}
	@PostMapping("updatePro")
	public String updatePro(MemberDTO dto,Model md,HttpSession session) {
		return service.updateMember(dto,md,session);
	}
	@GetMapping("profileEdit")
	public String profileEdit(MemberDTO dto, Model model, HttpSession session) {
		return service.profileEdit(dto, model, session);
	}
	@PostMapping("profileEditPro")
	public String profileEditPro(MemberDTO dto, MultipartFile upload, HttpServletRequest request) {
		String path = request.getRealPath("/resources/member/img");
		//String path = resourcesPath+"\\member\\profile";
		return service.profileEditPro(dto, upload, path);
	}
	
	
	
	@GetMapping("guest/loginForm")
	public String guestLoginForm() {
		return service.guestLoginForm();
	}
	
	@PostMapping("guest/loginPro")
	public String guestLoginPro(GuestDTO dto, HttpSession session) {
		return service.guestLoginCheck(dto, session);
	}
	
	@GetMapping("guest/guestJoin")
	public String guestJoin() {
		return service.guestJoin();
	}
	
	@PostMapping("guest/guestJoinPro")
	public String guestJoinPro(GuestDTO dto) {
		return service.guestJoinPro(dto);
	}
	
	@GetMapping("myCouponList")
	public String myCouponList(CouponDTO dto, Model model) {
		return service.myCouponList(dto, model, session);
	}
	
	@GetMapping("searchCouponList")
	public String searchCouponList(String search, String searchValue, Model model) {
		return service.searchCouponList(search, searchValue, model);
	}
	
	@GetMapping("myPointList")
	public String myPointList(PointDTO dto, Model model) {
		return service.myPointList(dto, model, session);
	}
	
	@PostMapping("guestIdCheck")
	public @ResponseBody int guestIdCheck(String phone) {
		return service.guestIdCheck(phone);
	}
	
	@GetMapping("couponCount")
	public @ResponseBody String couponCount() {
		return service.couponCount(session);
	}
	
	
}
