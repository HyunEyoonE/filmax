package site.filmax.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class GuestDTO {
	private boolean ruleagree;
	private String birth;
	private String phone;
	private String password;
	private String password_check;
	private Date joindate;
}
