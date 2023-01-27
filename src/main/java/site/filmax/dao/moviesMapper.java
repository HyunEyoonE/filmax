package site.filmax.dao;

import java.util.List;

import site.filmax.dto.MoviesDTO;

import site.filmax.dto.posterDTO;
import site.filmax.dto.reviewDTO;
import site.filmax.dto.reviewLikeDTO;

public interface moviesMapper {
	public List<MoviesDTO> moviesList();
	public List<MoviesDTO> onScreen();
	public MoviesDTO movieDetail(int movie_seq);
	public String subtitle(int subtitle_id);
	public int ageLimit(int ageLimit_id);
	public String screening(int screening_id);
	public String genre(int genre_id);
	public String country(int country_id);
	public List<posterDTO> posterMain(int movie_seq);
	public List<posterDTO> posterSub(int movie_seq);
	public List<posterDTO> posterStill(int movie_seq);
	public int inputReview(reviewDTO dto);
	public List<reviewDTO> review(int movie_seq);
	
	public int reviewDelete(int reviews_seq);
	public int reviewUpdate(reviewDTO dto);
	public int totalReview(int movie_seq); //전체영화리뷰수!
	public List<reviewDTO> reviewPaging(reviewDTO dto);
	public List<reviewDTO> reviewPaging2(reviewDTO dto);
	public int likeCheck(reviewLikeDTO dto);
	public void likeInsert(reviewLikeDTO dto);
	public void likeDelete(reviewLikeDTO dto);
	
	public void ratingUp(reviewLikeDTO dto);
	public void ratingDown(reviewLikeDTO dto);
	
}
