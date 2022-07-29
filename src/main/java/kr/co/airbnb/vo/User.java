package kr.co.airbnb.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Alias("User")
public class User {

	private int no;
	private String name;
	private String email;
	private String password;
	private String phone;
	private String profileImage;
	private String description;
	private Date birthDate;
	private String address;
	private String disabled;
	private String isHost;
	private Date createdDate;
	private Date updatedDate;
	private String gender;
	
}
