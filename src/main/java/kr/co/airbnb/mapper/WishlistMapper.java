package kr.co.airbnb.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.airbnb.vo.AccWishlist;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.Wishlist;

@Mapper
public interface WishlistMapper {

	Wishlist getWishlistByNo(int wishlistNo);
	List<Wishlist> getWishlistsByUserNo(int userNo);
	List<Accommodation> getWishlistAccsByNo(int wishlistNo);
	void createWishlist(Wishlist wishlist);
	void saveWishlistAcc(@Param("wishlistNo")int wishlistNo, @Param("accNo") int accNo);
	void updateWishlist(Wishlist wishlist);
	void deleteWishlist(int wishlistNo);
	void deleteWishlistAcc(@Param("wishlistNo") int wishlistNo, @Param("accNo") int accNo);
	
	List<AccWishlist> getAccNoByUserNo(int userNo);
	
	// 다른 위시리스트 폴더로 변경
	void changeWishlist(@Param("wishlistNo")int wishlistNo, @Param("accNo") int accNo);
	
	//위시리스트에서 날짜, 인원 조건에 맞고 예약가능한 숙소들
    List<Accommodation> getAvailableWishlistAccsWithConditions(@Param("wishlistNo")int wishlistNo, @Param("checkInDate") Date checkIndate, @Param("checkOutDate") Date checkOutDate, @Param("guestCount") int guestCount);
    //위시리스트에서 날짜, 인원 조건에 예약불가한 숙소들
	List<Accommodation> getUnavailableWishlistAccsWithConditions(@Param("wishlistNo")int wishlistNo, @Param("checkInDate") Date checkIndate, @Param("checkOutDate") Date checkOutDate, @Param("guestCount") int guestCount);
}
