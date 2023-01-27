package site.filmax.admin.service;

import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.ui.Model;

import site.filmax.admin.dto.EreplyDTO;
import site.filmax.admin.dto.FaqDTO;
import site.filmax.admin.dto.GreplyDTO;
import site.filmax.admin.dto.NewsDTO;

public interface CsService {
	///////////////////////////////////////////////한씨
	//emailcs
	public String emailcsList(Model model, int pageNum, int answerNum, int orderNum);
	public String emailcsDateSearch(Model model, Date startDate, Date endDate, int pageNum);
	public String emailcsSearch(Model model, String cName, String cValue, int pageNum);
	public String emailcsRead(Model model, int num);
	public void emailcsDownload (HttpServletRequest request,HttpServletResponse response, int num) throws UnsupportedEncodingException;
	public String emailcsReplyPro(Model model, EreplyDTO ereplyDTO) throws Exception;
	//groupcs
	public String groupcsList(Model model, int pageNum, int answerNum, int orderNum);
	public String groupcsDateSearch(Model model, Date startDate, Date endDate, int pageNum);
	public String groupcsSearch(Model model, String cName, String cValue, int pageNum);
	public String groupcsRead(Model model, int num);
	public String groupcsReplyPro(Model model, GreplyDTO greplyDTO) throws Exception;
	///////////////////////////////////////////////조씨
	//faq
	public String faqAllList(Model model , int pageNum);
	public String faqForm(Model model);
	public String faqFormPro(FaqDTO faqDTO);
	public String faqReadNum(int num, Model model);
	public String faqDelete(int num);
	public String faqUpdate(FaqDTO faqDTO);
	//news
	public String newsAllList(Model model , int pageNum);
	public String newsForm(Model model);
	public String newsFormPro(NewsDTO newsDTO);
	public String newsReadNum(int num,Model model);
	public String newsDelete(int num);
	public String newsUpdate(NewsDTO newsDTO);

}
