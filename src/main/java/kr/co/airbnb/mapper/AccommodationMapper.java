package kr.co.airbnb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.airbnb.vo.AccConvenience;

import kr.co.airbnb.vo.AccDiscount;
import kr.co.airbnb.vo.AccType;
import kr.co.airbnb.vo.AccViewCount;

import kr.co.airbnb.vo.Boast;
import kr.co.airbnb.vo.AccPhoto;
import kr.co.airbnb.vo.AccRoom;

import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.Convenience;
import kr.co.airbnb.vo.Reservation;
import kr.co.airbnb.vo.Review;
import kr.co.airbnb.vo.Tag;
import kr.co.airbnb.vo.Wishlist;

@Mapper
public interface AccommodationMapper {


	// 숙소 상세 정보
	Accommodation getAcc(int accNo);
	// 모든 숙소 조회
	List<Accommodation> getAllAcc();
	
	// 숙소에 있는 편의시설들
	List<AccConvenience> getAccConveniencesByAccNo(int accNo);
	// 편의시설 메인타입
	List<Convenience> getMainConveniencesByAccNo(int accNo);
	// 숙소 사진 리스트
	List<AccPhoto> getAccPhotosByAccNo(int accNo);
	// 예약된 날짜 리스트
	Accommodation getDisabledByAccNo(int accNo);
	
	
	
	// 숙소 종류 리스트
	List<AccType> getAccTypesByTypeNo(int typeNo);
	
	

	/*
	// 객실 리스트 
	List<AccRoom> getAccRoomsByAccNo(int accNo);
	// 위시리스트 리스트
	List<Wishlist> getWishlistByAccNo(int accNo);
	// 조회 정보 리스트
	List<AccViewCount> getViewCountsByAccNo(int accNo); 
	// 예약정보 리스트
	List<Reservation> getReservationByAccNo(int accNo); 
	// 리뷰 리스트
	List<Review> getReviewByAccNo(int accNo);  
	// 할인정보 리스트
	List<AccDiscount> getDiscountByAccNo(int accNo); 
	// 태그 리스트
	List<Tag> getTagByAccNo(int accNo);
	*/
	

	// 숙소 자랑거리?
	List<Boast> getBoast(int accNo);
	// 룸
	List<AccRoom> getRoomByAccNo(int accNo);


	// 숙소 리뷰 갯수, 별점 평균 업데이트
	void updateAvgScore(Accommodation accommodation);
	

}
