package site.filmax.dto;

import lombok.Data;

@Data
public class BranchDTO {
	private int branch_seq;
	private String region;
	private String address;
	private String branchName;
	private int parking;
	private int num;
}
