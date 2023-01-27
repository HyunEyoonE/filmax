package site.filmax.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import site.filmax.dto.BranchDTO;
import site.filmax.dto.CinemaTypeDTO;
import site.filmax.dto.EmailCsDTO;
import site.filmax.dto.EmailCsTypeDTO;
import site.filmax.dto.FaqDTO;
import site.filmax.dto.FaqTypeDTO;
import site.filmax.dto.GroupcsDTO;
import site.filmax.dto.MemberDTO;
import site.filmax.dto.MemberTalkDTO;
import site.filmax.dto.NewsDTO;
import site.filmax.dto.NewsTypeDTO;

public interface CsMapper {
	///////////////////////////////////����
	public List<NewsDTO> selectNewsMain(NewsDTO dto);
	public List<EmailCsTypeDTO> selectEmailCsTypeList();
	public void insertEmailCs(EmailCsDTO emailCsDTO);
	public void updateEmailCsFile(EmailCsDTO emailCsDTO);
	public int insertGroupcs(GroupcsDTO groupcsDTO);
	public List<String> selectRegionList();
	public List<BranchDTO> getBranchByRegion(String region);
	public List<CinemaTypeDTO> getCinemaTypeList();
	public List<String> getRegionByCinemaType(int cinematype);
	public List<HashMap<String, Object>> getBranchByCinemaTypeRegion(Map map);
	public MemberDTO getMemberDTOById(String id);
	///////////////////////////////////����
	public List<NewsDTO> allList();
	public List<NewsDTO> getNewsList(NewsDTO dto);
	public List<NewsTypeDTO> Newstype1(NewsDTO dto);
	public void readCount(int num);
	public NewsDTO NewsReadNum(int num);
	//public NewsDTO NewsGetData(int num);
	public List<NewsTypeDTO> Newstype();
	public List<NewsDTO> selectNews(NewsDTO dto);
	public int newsCount();
	public int newsCount2(int type);
	public List<NewsDTO> searchList(@Param("search")String search,@Param("searchValue")String searchValue,@Param("startNum")int startNum, @Param("endNum")int endNum);
	public int searchcount(@Param("search")String search,@Param("searchValue")String searchValue);
	//������� ����ã�� ����
	public List<FaqDTO> faqAllList();
	public List<FaqDTO> faqtype1(FaqDTO dto);
	public List<FaqDTO> faqlist(FaqDTO dto);
	public int faqCount();
	public int faqCount2(int type);
	public List<FaqTypeDTO> faqtype();
	public void faqReadCount(int num);
	public FaqDTO faqReadNum(int num);
	
	
	public int faqsearchcount(@Param("search") String search, 
							  @Param("searchValue")String searchValue);
	public List<FaqDTO> faqsearchList(@Param("search")String search,
										@Param("searchValue")String searchValue,
										@Param("startNum")int startNum,
										@Param("endNum")int endNum);
}
