package kr.co.airbnb.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import kr.co.airbnb.annotation.LoginUser;
import kr.co.airbnb.annotation.RegisterAcc;
import kr.co.airbnb.form.AccRegisterForm;
import kr.co.airbnb.service.AccommodationService;
import kr.co.airbnb.service.HostService;
import kr.co.airbnb.service.UserService;
import kr.co.airbnb.utils.SessionUtils;
import kr.co.airbnb.vo.AccConvenience;
import kr.co.airbnb.vo.AccRoom;
import kr.co.airbnb.vo.AccType;
import kr.co.airbnb.vo.Accommodation;
import kr.co.airbnb.vo.Tag;
import kr.co.airbnb.vo.Type;
import kr.co.airbnb.vo.User;

@Controller
@RequestMapping("/host")
public class HostController {
	
	@Value("${airbnb.acc.image.save-directory}")
	String accImageSaveDirectory;

	@Autowired
	private HostService hostService;
	@Autowired
	private AccommodationService accService;
	@Autowired
	private UserService userService;

	// 호스팅 홈페이지
	@GetMapping
	public String home() {
		return "host/home";
	}

	// 호스트 숙소 시작 페이지 (기존등록, 신규등록)
	@GetMapping("/become-a-host")
	public String becomeAHost(@LoginUser User loginUser, Model model) {
		// 로그인유저가 없으면 홈으로
		if (loginUser == null) {
			return "host/home";
		}

		// 사용자의 숙소 전체 검색해서 모델객체에 저장
		List<Accommodation> allAcc = hostService.getAllAccByUser(loginUser);
		model.addAttribute("userAllAcc", allAcc);

		// 사용자의 호스트 여부를 바꿈
		if (!allAcc.isEmpty()) {
			loginUser.setIsHost("Y");
			userService.updateUserInfo(loginUser);
		}
		if (allAcc.isEmpty()) {
			loginUser.setIsHost("N");
			userService.updateUserInfo(loginUser);
		}

		return "host/become-a-host";
	}

	// 새로운 숙소 등록하기 (숙소 생성 및 저장)
	@GetMapping("/become-a-host/register")
	public String register(@LoginUser User loginUser, Model model) {
		// 로그인유저가 없으면 홈으로
		if (loginUser == null) {
			return "host/home";
		}

		// 사용자 계정 정보를 호스트로 바꿈.
		loginUser.setIsHost("Y");
		userService.updateUserInfo(loginUser);

		// 숙소 생성 (번호,유저번호,생성일,상태(등록미완) 정보 저장)
		hostService.insertAcc(loginUser);

		// 가장 최근에 추가된 숙소데이터 조회
		int accNo = accService.getAccommodationNoByUser(loginUser);
		Accommodation registerAcc = accService.getAccommodation(accNo);
		// 등록중인 숙소정보 세션에 저장
		SessionUtils.addAttribute("REGISTER_ACC", registerAcc);

		return "redirect:/host/types";
	}

	// 기존 숙소 복사하기

	// 타입 페이지 (타입1(메인타입) 선택 페이지)
	@GetMapping("/types")
	public String type1(@LoginUser User loginUser, Model model) {
		// 로그인유저가 없으면 홈으로
		if (loginUser == null) {
			return "host/home";
		}

		// 타입1(메인타입) 검색
		List<Type> accMainTypes = hostService.getAllMainTypes();
		model.addAttribute("accMainTypes", accMainTypes);

		return "host/types";
	}

	// ajax 타입2(서브타입) 선택 페이지
	@GetMapping("/searchType1")
	@ResponseBody
	public List<Type> type2(int mainType, @RegisterAcc Accommodation registerAcc) {
		insertType(mainType, registerAcc);
		// 모든 서브 타입 조회
		return hostService.getAllSubTypes(mainType);
	}

	// ajax 타입3(프라이버시타입) 선택 페이지
	@GetMapping("/searchType2")
	@ResponseBody
	public List<Type> type3(int subType, @RegisterAcc Accommodation registerAcc) {
		insertType(subType, registerAcc);
		// 모든 프라이버시타입 조회
		return hostService.getAllPrivacyTypes();
	}

	// 타입 제출(프라이버시타입 저장)
	@PostMapping("/submitTypes")
	public String submitTypes(Model model, @RegisterAcc Accommodation registerAcc, 
			@ModelAttribute("accRegisterForm") AccRegisterForm accRegisterForm,
			SessionStatus sessionStatus) {
		int privacyType = accRegisterForm.getPrivacyType();
		insertType(privacyType, registerAcc);
	
		// 세션 accRegisterForm 객체를 clear 시킨다.
		sessionStatus.setComplete();
		
		return "redirect:/host/location";
	}

	// 숙소 유형 정보 저장
	public void insertType(int typeNo, @RegisterAcc Accommodation registerAcc) {
		// 등록중인숙소 세션객체 조회
		int accNo = registerAcc.getAccNo();

		AccType accType = new AccType(accNo, typeNo);
		hostService.insertAccType(accType);
	}
	
	// 주소 페이지
	@GetMapping("/location")
	public String location(Model model) {

		return "host/location";
	}

	// 주소 제출
	@PostMapping("/submitAddress")
	public String submitAddress(@RegisterAcc Accommodation registerAcc, @LoginUser User loginUser,
			@ModelAttribute("accRegisterForm") AccRegisterForm accRegisterForm,
			SessionStatus sessionStatus) throws IOException {
		
		if (registerAcc == null || loginUser == null) {
			return "host/home";
		}

		hostService.updateAddress(registerAcc, loginUser, accRegisterForm);
		
		// 세션 수정
		Accommodation acc = accService.getAccommodation(registerAcc.getAccNo());
		SessionUtils.removeAttribute("REGISTER_ACC");
		SessionUtils.addAttribute("REGISTER_ACC", acc);
		
		// 세션에 "accRegisterForm"이름으로 저장된 객체를 clear 시킨다.
		sessionStatus.setComplete();
	
		return "redirect:/host/locationDetail";
	}
	
	// 주소 디테일 페이지
	@GetMapping("/locationDetail")
	public String locationDetail(Model model, @RegisterAcc Accommodation registerAcc) {
		model.addAttribute("registerAcc", registerAcc);
		
		return "/host/locationDetail";
	}

	// 인원수 페이지
	@GetMapping("/guests")
	public String guests(Model model) {
		return "/host/guests";
	}
	
	// 인원수 페이지 정보 제출
	@PostMapping("/submitGuests")
	public String submitGuests(@RegisterAcc Accommodation registerAcc, @LoginUser User loginUser,
			@ModelAttribute("accRegisterForm") AccRegisterForm accRegisterForm,
			SessionStatus sessionStatus) throws IOException {
		
		if (registerAcc == null || loginUser == null) {
			return "host/home";
		}
		
		hostService.updateGuests(registerAcc, loginUser, accRegisterForm);
		
		return "redirect:/host/facilities";
	}
	
	// 편의시설 페이지
	@GetMapping("/facilities")
	public String facilities(Model model) {
		
		return "/host/facilities";
	}
	
	// 편의시설 정보 제출 (convenience)
	@PostMapping("/submitFacilities")
	public String submitFacilities(@RegisterAcc Accommodation registerAcc, @LoginUser User loginUser, Model model,
			@ModelAttribute("accRegisterForm") AccRegisterForm accRegisterForm,
			SessionStatus sessionStatus) throws IOException {
		
		if (registerAcc == null || loginUser == null) {
			return "host/home";
		}
		
		hostService.insertConveniences(registerAcc, loginUser, accRegisterForm);
		
		return "redirect:/host/pictures";
	}
	
	// 사진 페이지
	@GetMapping("/pictures")
	public String pictures(Model model) {
		return "/host/pictures";
	}

	// 사진 제출
	@PostMapping("/submitPictures")
	public String submitPictures(@RegisterAcc Accommodation registerAcc, @LoginUser User loginUser, Model model,
			@ModelAttribute("accRegisterForm") AccRegisterForm accRegisterForm,
			SessionStatus sessionStatus) throws IOException {
		
		if (registerAcc == null || loginUser == null) {
			return "host/home";
		}
		
		// 이미지 처리
		if (!accRegisterForm.getPhoto1().isEmpty()) {
			MultipartFile imageFile = accRegisterForm.getPhoto1();
			String filename = imageFile.getOriginalFilename();
			accRegisterForm.setPhoto1name(filename);
			InputStream in = imageFile.getInputStream();
			FileOutputStream out = new FileOutputStream(new File(accImageSaveDirectory, filename));
			FileCopyUtils.copy(in, out);
		}
		if (!accRegisterForm.getPhoto2().isEmpty()) {
			MultipartFile imageFile = accRegisterForm.getPhoto2();
			String filename = imageFile.getOriginalFilename();
			accRegisterForm.setPhoto2name(filename);
			InputStream in = imageFile.getInputStream();
			FileOutputStream out = new FileOutputStream(new File(accImageSaveDirectory, filename));
			FileCopyUtils.copy(in, out);
		}
		if (!accRegisterForm.getPhoto3().isEmpty()) {
			MultipartFile imageFile = accRegisterForm.getPhoto3();
			String filename = imageFile.getOriginalFilename();
			accRegisterForm.setPhoto3name(filename);
			InputStream in = imageFile.getInputStream();
			FileOutputStream out = new FileOutputStream(new File(accImageSaveDirectory, filename));
			FileCopyUtils.copy(in, out);
		}
		if (!accRegisterForm.getPhoto4().isEmpty()) {
			MultipartFile imageFile = accRegisterForm.getPhoto4();
			String filename = imageFile.getOriginalFilename();
			accRegisterForm.setPhoto4name(filename);
			InputStream in = imageFile.getInputStream();
			FileOutputStream out = new FileOutputStream(new File(accImageSaveDirectory, filename));
			FileCopyUtils.copy(in, out);
		}
		if (!accRegisterForm.getPhoto5().isEmpty()) {
			MultipartFile imageFile = accRegisterForm.getPhoto5();
			String filename = imageFile.getOriginalFilename();
			accRegisterForm.setPhoto5name(filename);
			InputStream in = imageFile.getInputStream();
			FileOutputStream out = new FileOutputStream(new File(accImageSaveDirectory, filename));
			FileCopyUtils.copy(in, out);
		}
		hostService.updatePhotos(registerAcc, loginUser, accRegisterForm);
		
		return "redirect:/host/name";
	}
	
	// 이름 페이지
	@GetMapping("/name")
	public String name(Model model) {
		return "/host/name";
	}
	
	// 이름 제출
	@PostMapping("/submitName")
	public String submitName(@RegisterAcc Accommodation registerAcc, @LoginUser User loginUser, Model model,
			@ModelAttribute("accRegisterForm") AccRegisterForm accRegisterForm,
			SessionStatus sessionStatus) throws IOException {
		
		hostService.updateName(registerAcc, loginUser, accRegisterForm);
		
		return "redirect:/host/tags";
	}
	
	// 태그 페이지
	@GetMapping("/tags")
	public String tags(Model model) {
		List<Tag> tags = hostService.getAllTags();
		model.addAttribute("tags", tags);
		return "/host/tags";
	}
	
	// 태그 제출
	@PostMapping("/submitTags")
	public String submitTags(@RegisterAcc Accommodation registerAcc, @LoginUser User loginUser, Model model,
			@ModelAttribute("accRegisterForm") AccRegisterForm accRegisterForm,
			SessionStatus sessionStatus) throws IOException {
		
		if (registerAcc == null || loginUser == null) {
			return "host/home";
		}
		
		hostService.insertTags(registerAcc, loginUser, accRegisterForm);

		// 세션 수정
		Accommodation acc = accService.getAccommodation(registerAcc.getAccNo());
		SessionUtils.removeAttribute("REGISTER_ACC");
		SessionUtils.addAttribute("REGISTER_ACC", acc);
		
		// 세션에 "accRegisterForm"이름으로 저장된 객체를 clear 시킨다.
		sessionStatus.setComplete();
		
		return "redirect:/host/description";
	}
	
	// 설명 페이지
	@GetMapping("/description")
	public String description(Model model) {
		return "/host/description";
	}
	
	// 설명 제출
	@PostMapping("/submitDescription")
	public String submitDescription(@RegisterAcc Accommodation registerAcc, @LoginUser User loginUser, @ModelAttribute("accRegisterForm") AccRegisterForm accRegisterForm,
			SessionStatus sessionStatus) throws IOException {

		if (registerAcc == null || loginUser == null) {
			return "host/home";
		}
		
		hostService.updateDescription(registerAcc, loginUser, accRegisterForm);
		

		// 세션 수정
		Accommodation acc = accService.getAccommodation(registerAcc.getAccNo());
		SessionUtils.removeAttribute("REGISTER_ACC");
		SessionUtils.addAttribute("REGISTER_ACC", acc);
		
		// 세션에 "accRegisterForm"이름으로 저장된 객체를 clear 시킨다.
		sessionStatus.setComplete();
		
		return "redirect:/host/price";
	}
	
	// 요금 페이지
	@GetMapping("/price")
	public String price(Model model) {
		return "/host/price";
	}
	
	// 요금 제출
	@PostMapping("/submitPrice")
	public String submitPrice(@RegisterAcc Accommodation registerAcc, @LoginUser User loginUser, @ModelAttribute("accRegisterForm") AccRegisterForm accRegisterForm,
			SessionStatus sessionStatus) throws IOException {

		if (registerAcc == null || loginUser == null) {
			return "host/home";
		}
		
		hostService.updatePrice(registerAcc, loginUser, accRegisterForm);
		
		// 세션 수정
		Accommodation acc = accService.getAccommodation(registerAcc.getAccNo());
		SessionUtils.removeAttribute("REGISTER_ACC");
		SessionUtils.addAttribute("REGISTER_ACC", acc);
		
		// 세션에 "accRegisterForm"이름으로 저장된 객체를 clear 시킨다.
		sessionStatus.setComplete();
		
		return "redirect:/host/complete";
	}
	
	
	// 법관련 페이지
//	@GetMapping("/legal")
//	public String legal(Model model) {
//		return "/host/legal";
//	}
	
	// 완료 페이지
	@GetMapping("/complete")
	public String complete(Model model, @RegisterAcc Accommodation registerAcc) {
		
		List<Type> types = hostService.getAllTypesByAccNo(registerAcc.getAccNo());
		model.addAttribute("types", types);
		
		AccRoom accRoom = hostService.getAllRoomInfoByAccNo(registerAcc.getAccNo());
		model.addAttribute("room", accRoom);
		
		List<AccConvenience> accConveniences = hostService.getAllConveniencesByAccNo(registerAcc.getAccNo());
		model.addAttribute("cons", accConveniences);
		
		model.addAttribute("acc", registerAcc);
		
		
		return "/host/complete";
	}
	
	// 호스트 프로필 페이지
	@GetMapping("/profile")
	public String profile(Model model) {
		return "/host/hosting";
	}
}
