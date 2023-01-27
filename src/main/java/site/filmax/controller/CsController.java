package site.filmax.controller;

import java.net.http.HttpRequest;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.support.incrementer.AbstractSequenceMaxValueIncrementer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import site.filmax.dto.BranchDTO;
import site.filmax.dto.EmailCsDTO;
import site.filmax.dto.GroupcsDTO;
import site.filmax.service.CsService;

@Controller
@RequestMapping("/cs/*")
public class CsController {
	
	@Autowired
	private CsService service;
	
	///////////////////////////////////수영
	@GetMapping("membertalk")
	public String memberTalk() {
		return service.memberTalk();
	}
	
	@GetMapping("main")
	public String main(Model model) {
		return service.main(model);
	}
	
	@GetMapping("emailCs")
	public String emailCs(Model model, HttpSession session) {
		return service.emailCs(model, session);
	}
	
	@PostMapping("emailCsPro")
	public String emailCsPro(EmailCsDTO emailCsDTO, MultipartFile upload, HttpServletRequest request) {
		return service.emailCsPro(emailCsDTO, upload, request);
	}
	
	@GetMapping("groupcs")
	public String groupcs(Model model) {
		return service.groupcs(model);
	}
	
	@PostMapping("groupcsPro")
	public String groupcsPro(GroupcsDTO groupcsDTO) {
		return service.groupcsPro(groupcsDTO);
	}
	
	@GetMapping("getBranchByRegion")
	public @ResponseBody List<BranchDTO> getBranchByRegion(String region){
		return service.getBranchByRegion(region);
	}
	
	@GetMapping("getRegionByCinemaType")
	public @ResponseBody List<String> getRegionByCinemaType(int cinematype){
		return service.getRegionByCinemaType(cinematype);
	}
	
	@GetMapping("getBranchByCinemaTypeRegion")
	public @ResponseBody List<HashMap<String, Object>> getBranchByCinemaTypeRegion(int cinematype, String region){
		return service.getBranchByCinemaTypeRegion(cinematype, region);
	}
	
	///////////////////////////////////현태
	@GetMapping("newsList")
	public String news(Model model , 
		@RequestParam(value = "pageNum" , required=false, defaultValue="1")int pageNum,
						//		파라미터이름 		필수여부 		값이안넘어올떄 기본값 
		@RequestParam(value="newstype",required=false,defaultValue="0")int newstype){

		return service.list(model,pageNum,newstype);
	}
	
	@GetMapping("read")
	public String read(int num,Model model) {
		return service.read(num, model);
	}
	
	@GetMapping("searchList")
	public String searchList(String search, String searchValue, Model model,
			@RequestParam(value = "pageNum" , required=false, defaultValue="1")int pageNum) {
		return service.searchList(search, searchValue, model,pageNum);
	}
	//여기부터 자주찾는 질문
	@GetMapping("faqList")
	public String faqList(Model model ,
			@RequestParam(value = "pageNum", required=false,defaultValue="1")int pageNum,
			@RequestParam(value="faqtype",required=false,defaultValue="0")int faqtype){
		return service.faqlist(model,pageNum,faqtype);
	}
	@GetMapping
	public String faqRead(int num , Model model) {
		return service.faqRead(num, model);
	}
	@GetMapping("faqSearchList")
	public String faqSearchList(String search,String searchValue,Model model,
			@RequestParam(value="pageNum",required=false,defaultValue="1")int pageNum) {
		return service.faqsearchList(search, searchValue, model, pageNum);
	}
}
