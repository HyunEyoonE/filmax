package site.filmax.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;


import site.filmax.dto.reviewDTO;
import site.filmax.dto.reviewLikeDTO;

public interface moviesService {
	public String moviesList(Model model);
	public String onScreenList(Model model);
	public String movieDetail(int movie_seq, Model model,reviewDTO dto2,HttpSession session);
	public String reviewPopup(String title,int movie_seq, Model model);
	public String reviewPro(reviewDTO dto);
	public String updateReview(String title,int movie_seq,reviewDTO dto2,Model model);
	public String updateReviewPro(reviewDTO dto,Model model);
	public String deleteReview(int reviews_seq);
	public String reviewLike(reviewLikeDTO dto, HttpSession session);	
}
