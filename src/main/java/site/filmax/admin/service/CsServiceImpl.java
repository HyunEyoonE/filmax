package site.filmax.admin.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import site.filmax.admin.dao.CsMapper;
import site.filmax.admin.dto.EreplyDTO;
import site.filmax.admin.dto.FaqDTO;
import site.filmax.admin.dto.GreplyDTO;
import site.filmax.admin.dto.NewsDTO;

@Service
public class CsServiceImpl implements CsService{
	//파일 서버 경로
	String resourcesPath ="C:\\SpringPractice3\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp2\\wtpwebapps\\filmaxfile";
	
	@Autowired
	private CsMapper mapper;
	
	//////////////////////////////////////////////////////한씨
	//emailcs
	@Override
	public String emailcsList(Model model, int pageNum, int answerNum, int orderNum) {
		//기본 변수 선언
		//페이지당 글 수
		int pageSize = 3;
		//리스트 시작번호 끝 번호
		int startNum = pageSize*(pageNum-1)+1;
		int endNum = pageSize*pageNum;
	
		//맵퍼에 들어갈 정렬 스트링 처리
		String descOrNot ="desc";
		if(orderNum == 1) {
			descOrNot = "";
		}
		//맵퍼에 들어갈 답변 여부 스트링 처리
		String whereAnswered = "";
		if(answerNum == 0) {
			whereAnswered = "and emailcs.isanswered = 0";
		} else if(answerNum == 1) {
			whereAnswered = "and emailcs.isanswered = 1";
		}
		
		//리스트 넘기기
		model.addAttribute("emailList", mapper.selectEmailAllList(startNum, endNum, whereAnswered, descOrNot));
		//카운트 맵퍼에 들어갈 조건절 정리
		String countWhere = "";
		if(answerNum == 0) {
			countWhere = "where isanswered = 0";
		} else if(answerNum == 1) {
			countWhere = "where isanswered = 1";
		}
		//페이지갯수 보내기
		int count = mapper.countEmailAllList(countWhere);
		int pageCount = count/pageSize;
		if(count%pageSize > 0) {
			pageCount++;
		}
		model.addAttribute("pageCount", pageCount);

		//상태값 전부 보내기
		model.addAttribute("currPage", pageNum);
		model.addAttribute("currAnswer", answerNum);
		model.addAttribute("currOrder", orderNum);
		//답변 미완료 갯수 보내기
		model.addAttribute("countNotAnswered", mapper.countEmailNotAnswered());
		return "cs/emailcsList";
	}

	@Override
	public String emailcsDateSearch(Model model, Date startDate, Date endDate, int pageNum) {
		//페이지당 글 수
		int pageSize = 3;
		//리스트 시작번호 끝 번호
		int startNum = pageSize*(pageNum-1)+1;
		int endNum = pageSize*pageNum;
		//리스트 받아 올 맵퍼 들고 오기
		model.addAttribute("emailList", mapper.searchDateEmailList(startDate, endDate, startNum, endNum));
		//페이지갯수 보내기
		int count = mapper.countDateEmailList(startDate, endDate);
		int pageCount = count/pageSize;
		if(count%pageSize > 0) {
			pageCount++;
		}
		model.addAttribute("pageCount", pageCount);
		//상태값 보내기
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		model.addAttribute("startDate", simpleDateFormat.format(startDate));
		model.addAttribute("endDate", simpleDateFormat.format(endDate));
		model.addAttribute("currPage", pageNum);
		//답변 미완료 갯수 보내기
		model.addAttribute("countNotAnswered", mapper.countEmailNotAnswered());
		return "cs/emailcsDateSearch";
	}

	@Override
	public String emailcsSearch(Model model, String cName, String cValue, int pageNum) {
		//페이지당 글 수
		int pageSize = 3;
		//리스트 시작번호 끝 번호
		int startNum = pageSize*(pageNum-1)+1;
		int endNum = pageSize*pageNum;
		//리스트 받아 올 맵퍼 들고 오기
		model.addAttribute("emailList", mapper.searchEmailList(cName, cValue, startNum, endNum));
		//페이지갯수 보내기
		int count = mapper.countSearchEmailList(cName, cValue);
		int pageCount = count/pageSize;
		if(count%pageSize > 0) {
			pageCount++;
		}
		model.addAttribute("pageCount", pageCount);
		//상태값 보내기
		model.addAttribute("currPage", pageNum);
		model.addAttribute("cName", cName);
		model.addAttribute("cValue", cValue);
		//답변 미완료 갯수 보내기
		model.addAttribute("countNotAnswered", mapper.countEmailNotAnswered());
		return "cs/emailcsSearch";
	}

	@Override
	public String emailcsRead(Model model, int num) {
		//문의 글 데이터 전달
		model.addAttribute("emailcsDTO", mapper.readEmailBySeq(num));
		//답변 글 데이터 전달
		model.addAttribute("ereplyDTO", mapper.readEreplyByEmailcsSeq(num));
		return "cs/emailcsRead";
	}

	@Override
	public void emailcsDownload(HttpServletRequest request, HttpServletResponse response, int num) throws UnsupportedEncodingException {
		//파일이 있는 경로 가져오기
		//String path =  request.getRealPath("/resources/cs/emailcs");
	    //원래 파일 이름
	    String downname = mapper.getEmailFilesBySeq(num);
		//저장된 파일 이름
	    String ext = downname.substring(downname.lastIndexOf("."));
		String filename = "emailCsFile_"+num+ext;
		
	    String realPath = "";
	    
	    try {
	        String browser = request.getHeader("User-Agent"); 
	        //파일 인코딩 
	        if (browser.contains("MSIE") || browser.contains("Trident")
	                || browser.contains("Chrome")) {
	            filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+",
	                    "%20");
	        } else {
	            filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
	        }
	    } catch (UnsupportedEncodingException ex) {
	        System.out.println("UnsupportedEncodingException");
	    }
	    realPath = resourcesPath + "\\cs\\emailcs\\" +downname;
	    File file1 = new File(realPath);
	    if (!file1.exists()) {
	        return ;
	    }
	      
	    // 파일명 지정        
	    response.setContentType("application/octer-stream");
	    response.setHeader("Content-Transfer-Encoding", "binary;");
	    response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
	    try {
	        OutputStream os = response.getOutputStream();
	        FileInputStream fis = new FileInputStream(realPath);
	           int ncount = 0;
	        byte[] bytes = new byte[512];
	           while ((ncount = fis.read(bytes)) != -1 ) {
	            os.write(bytes, 0, ncount);
	        }
	        fis.close();
	        os.close();
	    } catch (FileNotFoundException ex) {
	        System.out.println("FileNotFoundException");
	    } catch (IOException ex) {
	        System.out.println("IOException");
	    }
	}

	@Override
	public String emailcsReplyPro(Model model, EreplyDTO ereplyDTO) throws Exception {
		//이메일 발송
		Email email = new SimpleEmail();
		email.setHostName("smtp.naver.com");
		email.setSmtpPort(465);
		email.setCharset("utf-8"); // 인코딩 설정(utf-8, euc-kr)
		email.setAuthenticator(new DefaultAuthenticator("filmaxtest", "@filmax1234"));
		email.setSSL(true);
		email.setFrom("filmaxtest@naver.com", "FILMAX");
		email.setSubject(ereplyDTO.getTitle());
		email.setMsg(ereplyDTO.getContent());
		email.addTo(ereplyDTO.getEmail());
		email.send();

		//디비에 답장 저장
		mapper.insertEmailReply(ereplyDTO);
		//답변여부 수정
		mapper.updateEmailAnswered(ereplyDTO.getEmailcs_seq());
		//모델에 글번호 전달
		model.addAttribute("num", ereplyDTO.getEmailcs_seq());
		return "cs/emailcsReplyPro";
	}
	
	//groupcs
	@Override
	public String groupcsList(Model model, int pageNum, int answerNum, int orderNum) {
		//기본 변수 선언
		//페이지당 글 수
		int pageSize = 3;
		//리스트 시작번호 끝 번호
		int startNum = pageSize*(pageNum-1)+1;
		int endNum = pageSize*pageNum;
	
		//맵퍼에 들어갈 정렬 스트링 처리
		String descOrNot ="desc";
		if(orderNum == 1) {
			descOrNot = "";
		}
		//맵퍼에 들어갈 답변 여부 스트링 처리
		String whereAnswered = "";
		if(answerNum == 0) {
			whereAnswered = "and groupcs.isanswered = 0";
		} else if(answerNum == 1) {
			whereAnswered = "and groupcs.isanswered = 1";
		}
		
		//리스트 넘기기
		model.addAttribute("groupList", mapper.selectGroupAllList(startNum, endNum, whereAnswered, descOrNot));
		//카운트 맵퍼에 들어갈 조건절 정리
		String countWhere = "";
		if(answerNum == 0) {
			countWhere = "where isanswered = 0";
		} else if(answerNum == 1) {
			countWhere = "where isanswered = 1";
		}
		//페이지갯수 보내기
		int count = mapper.countGroupAllList(countWhere);
		int pageCount = count/pageSize;
		if(count%pageSize > 0) {
			pageCount++;
		}
		model.addAttribute("pageCount", pageCount);
		//상태값 전부 보내기
		model.addAttribute("currPage", pageNum);
		model.addAttribute("currAnswer", answerNum);
		model.addAttribute("currOrder", orderNum);
		//답변 미완료 갯수 보내기
		model.addAttribute("countNotAnswered", mapper.countGroupNotAnswered());
		
		return "cs/groupcsList";
	}

	@Override
	public String groupcsDateSearch(Model model, Date startDate, Date endDate, int pageNum) {
		//페이지당 글 수
		int pageSize = 3;
		//리스트 시작번호 끝 번호
		int startNum = pageSize*(pageNum-1)+1;
		int endNum = pageSize*pageNum;
		//리스트 받아 올 맵퍼 들고 오기
		model.addAttribute("groupList", mapper.searchDateGroupList(startDate, endDate, startNum, endNum));
		//페이지갯수 보내기
		int count = mapper.countDateGroupList(startDate, endDate);
		int pageCount = count/pageSize;
		if(count%pageSize > 0) {
			pageCount++;
		}
		model.addAttribute("pageCount", pageCount);
		//상태값 보내기
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		model.addAttribute("startDate", simpleDateFormat.format(startDate));
		model.addAttribute("endDate", simpleDateFormat.format(endDate));
		model.addAttribute("currPage", pageNum);
		//답변 미완료 갯수 보내기
		model.addAttribute("countNotAnswered", mapper.countGroupNotAnswered());
		return "cs/groupcsDateSearch";
	}

	@Override
	public String groupcsSearch(Model model, String cName, String cValue, int pageNum) {
		//페이지당 글 수
		int pageSize = 3;
		//리스트 시작번호 끝 번호
		int startNum = pageSize*(pageNum-1)+1;
		int endNum = pageSize*pageNum;
		//리스트 받아 올 맵퍼 들고 오기
		model.addAttribute("groupList", mapper.searchGroupList(cName, cValue, startNum, endNum));
		//페이지갯수 보내기
		int count = mapper.countSearchGroupList(cName, cValue);
		int pageCount = count/pageSize;
		if(count%pageSize > 0) {
			pageCount++;
		}
		model.addAttribute("pageCount", pageCount);
		//상태값 보내기
		model.addAttribute("currPage", pageNum);
		model.addAttribute("cName", cName);
		model.addAttribute("cValue", cValue);
		//답변 미완료 갯수 보내기
		model.addAttribute("countNotAnswered", mapper.countGroupNotAnswered());
		return "cs/groupcsSearch";
	}

	@Override
	public String groupcsRead(Model model, int num) {
		//문의 글 데이터 전달
		model.addAttribute("groupcsDTO", mapper.readGroupBySeq(num));
		//답변 글 데이터 전달
		model.addAttribute("greplyDTO", mapper.readGreplyByGroupcsSeq(num));
		return "cs/groupcsRead";
	}

	@Override
	public String groupcsReplyPro(Model model, GreplyDTO greplyDTO) throws Exception {
		//이메일 발송
		Email email = new SimpleEmail();
		email.setHostName("smtp.naver.com");
		email.setSmtpPort(465);
		email.setCharset("utf-8"); // 인코딩 설정(utf-8, euc-kr)
		email.setAuthenticator(new DefaultAuthenticator("filmaxtest", "@filmax1234"));
		email.setSSL(true);
		email.setFrom("filmaxtest@naver.com", "FILMAX");
		email.setSubject(greplyDTO.getTitle());
		email.setMsg(greplyDTO.getContent());
		email.addTo(greplyDTO.getEmail());
		email.send();
		//디비에 답장 저장
		mapper.insertGroupReply(greplyDTO);
		//답변여부 수정
		mapper.updateGroupAnswered(greplyDTO.getGroupcs_seq());
		//모델에 글번호 전달
		model.addAttribute("num", greplyDTO.getGroupcs_seq());
		return "cs/groupcsReplyPro";
	}
	
	/////////////////////////////////////////////////////////////////조씨
	@Override
	public String faqAllList(Model model, int pageNum) {
		//페이지 시작 번호
		int pageSize = 15;
		//리스트 시작번호 끝 번호
		int startNum = pageSize*(pageNum-1)+1;
		int endNum = pageSize*pageNum;
		//리스트 넘기기
		model.addAttribute("faqList",mapper.faqAllList(startNum, endNum));
		//페이지갯수 보내기
		
		int count = mapper.countFaqList();
		int pageCount = count/pageSize;
		if(count%pageSize > 0) {
			pageCount++;
		}
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("currPage", pageNum);
		return "cs/faqList";
	}

	@Override
	public String faqForm(Model model) {
		model.addAttribute("faqtype",mapper.faqtype());
		return "cs/faqForm";
	}

	@Override
	public String faqFormPro(FaqDTO faqDTO) {
		mapper.faqinsert(faqDTO);
		return "cs/faqFormPro";
	}

	@Override
	public String faqReadNum(int num, Model model) {
		model.addAttribute("faqTypeDTOList",mapper.faqtype());
		model.addAttribute("dto",mapper.faqReadNum(num));
		return "cs/faqRead";
	}

	@Override
	public String faqDelete(int num) {
		mapper.faqDelete(num);
		return "cs/faqDelete";
	}

	@Override
	public String faqUpdate(FaqDTO faqDTO) {
		System.out.println(faqDTO);
		mapper.faqUpdate(faqDTO);
		return "cs/faqUdate";
	}

	@Override
	public String newsAllList(Model model, int pageNum) {
		int pageSize = 15;
		int startNum = pageSize * (pageNum-1)+1;
		int endNum = pageSize*pageNum;
		model.addAttribute("newsList",mapper.newsAllList(startNum, endNum));
		
		int count = mapper.countNewsList();
		int pageCount = count/pageSize;
		if(count%pageSize >0){
			pageCount++;
		}
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("currPage",pageNum);
		return "cs/newsList";
	}

	@Override
	public String newsForm(Model model) {
		model.addAttribute("newstype",mapper.newstype());
		return "cs/newsForm";
	}

	@Override
	public String newsFormPro(NewsDTO newsDTO) {
		mapper.newsinsert(newsDTO);
		return "cs/newsFormPro";
	}

	@Override
	public String newsReadNum(int num, Model model) {
		model.addAttribute("newsTypeDTOList",mapper.newstype());
		model.addAttribute("dto",mapper.newsReadNum(num));
		return "cs/newsRead";
	}

	@Override
	public String newsDelete(int num) {
		mapper.newsDelete(num);
		return "cs/newsDelete";
	}

	@Override
	public String newsUpdate(NewsDTO newsDTO) {
		mapper.newsUpdate(newsDTO);
		return "cs/newsUpdate";
	}
}
