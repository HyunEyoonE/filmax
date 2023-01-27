package site.filmax.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;


import site.filmax.dao.moviesMapper;
import site.filmax.dto.MoviesDTO;
import site.filmax.dto.reviewDTO;
import site.filmax.dto.reviewLikeDTO;

@Service
public class moviesServiceImpl implements moviesService {
	String resourcesPath = "C:\\spring2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp3\\wtpwebapps\\filmaxfile\\poster";
	@Autowired 
	private moviesMapper mapper;
	
	@Override
	public String moviesList(Model model) {		
		model.addAttribute("list", mapper.moviesList());
				
		return "movies/movies_Chart";
	}
	public String onScreenList(Model model) {
		model.addAttribute("onScreen", mapper.onScreen());
		return "movies/movies_Chart2";
	}
	@Override
	public String movieDetail(int movie_seq,Model model,reviewDTO dto2,HttpSession session) {		
		MoviesDTO dto =  mapper.movieDetail(movie_seq);			
		String id = (String)session.getAttribute("uid");
		dto2.setUser_id(id);
		if(id==null) {
			model.addAttribute("dto", dto);				
			model.addAttribute("country", mapper.country(dto.getCountry_id()));
			model.addAttribute("posterMain", mapper.posterMain(movie_seq));
			model.addAttribute("posterSub", mapper.posterSub(movie_seq));
			model.addAttribute("posterStill", mapper.posterStill(movie_seq));
			model.addAttribute("subtitle",mapper.subtitle(dto.getSubtitle_id()));
			model.addAttribute("screening",mapper.screening(dto.getScreening_id()));
			model.addAttribute("genre",mapper.genre(dto.getGenre_id()));
			model.addAttribute("ageLimit",mapper.ageLimit(dto.getAgeLimit_id()));
			model.addAttribute("reviewCount",mapper.totalReview(movie_seq));
			model.addAttribute("reviewPaging2",mapper.reviewPaging2(dto2));
		}else{	
			model.addAttribute("dto", dto);				
			model.addAttribute("country", mapper.country(dto.getCountry_id()));
			model.addAttribute("posterMain", mapper.posterMain(movie_seq));
			model.addAttribute("posterSub", mapper.posterSub(movie_seq));
			model.addAttribute("posterStill", mapper.posterStill(movie_seq));
			model.addAttribute("subtitle",mapper.subtitle(dto.getSubtitle_id()));
			model.addAttribute("screening",mapper.screening(dto.getScreening_id()));
			model.addAttribute("genre",mapper.genre(dto.getGenre_id()));
			model.addAttribute("ageLimit",mapper.ageLimit(dto.getAgeLimit_id()));
			model.addAttribute("reviewCount",mapper.totalReview(movie_seq));
			model.addAttribute("reviewPaging",mapper.reviewPaging(dto2));		
		}							
		return "movies/movie_detail";
	}
	@Override
	public String reviewPopup(String title,int movie_seq, Model model) {
		model.addAttribute("title",title);
		model.addAttribute("movie_seq",movie_seq);
		
		return "movies/reviewPopup";
	}
	@Override
	public String reviewPro(reviewDTO dto) {
		mapper.inputReview(dto);
		return "movies/reviewPro";
	}
	public String reviewLike(reviewLikeDTO dto, HttpSession session) {
		String id = (String)session.getAttribute("uid");
		dto.setUser_id(id);
		String result = "0";
		if(mapper.likeCheck(dto) == 0) {
			mapper.likeInsert(dto);
			mapper.ratingUp(dto);
			result="1";
		}else {
			mapper.likeDelete(dto);
			mapper.ratingDown(dto);
		}
		return result;
	}
	@Override
	public String updateReview(String title,int movie_seq,reviewDTO dto2, Model model) {
		model.addAttribute("title",title);
		model.addAttribute("movie_seq",movie_seq);
		model.addAttribute("content",dto2.getContent());
		model.addAttribute("reviews_seq",dto2.getReviews_seq());
		
		return "movies/updateReview";
	}
	@Override
	public String updateReviewPro(reviewDTO dto2,Model model) {
		model.addAttribute("review_seq",dto2.getReviews_seq());
		mapper.reviewUpdate(dto2);
		return "movies/updateReviewPro";
	}
	@Override
	public String deleteReview(int reviews_seq) {
		mapper.reviewDelete(reviews_seq);
		return "movies/deleteReview";
	}


}
