package site.filmax.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import site.filmax.dao.MemberMapper;
import site.filmax.dto.CouponDTO;
import site.filmax.dto.Coupon_typeDTO;
import site.filmax.dto.GuestDTO;
import site.filmax.dto.MemberDTO;
import site.filmax.dto.PointDTO;

@Service
public class MemberServiceImpl implements MemberService{
	String resourcesPath="C:\\D\\workspace-sts-3.9.18.RELEASE\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\filmaxfile";
	@Autowired
	public MemberMapper mapper;
	
	@Autowired
	private MemberDTO memberDTO;
	
	@Override
	public String main(Model model, HttpSession session) {
		if(session.getAttribute("uid") != null) { // 회원로그인(세션)했다면
			String id = (String)session.getAttribute("uid"); // 세션값을 id로 대입
			model.addAttribute("dto", mapper.getMember(id)); // id를 뷰페이지로 dto로 보냄
			model.addAttribute("couponCount", mapper.couponCount(id));
			model.addAttribute("pointCount", mapper.pointCount(id));
		}
		return "member/main";
	}
	
	public String login(Model md, HttpSession session) {
		String result = "member/loginForm";
		if(session.getAttribute("uid") != null) { // 회원로그인(세션)했다면 마이페이지로 보내줌
			String id = (String)session.getAttribute("uid"); // 세션값을 id로 대입
			md.addAttribute("dto", mapper.getMember(id)); // id를 뷰페이지로 dto로 보냄
			md.addAttribute("couponCount", mapper.couponCount(id));
			md.addAttribute("pointCount", mapper.pointCount(id));
			result = "member/main";
		}
		
		return result;
	}
	public String loginCheck(MemberDTO dto , HttpSession session) {
		String result = "member/loginPro";
		int count = mapper.idCount(dto);
		if(count == 1) {
			session.setAttribute("uid" , dto.getUser_id());
			session.setAttribute("bth", dto.getBirth());
			result = "redirect:/main/home";
		}
		return result;
	}
	
	public String join() {
		return "member/join";
	}
	public String joinMember(MemberDTO dto) {
		mapper.Join(dto);
		mapper.joinPoint(dto); // 회원가입후 포인트지급
		return "member/joinPro";
	}
	public String joinAgreement() {
		return "member/joinAgreement";
	}
	public int idCheck(String user_id) {
		return mapper.idCheck(user_id);
	}
	public int emailCheck(String email) {
		return mapper.emailCheck(email);
	}
	public int nicknameCheck(String nickname) {
		return mapper.nicknameCheck(nickname);
	}
	public String findId() {
		return "member/findId";
	}
	//아이디 찾기
	public String findIdCh(String name, String phone,String birth) {
		String result = "";
		try {
			result = mapper.findId(name,phone,birth);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	//비밀번호찾기
	public String findPwCh(String name, String phone,String user_id) {
		String result = "";
		try {
			result = mapper.findPw(name,phone,user_id);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public String findPw() {
		return "member/findPw";
	}
	public String logout() {
		return "member/logout";
	}
	public String deleteForm(String user_id , Model md) {
		md.addAttribute("dto", mapper.update(user_id));
		return"member/deleteForm";
	}
	//회원 탈퇴시 레별변경
	public String levelChange(int count, int levels, String user_id, Model md, HttpSession session) {
		String levelsName="";
		if(count == 1) {
			mapper.levelChange(levels,user_id);
			levelsName = mapper.levelsNameCh(levels);
			session.invalidate();
		}
		md.addAttribute("count",count);
		md.addAttribute("levelsName",levelsName);
		return "member/deleteLevelsChange";
	}
	//패스워드 체크
	public int pwCheck(String user_id,String user_pw) {
		memberDTO.setUser_id(user_id);
		memberDTO.setUser_pw(user_pw);
		return mapper.idCount(memberDTO);
	}
	//회원정보 수정
	public String update(HttpSession session, Model md,MemberDTO dto) {
		String result = "member/update";
		String user_id = (String)session.getAttribute("uid");
		
		md.addAttribute("dto",mapper.update(user_id));
		return result;
	} 
	public String updateMember(MemberDTO dto,Model md,HttpSession session) {
	
		int count = mapper.idCount(dto); 
		if(count == 1) {
			mapper.updateMember(dto);
		}
		md.addAttribute("count", count);
		return "member/updatePro";
	}
	@Override
	public String profileEdit(MemberDTO dto, Model model, HttpSession session) {
		model.addAttribute("dto", mapper.getMember( (String)session.getAttribute("uid")) );
		return "member/profileEdit";
	}
	@Override
	public String profileEditPro(MemberDTO dto, MultipartFile upload, String path) {
		//path = resourcesPath+"\\member\\profile";
		String orgName = upload.getOriginalFilename();
		dto.setProfile("default.png");
		if(!orgName.equals("")) {
			String ext = orgName.substring(orgName.lastIndexOf("."));
			File copy = new File(path+"//"+dto.getUser_id()+ext);
			try {
				upload.transferTo(copy);
			} catch(Exception e) {
				e.printStackTrace();
			}
			dto.setProfile(dto.getUser_id()+ext);
		}
		mapper.profileEdit(dto);
		return "member/profileEditPro";
	}
	
	public String naverLogin(Model md, HttpSession session) {
		return "member/naverLogin";
	}
	public String naverSuccess(Model md, @RequestParam String code, @RequestParam String state, HttpSession session){
		return "member/naverSuccess";
	}
	
	
	/*  */
	@Override // 내쿠폰목록
	public String myCouponList(CouponDTO dto, Model model, HttpSession session) {
		String id = (String)session.getAttribute("uid");
		model.addAttribute("mylist", mapper.myCouponList(id));
		return "member/myCouponList";
	}
	
	@Override // 쿠폰검색
	public String searchCouponList(String search, String searchValue, Model model) {
		model.addAttribute("clist", mapper.searchCouponList(search, searchValue));
		model.addAttribute("search", search);
		model.addAttribute("searchValue", searchValue);
		return "member/searchCouponList";
	}
	
	@Override // 나의포인트목록
	public String myPointList(PointDTO dto, Model model, HttpSession session) {
		String id = (String)session.getAttribute("uid"); // 로그인 id를 가져옴
		if(id != null) { // 로그인 되었을때만 페이지표시	---	로그아웃되면 로그인페이지로 이동
			model.addAttribute("myplist", mapper.myPointList(id));
		}
		return "member/myPointList";
	}
	
	@Override // 비회원 로그인
	public String guestLoginForm() {
		return "member/guestLoginForm";
	}
	
	@Override // 비회원 로그인확인
	public String guestLoginCheck(GuestDTO dto, HttpSession session) {
		String result = "member/guestLoginPro";
		int count = mapper.guestIdCount(dto);
		if(count == 1) {
			session.setAttribute("guestid", dto.getPhone());
			result = "redirect:/member/main";
		}
		return result;
	}
	
	@Override // 비회원 가입되어있는지 확인
	public int guestIdCheck(String phone) {
		int result = mapper.guestIdCheck(phone);
		return result;
	}
	
	@Override // 비회원 예매 페이지
	public String guestJoin() {
		return "member/guestJoin";
	}
	
	@Override
	public String guestJoinPro(GuestDTO dto) {
		mapper.guestInput(dto);
		return "member/guestJoinPro";
	}

	@Override
	public String couponCount(HttpSession session) {
		String id = (String)session.getAttribute("uid");
		String result = "";
		int count = mapper.couponCount(id);
		if(count > 0) {
			result += count;
		}
		return result;
	}

	
	
}



