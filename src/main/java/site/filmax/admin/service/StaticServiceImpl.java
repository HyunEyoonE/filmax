package site.filmax.admin.service;

import java.text.NumberFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import site.filmax.admin.dao.StaticMapper;
import site.filmax.admin.dto.CinemaTypeDTO;

@Service
public class StaticServiceImpl implements StaticService {
	//default color name List
	List<String> colorNameList = new ArrayList<String>();
	//default color code List
	List<String> colorCodeList = new ArrayList<String>();
	
	//생성자
	public StaticServiceImpl() {
		//default color name List 값 넣기
		colorNameList.add("primary");
		colorNameList.add("success");
		colorNameList.add("info");
		colorNameList.add("warning");
		colorNameList.add("danger");
		colorNameList.add("secondary");
		colorNameList.add("light");
		colorNameList.add("dark");
		//default color name List 값 넣기
		colorCodeList.add("#4e73df");
		colorCodeList.add("#1cc88a");
		colorCodeList.add("#36b9cc");
		colorCodeList.add("#f6c23e");
		colorCodeList.add("#e74a3b");
		colorCodeList.add("#858796");
		colorCodeList.add("#f8f9fc");
		colorCodeList.add("#5a5c69");
	}	
	
	@Autowired
	private StaticMapper mapper;

	@Override
	public String dashboard(Model model) {
		//상단 카드 데이터
		//현재 날짜 구하기
        LocalDate now = LocalDate.now();
        // 포맷 정의
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM");
        // 포맷 적용
        String formatedNow = now.format(formatter);
        //이달 매출
        int thisMonthAllpay = mapper.sumThisMonthAllpay(formatedNow+"/01");
        // 콤마 찍는 포멧터 호출
        NumberFormat numberFormat = NumberFormat.getInstance();
        // 변화
        String thisMonthAllpayStr = numberFormat.format(thisMonthAllpay);
        // 모델에 추가
        model.addAttribute("thisMonthAllpay", thisMonthAllpayStr);
        // 미답변 문의 수
        model.addAttribute("countNotAnswered", mapper.countEmailNotAnswered()+mapper.countGroupNotAnswered());
		
		
		// 전체 상영관 비율 차트
		// 상영관 타입 DTO 리스트 받아오기
		List<CinemaTypeDTO> cinemaTypeList = new ArrayList<CinemaTypeDTO>();
		cinemaTypeList = mapper.selectCinemaType();
		// 모델에 보내줄 배열(cinemaTypeLbel, cinemaTypeCount) 생성
		String[] cinemaTypeLabelArr = new String[cinemaTypeList.size()];
		int[] cinemaTypeCountArr = new int[cinemaTypeList.size()];
		List<Map> cinemaTypeLabelColorList = new ArrayList<Map>();
		String[] cinemaTypeColorCodeArr = new String[cinemaTypeList.size()];
		// 타입별로 카운트 세서 배열에 저장
		for(int i = 0; i < cinemaTypeList.size(); i++) {
			//name = 상영관 종류 이름
			cinemaTypeLabelArr[i] = cinemaTypeList.get(i).getTypeName();
			//count = 상영관 종류 갯수
			cinemaTypeCountArr[i] = mapper.countCinemaByCinemaTypeSeq(cinemaTypeList.get(i).getCinemaType_seq());
			//색 이름, 라벨 해쉬맵 만들어서 리스트에 추가
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("colorName", colorNameList.get(i));
			map.put("labelName", cinemaTypeLabelArr[i]);
			cinemaTypeLabelColorList.add(map);
			//색 코드
			cinemaTypeColorCodeArr[i] = colorCodeList.get(i);
		}
		//모델에 데이터 추가
		model.addAttribute("cinemaTypeLabelArr", cinemaTypeLabelArr);
		model.addAttribute("cinemaTypeCountArr", cinemaTypeCountArr);
		model.addAttribute("cinemaTypeLabelColorNameList", cinemaTypeLabelColorList);
		model.addAttribute("cinemaTypeColorCodeArr", cinemaTypeColorCodeArr);
		
		//1년간 총 매출 그래프
        // 년 월 잘라서 배열에 저장
        String[] yearDayArr = formatedNow.split("/");
        // 계산을 위해 숫자로 변경
        int todayYear = Integer.parseInt(yearDayArr[0]);
        int todayMonth = Integer.parseInt(yearDayArr[1]);
        // 현재 월 1일 기준으로 endDate에 저장
        String month = "";
        if(todayMonth < 10) {
        	month = "0"+todayMonth;
        }
        String endDate = todayYear+"/"+month+"/01";
        // 
        for(int i = 0; i < 12; i++) {
        	--todayMonth;
        	if(todayMonth == 0) {
        		--todayYear;
        		todayMonth = 12;
        	}
        }
        // 12달 전 1일 기준으로 startDate에 저장
        if(todayMonth < 10) {
        	month = "0"+todayMonth;
        }
        String startDate = todayYear+"/"+month+"/01";
        model.addAttribute("sumAllpayByMonthList", mapper.sumAllpayByMonth(startDate, endDate));
        //연매출 모델에 추가
        int yearAllpay = mapper.sumYearAllpay(startDate, endDate);
        String yearAllpayStr = numberFormat.format(yearAllpay);
        model.addAttribute("yearAllpay", yearAllpayStr);
        
        //매출탑5영화
        String descOrNot ="desc";
        //1등부터 5등까지
        int startRNum = 1;
        int endRNum = 5;
        //모델에 보내기
        model.addAttribute("movieTop5", mapper.selectMovieTop5ByAllpay(startDate, endDate, descOrNot, startRNum, endRNum));
        model.addAttribute("colorNameList", colorNameList);
        //매출하위5영화
        descOrNot ="";
        model.addAttribute("movieBottom5", mapper.selectMovieTop5ByAllpay(startDate, endDate, descOrNot, startRNum, endRNum));
		return "static/dashboard";
	}
}
