package site.filmax.service;

import java.io.File;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.event.TableColumnModelListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import site.filmax.dao.CsMapper;
import site.filmax.dto.BranchDTO;
import site.filmax.dto.EmailCsDTO;
import site.filmax.dto.FaqDTO;
import site.filmax.dto.GroupcsDTO;
import site.filmax.dto.MemberTalkDTO;
import site.filmax.dto.NewsDTO;

@Service
public class CsServiceImpl implements CsService{
	String resourcesPath ="C:\\SpringPractice3\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp2\\wtpwebapps\\filmaxfile";
	
	@Autowired
	CsMapper mapper;
	
	NewsDTO newsDTO = new NewsDTO();
	FaqDTO faqDTO = new FaqDTO();
	
	///////////////////////////////////수영
	@Override
	public String memberTalk() {
		return "cs/membertalk";
	}

	@Override
	public String main(Model model) {
		//메인 이미지 호출
		model.addAttribute("mainImg1", "csmain1.png");
		model.addAttribute("mainImg2", "csmain2.png");
		model.addAttribute("mainImg3", "csmain3.png");
		model.addAttribute("mainImg4", "csmain4.png");
		//뉴스 리스트추가
		newsDTO.setStartNum(1);
		newsDTO.setEndNum(5);
		model.addAttribute("newsList", mapper.selectNewsMain(newsDTO));
		return "cs/main";
	}

	@Override
	public String emailCs(Model model, HttpSession session) {
		if (session.getAttribute("uid") == null) {
			model.addAttribute("msg", "로그인이 필요합니다.");
			model.addAttribute("url", "/member/loginForm");
			return "cs/alert";
		}
		String id = "";
		id = (String)session.getAttribute("uid");
		model.addAttribute("memberDTO", mapper.getMemberDTOById(id));
		//select에 쓸 리스트 모델에 추가
		model.addAttribute("typeList", mapper.selectEmailCsTypeList());
		//지역리스트
		model.addAttribute("regionList", mapper.selectRegionList());
		return "cs/emailCs";
	}

	@Override
	public String emailCsPro(EmailCsDTO emailCsDTO, MultipartFile upload, HttpServletRequest request) {
		//insert 맵퍼 호출
		mapper.insertEmailCs(emailCsDTO);
		//파일 저장
		String path = resourcesPath+"\\cs\\emailcs";
		String orgName = upload.getOriginalFilename();
		if(!orgName.equals("")) { 
			String ext = orgName.substring(orgName.lastIndexOf(".")); 
			String copyName = "emailCsFile_"+emailCsDTO.getEmailcs_seq()+ext;
			File copy = new File(path+"//"+copyName);
			try { 
				upload.transferTo(copy);
			}catch(Exception e) { 
				e.printStackTrace(); 
			}
			emailCsDTO.setFiles(orgName);
			//파일 업데이트
			mapper.updateEmailCsFile(emailCsDTO);
		}
		return "cs/emailCsPro";
	}

	@Override
	public String groupcs(Model model) {
		// 영화관, 지역, 지점 리스트 모델에 추가
		model.addAttribute("cinemaTypeList", mapper.getCinemaTypeList());
		//아래 거 ajax사용해서 새페이지에서 데이터 받아오기
		//cinema테이블에 branch테이블 조인해서 region 추가해서 해당 시네마타입이 존재하는 지역불러오기
		//cinema테이블에 branch테이블 조인해서 region 추가해서 해당 시네마타입과 지역에 있는 지점 불러오기
		// 시간 리스트 모델에 추가
		List<String> timeList = new ArrayList<String>();
		timeList.add("6시 이전");
		for(int i=7; i<24;i++) {
			timeList.add(i+"시");
		}
		timeList.add("23시 이후");
		model.addAttribute("timeList", timeList);
		return "cs/groupcs";
	}

	@Override
	public String groupcsPro(GroupcsDTO groupcsDTO) {
		//데이터 insert
		mapper.insertGroupcs(groupcsDTO);
		return "cs/emailCsPro";
	}

	@Override
	public List<BranchDTO> getBranchByRegion(String region) {
		return mapper.getBranchByRegion(region);
	}

	@Override
	public List<String> getRegionByCinemaType(int cinematype) {
		return mapper.getRegionByCinemaType(cinematype);
	}

	@Override
	public List<HashMap<String, Object>> getBranchByCinemaTypeRegion(int cinematype, String region) {
		// 파라미터 맵에 담아주기
		Map map = new HashMap<String, Object>();
		map.put("cinematype", cinematype);
		map.put("region", region);
		System.out.println(mapper.getBranchByCinemaTypeRegion(map));
		return mapper.getBranchByCinemaTypeRegion(map);
	}
	
	///////////////////////////////////현태
	@Override
	public String list(Model model ,int pageNum, int newstype) {
		//페이징 처리 할때 매퍼 바꾸기
		//페이지 사이즈를 15로 정해둠
		int pageSize = 15;
		//디티오에서 스타트넘버를 1롤 셋해주는 부분
		newsDTO.setStartNum((pageNum-1)*pageSize +1);
		newsDTO.setEndNum(pageNum * pageSize);
		//페이지 사이즈데이터 뷰 단으로 보내주는 부분
		model.addAttribute("pageSize",pageSize);
		
		//newstype이0일때 전체가 나오는 부분과1이 아닐때 나머지를 처래해주는 뷰
		if(newstype==0) {
			model.addAttribute("list",mapper.getNewsList(newsDTO));
			model.addAttribute("count",mapper.newsCount());
		}else {
			newsDTO.setType(newstype);
			model.addAttribute("list",mapper.Newstype1(newsDTO));
			model.addAttribute("count",mapper.newsCount2(newstype));
		}
		//newstype을 뷰로 보내는 부분
		model.addAttribute("type",mapper.Newstype());
		return "cs/newsList";
	}

	@Override
	public String read(int num , Model model) {
		mapper.readCount(num);
		model.addAttribute("dto",mapper.NewsReadNum(num));
		model.addAttribute("dtoPrev",mapper.NewsReadNum(num-1));
		model.addAttribute("dtoNext",mapper.NewsReadNum(num+1));
		//model.addAttribute("data", mapper.NewsGetData(num));
		return "cs/read";
	}
	
	@Override
	public String searchList(String search, String searchValue, Model model,int pageNum) {
		//서치리스트에 페이지 처리부분 서치리스트는 타입을 받을 필요가 없기 때문에 비교적 간단
		//그러나 어려웟음 위 리스트에서 페이지 처리하는 것과 마찬가지로 페이지사이즈와 스타트넘 엔드넘을 정해주고
		//밑에 모델 어트리뷰트를 통해서 뷰로 넘겨주는 부분입니다.
		int pageSize = 15;
		int startNum = (pageNum-1)*pageSize +1;
		int endNum = (pageNum * pageSize);
		/*
		 * newsDTO.setStartNum((pageNum-1)*pageSize +1); newsDTO.setEndNum(pageNum *
		 * pageSize);
		 */
		model.addAttribute("count",mapper.searchcount(search, searchValue));
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("list", mapper.searchList(search, searchValue,startNum,endNum));
		return "cs/searchList";
	}

	@Override
	public String faqlist(Model model, int pageNum, int faqtype) {
		int pageSize = 15;
		faqDTO.setStartNum((pageNum-1)*pageSize+1);
		faqDTO.setEndNum(pageNum*pageSize);
		model.addAttribute("pageSize",pageSize);
		if(faqtype==0) {
			model.addAttribute("faqlist",mapper.faqlist(faqDTO));
			model.addAttribute("count",mapper.faqCount());
		}else {
			faqDTO.setType(faqtype);
			model.addAttribute("faqlist",mapper.faqtype1(faqDTO));
			model.addAttribute("count",mapper.faqCount2(faqtype));
		}
		model.addAttribute("faqtype",mapper.faqtype());
		return "cs/faqList";
	}

	@Override
	public String faqRead(int num, Model model) {
		mapper.faqReadCount(num);
		model.addAttribute("dto",mapper.faqReadNum(num));
		model.addAttribute("dtoPrev",mapper.faqReadNum(num-1));
		model.addAttribute("dtoNext",mapper.faqReadNum(num+1));
		return "cs/faqRead";
	}

	@Override
	public String faqsearchList(String search, String searchValue, Model model, int pageNum) {
		int pageSize = 15;
		int startNum = (pageNum-1)*pageSize +1;
		int endNum = (pageNum * pageSize);
		model.addAttribute("count",mapper.faqsearchcount(search, searchValue));
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("faqlist",mapper.faqsearchList(search, searchValue, startNum, endNum));
		return "cs/faqSearchList";
	}

}
