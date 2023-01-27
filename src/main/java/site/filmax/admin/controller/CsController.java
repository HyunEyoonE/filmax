package site.filmax.admin.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import site.filmax.admin.dto.EreplyDTO;
import site.filmax.admin.dto.FaqDTO;
import site.filmax.admin.dto.GreplyDTO;
import site.filmax.admin.dto.NewsDTO;
import site.filmax.admin.service.CsService;

@Controller
@RequestMapping("/cs/*")
public class CsController {
	
	@Autowired
	private CsService service;
	
	////////////////////////////////////////////////////////한수영씨
	//emailcs
	@GetMapping("emailcsList")
	public String emailcsList(Model model,
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum,
			@RequestParam(value="answerNum", required=false, defaultValue="2") int answerNum,
			@RequestParam(value="orderNum", required=false, defaultValue="0") int orderNum) {
		
		return service.emailcsList(model, pageNum, answerNum, orderNum);
	}
	
	
	
	@GetMapping("emailcsDateSearch")
	public String emailcsDateSearch(Model model,
									@DateTimeFormat(pattern="yyyy-MM-dd")Date startDate,
									@DateTimeFormat(pattern="yyyy-MM-dd")Date endDate,
									@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum) {
		return service.emailcsDateSearch(model, startDate, endDate, pageNum);
	}
	
	@GetMapping("emailcsSearch")
	public String emailcsSearch(Model model,
								@RequestParam(value="cName", required=false, defaultValue="content") String cName,
								@RequestParam(value="cValue", required=false, defaultValue="") String cValue,
								@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum) {
		return service.emailcsSearch(model, cName, cValue, pageNum);
	}
	
	@GetMapping("emailcsRead")
	public String emailcsRead(Model model, int num) {
		return service.emailcsRead(model, num);
	}
	
	@GetMapping("emailcsDownload")
	public void emailcsDownload (HttpServletRequest request,HttpServletResponse response, int num) throws UnsupportedEncodingException {
		service.emailcsDownload(request, response, num);
	}
	
	@PostMapping("emailcsReplyPro")
	public String emailcsReplyPro(Model model, EreplyDTO ereplyDTO) throws Exception {
		return service.emailcsReplyPro(model, ereplyDTO);
	}
	
	//groupcs
	@GetMapping("groupcsList")
	public String groupcsList (Model model,
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum,
			@RequestParam(value="answerNum", required=false, defaultValue="2") int answerNum,
			@RequestParam(value="orderNum", required=false, defaultValue="0") int orderNum) {
		return service.groupcsList(model, pageNum, answerNum, orderNum);
	}
	
	@GetMapping("groupcsDateSearch")
	public String groupcsDateSearch (Model model,
									@DateTimeFormat(pattern="yyyy-MM-dd")Date startDate,
									@DateTimeFormat(pattern="yyyy-MM-dd")Date endDate,
									@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum) {
		return service.groupcsDateSearch(model, startDate, endDate, pageNum);
	}
	
	@GetMapping("groupcsSearch")
	public String groupcsSearch(Model model,
								@RequestParam(value="cName", required=false, defaultValue="content") String cName,
								@RequestParam(value="cValue", required=false, defaultValue="") String cValue,
								@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum) {
		return service.groupcsSearch(model, cName, cValue, pageNum);
	}
	
	@GetMapping("groupcsRead")
	public String groupcsRead(Model model, int num) {
		return service.groupcsRead(model, num);
	}

	@PostMapping("groupcsReplyPro")
	public String groupcsReplyPro(Model model, GreplyDTO greplyDTO) throws Exception {
		return service.groupcsReplyPro(model, greplyDTO);
	}
	
	//////////////////////////////////////////////////////////////////조씨
	@GetMapping("faqList")
	public String faqList(Model model,
				@RequestParam(value="pageNum",required=false,defaultValue="1")int pageNum) {
		return service.faqAllList(model, pageNum);
	}
	@GetMapping("faqForm")
	public String faqinsert(Model model) {
		return service.faqForm(model);
	}
	@PostMapping("faqFormPro")
	public String faqFormPro(FaqDTO faqDTO) {
		return service.faqFormPro(faqDTO);
	}
	@GetMapping("faqRead")
	public String faqReadNum(int num,Model model) {
		return service.faqReadNum(num, model);
	}
	@GetMapping("faqDelete")
	public String faqDelete(int num) {
		return service.faqDelete(num);
	}
	@PostMapping("faqUpdate")
	public String faqUpdate(FaqDTO faqDTO) {
		service.faqUpdate(faqDTO);
		return "cs/faqUpdate";
	}
	@GetMapping("newsList")
	public String newsList(Model model,
							@RequestParam(value="pageNum",required=false,defaultValue="1")int pageNum) {
	return service.newsAllList(model, pageNum);
	}
	@GetMapping("newsForm")
	public String newsinsert(Model model) {
		return service.newsForm(model);
	}
	@PostMapping("newsFormPro")
	public String newsFormPro(NewsDTO newsDTO) {
		return service.newsFormPro(newsDTO);
	}
	@GetMapping("newsRead")
	public String newsReadNum(int num,Model model) {
		return service.newsReadNum(num, model);
	}
	@GetMapping("newsDelete")
	public String newsDelete(int num) {
		return service.newsDelete(num);
	}
	@PostMapping("newsUpdate")
	public String newsUpdate(NewsDTO newsDTO) {
		service.newsUpdate(newsDTO);
		return "cs/newsUpdate";
	}
	@GetMapping("index")
	public String main(Model model) {
		return "cs/index";
	}
	@GetMapping("charts")
	public String charts(Model model) {
		return "cs/charts";
	}
	@GetMapping("tables")
	public String tables(Model model) {
		return "cs/tables";
	}
	@GetMapping("buttons")
	public String buttons(Model model) {
		return "cs/buttons";
	}
	@GetMapping("cards")
	public String cards(Model model) {
		return "cs/cards";
	}
}
