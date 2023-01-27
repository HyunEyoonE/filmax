package site.filmax.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import site.filmax.dto.BillerDTO;
import site.filmax.dto.CouponDTO;

public interface PayMapper {
	public int insertBiller(BillerDTO dto);
	
	public List<CouponDTO> myCouponList(String id);
	public List<CouponDTO> GoderCoupon(String id);
	public int pointCount(String user_id);
	
	public int minusPoint(@Param("user_id")String user_id, @Param("usingPoint")int usingPoint);
	public void updateCoupon(@Param("user_id")String user_id, @Param("coupon_type")int coupon_type);
}
