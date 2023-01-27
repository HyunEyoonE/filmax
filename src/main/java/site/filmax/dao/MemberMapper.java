package site.filmax.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import site.filmax.dto.CouponDTO;
import site.filmax.dto.Coupon_typeDTO;
import site.filmax.dto.GuestDTO;
import site.filmax.dto.MemberDTO;
import site.filmax.dto.PointDTO;

public interface MemberMapper {
	
	public int idCount(MemberDTO dto);
	public int Join(MemberDTO dto);
	public int idCheck(String user_id);
	public int emailCheck(String email);
	public int nicknameCheck(String nickname);
	
	//아이디 찾기
	public String findId(@Param("name") String name, @Param("phone") String phone, @Param("birth") String birth);
	//비밀번호 찾기
	public String findPw(@Param("user_id") String user_id, @Param("name") String name, @Param("phone") String phone);
	
	public void levelChange(@Param("levels")int levels , @Param("user_id")String user_id); //회원탈퇴
	public String levelsNameCh(int levels);
	
	public MemberDTO update(String user_id);
	public int updateMember(MemberDTO dto);
	public void loginTime(MemberDTO dto); // 최종 로그인 시간
	public int profileEdit(MemberDTO dto);
	
	
	public MemberDTO getMember(String user_id);
	public List<MemberDTO> member_id();
	public List<GuestDTO> guestList();
	public List<CouponDTO> myCouponList(String user_id);
	public List<CouponDTO> searchCouponList(
			@Param("search") String search,
			@Param("searchValue") String searchValue);
	public List<Coupon_typeDTO> coupon_typeList(Coupon_typeDTO dto);
	public List<CouponDTO> coupon_id(String idCoupon);
	
	public int couponCount(String user_id);
	public int pointCount(String user_id);
	public List<PointDTO> point_id(String idPoint);
	public List<PointDTO> myPointList(String user_id);
	public int guestIdCount(GuestDTO dto);
	public int guestIdCheck(String phone);
	public int guestInput(GuestDTO dto);
	
	public int joinPoint(MemberDTO dto);
	public int pointUpdate(MemberDTO dto);
	
}

