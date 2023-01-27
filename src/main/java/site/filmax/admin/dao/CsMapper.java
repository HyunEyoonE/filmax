package site.filmax.admin.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import site.filmax.admin.dto.EmailCsDTO;
import site.filmax.admin.dto.EreplyDTO;
import site.filmax.admin.dto.FaqDTO;
import site.filmax.admin.dto.FaqTypeDTO;
import site.filmax.admin.dto.GreplyDTO;
import site.filmax.admin.dto.GroupcsDTO;
import site.filmax.admin.dto.NewsDTO;
import site.filmax.admin.dto.NewsTypeDTO;

public interface CsMapper {
	///////////////////////////////////////////////////한씨
	//emailcs
	public List<EmailCsDTO> selectEmailAllList(@Param("startNum") int startNum,
												@Param("endNum") int endNum,
												@Param("whereAnswered") String whereAnswered,
												@Param("descOrNot") String descOrNot);
	public int countEmailAllList(@Param("countWhere") String countWhere);
	public int countEmailNotAnswered();
	public List<EmailCsDTO> searchDateEmailList(@Param("startDate") Date startDate,
												@Param("endDate") Date endDate,
												@Param("startNum") int startNum,
												@Param("endNum") int endNum);
	public int countDateEmailList(@Param("startDate") Date startDate,
									@Param("endDate") Date endDate);
	public List<EmailCsDTO> searchEmailList(@Param("cName") String cName,
											@Param("cValue") String cValue,
											@Param("startNum") int startNum,
											@Param("endNum") int endNum);
	public int countSearchEmailList(@Param("cName") String cName,
									@Param("cValue") String cValue);
	public EmailCsDTO readEmailBySeq(int num);
	public String getEmailFilesBySeq(int num);
	public int insertEmailReply(EreplyDTO ereplyDTO);
	public int updateEmailAnswered(int emailcs_seq);
	public EreplyDTO readEreplyByEmailcsSeq(int emailcs_seq);
	//groupcs
	public List<GroupcsDTO> selectGroupAllList(@Param("startNum") int startNum,
												@Param("endNum") int endNum,
												@Param("whereAnswered") String whereAnswered,
												@Param("descOrNot") String descOrNot);
	public int countGroupAllList(@Param("countWhere") String countWhere);
	public int countGroupNotAnswered();
	public List<GroupcsDTO> searchDateGroupList(@Param("startDate") Date startDate,
												@Param("endDate") Date endDate,
												@Param("startNum") int startNum,
												@Param("endNum") int endNum);
	public int countDateGroupList(@Param("startDate") Date startDate,
								@Param("endDate") Date endDate);
	public List<GroupcsDTO> searchGroupList(@Param("cName") String cName,
											@Param("cValue") String cValue,
											@Param("startNum") int startNum,
											@Param("endNum") int endNum);
	public int countSearchGroupList(@Param("cName") String cName,
									@Param("cValue") String cValue);
	public GroupcsDTO readGroupBySeq(int num);
	public int insertGroupReply(GreplyDTO greplyDTO);
	public int updateGroupAnswered(int emailcs_seq);
	public GreplyDTO readGreplyByGroupcsSeq(int groupcs_seq);
	///////////////////////////////////////////////////////////////////////조씨
	//faq
	public List<FaqDTO> faqAllList(@Param("startNum") int startNum,
									@Param("endNum") int endNum); 
	public int countFaqList();
	public void faqinsert(FaqDTO faqDTO);
	public List<FaqTypeDTO> faqtype();
	public FaqDTO faqReadNum(int num);
	public int faqDelete(int num);
	public void faqUpdate(FaqDTO faqDTO);
	//news
	public List<NewsDTO> newsAllList(@Param("startNum")int startNum,
				@Param("endNum")int endNum);	
	public int countNewsList();
	public void newsinsert(NewsDTO newsDTO);
	public List<NewsTypeDTO> newstype();
	public NewsDTO newsReadNum(int num);
	public int newsDelete(int num);
	public void newsUpdate(NewsDTO newsDTO);
}
