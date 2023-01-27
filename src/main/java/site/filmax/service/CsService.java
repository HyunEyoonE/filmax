package site.filmax.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import site.filmax.dto.BranchDTO;
import site.filmax.dto.EmailCsDTO;
import site.filmax.dto.GroupcsDTO;

public interface CsService {
	///////////////////////////////////수영
	public String memberTalk();
	public String main(Model model);
	public String emailCs(Model model, HttpSession session);
	public String emailCsPro(EmailCsDTO emailCsDTO, MultipartFile upload, HttpServletRequest request);
	public String groupcs(Model model);
	public String groupcsPro(GroupcsDTO groupcsDTO);
	public List<BranchDTO> getBranchByRegion(String region);
	public List<String> getRegionByCinemaType(int cinematype);
	public List<HashMap<String, Object>> getBranchByCinemaTypeRegion(int cinematype, String region);
	///////////////////////////////////현태
	public String list(Model model , int pageNum, int newstype);
	public String read(int num , Model model);
	public String searchList(String search, String searchValue, Model model,int pageNum);
	//여기부터 자주찾는 질문
	public String faqlist(Model model , int pageNum, int faqtype);
	public String faqRead(int num,Model model);
	public String faqsearchList(String search, String searchValue,Model model,int pageNum);
}
