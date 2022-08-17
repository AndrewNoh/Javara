package com.carrot.marketapp.web.user;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.nio.channels.Channels;
import java.nio.channels.ReadableByteChannel;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.carrot.marketapp.model.dao.PayDAO;
import com.carrot.marketapp.model.dto.AddressDTO;
import com.carrot.marketapp.model.dto.BoardDTO;
import com.carrot.marketapp.model.dto.ChatDTO;
import com.carrot.marketapp.model.dto.CommentDTO;
import com.carrot.marketapp.model.dto.ImageDTO;
import com.carrot.marketapp.model.dto.PayDTO;
import com.carrot.marketapp.model.dto.UserDTO;
import com.carrot.marketapp.model.service.PayService;
import com.carrot.marketapp.model.service.impl.AddressServiceimpl;
import com.carrot.marketapp.model.service.impl.BoardServiceimpl;
import com.carrot.marketapp.model.service.impl.ChatServiceimpl;
import com.carrot.marketapp.model.service.impl.CommentServiceimpl;
import com.carrot.marketapp.model.service.impl.ImageServiceimpl;
import com.carrot.marketapp.model.service.impl.PayServiceimpl;
import com.carrot.marketapp.model.service.impl.UserServiceimpl;
import com.carrot.marketapp.util.FileUpDownUtils;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/userinfo")
public class UserInfoController {

	@Autowired
	UserServiceimpl userService;

	@Autowired
	BoardServiceimpl boardService;

	@Autowired
	AddressServiceimpl addressService;

	@Autowired
	ImageServiceimpl imageService;

	@Autowired
	ChatServiceimpl chatService;
	
	@Autowired
	PayServiceimpl payService;
	
	@Autowired
	ObjectMapper objectMapper;
	
	@Autowired
	CommentServiceimpl commentService;

	// 회원가입
	@RequestMapping("/signup.do")
	public String signup(@ModelAttribute @Valid UserDTO dto, @RequestParam Map map,
			@RequestParam MultipartFile profileimg, MultipartHttpServletRequest req)
			throws IllegalStateException, IOException {
		File dest = null;
		map.put("latitude", Double.parseDouble((String) map.get("latitude")));
		map.put("longitude", Double.parseDouble((String) map.get("longitude")));
		if (map.get("platform").equals("K")) {
			String kakaoProfile = imageUrlDownload(
					req.getSession().getServletContext().getRealPath("/resources/assets/img/zabaraImg"),
					(String) map.get("kakaoProfileUrl"));
			map.put("profile", kakaoProfile);
		} else {
			if (!profileimg.isEmpty()) {
				String path = req.getSession().getServletContext().getRealPath("/resources/assets/img/zabaraImg"); // 경로
				String rename = FileUpDownUtils.getNewFileName(path, profileimg.getOriginalFilename());// 같은 이름일때 파일제목변경
				dest = new File(path + File.separator + rename);
				profileimg.transferTo(dest);// 파일 업로드
				map.put("profile", rename);// 데이타베이스에 입력될 프로필사진 이름
			} else
				map.put("profile", "zabaraDefaultProfile.png");// 프로필사진 미선택시 데이터베이스에 기본이미지 입력용
		}

		int affected = userService.insert(map);

		if (affected == 0) {
			if (dest != null)
				dest.delete();
			return "user/Login.market";
		} else {
			map.put("signup", "signup");
			UserDTO userinfo = userService.selectOne(map);
			String[] simpleAddr = ((String) map.get("address")).split(" ");
			String simpleAddress = simpleAddr[1];
			map.put("simpleAddress", simpleAddress);
			map.put("userno", userinfo.getUserno());
			int authGrant = userService.grant(map);

			int amount = payService.payCreateAmount(map); // 최초 계좌생성
	        PayDTO payno = payService.getPayNo(map); // 계좌 번호
	        map.put("payno", payno.getPayno());
	        int log = payService.payLog(map); // 로그 생성
	  
	        if (authGrant == 0)
	            return "user/Login.market";
			
		}

		return "user/Login.market";
	}

	public String imageUrlDownload(String path, String url) {
		String rename = "";
		try {
			URL kakaoUrl = new URL(url);
			ReadableByteChannel rbc = Channels.newChannel(kakaoUrl.openStream());
			rename = FileUpDownUtils.getNewFileName(path, "kakaoProfile.jpg");// 같은 이름일때 파일제목변경
			FileOutputStream fos = new FileOutputStream(path + "/" + rename);
			fos.getChannel().transferFrom(rbc, 0, Long.MAX_VALUE);
			fos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rename;
	}

	// 회원 수정
	@GetMapping("/editmember.do")
	public String edit(@RequestParam Map map, Model model, Authentication auth) {
		map.put("email", ((UserDetails) auth.getPrincipal()).getUsername());// 이메일 가져오기
		// 서비스 호출]
		UserDTO record = userService.selectOne(map);

		map.put("userno", record.getUserno());
		Map addr = userService.editselectOne(map);
		// 어드레스테이블에서 유저넘버로 조회해서 뿌려주고 변수 다르게 저장해서 뿌리기

		// 데이타 저장] -//키와 이엘 명과 일치시키자
		model.addAttribute("nickname", record.getNickname());
		model.addAttribute("password", record.getPassword());
		model.addAttribute("simpleAddress", addr.get("SIMPLEADDRESS"));
		model.addAttribute("FULLADDRESS", addr.get("FULLADDRESS"));
		model.addAttribute("email", record.getEmail());
		model.addAttribute("phonenumber", record.getPhonenumber());
		model.addAttribute("profileimage", record.getProfile_img());
		model.addAttribute("latitude",record.getLatitude());
		model.addAttribute("longitude",record.getLongitude());

		// 뷰정보 반환]
		return "/user/edit.market";
	}///////////////////////

	@PostMapping("/editmember.do")
	public String editOk(@RequestParam MultipartFile editprofileimg, HttpServletRequest req, @RequestParam Map map,
			Authentication auth, Model model) throws IllegalStateException, IOException {
		String path = req.getSession().getServletContext().getRealPath("/resources/assets/img/zabaraImg"); // 경로
		// 서비스 호출]
		map.put("email", ((UserDetails) auth.getPrincipal()).getUsername());// 이메일 가져오기
		UserDTO record = userService.selectOne(map);
		map.put("userno", record.getUserno());
		map.put("latitude", Double.parseDouble((String) map.get("latitude")));
		map.put("longitude", Double.parseDouble((String) map.get("longitude")));
		File oldprofile = new File(path + File.separator + record.getProfile_img());
		if (!editprofileimg.isEmpty()) {
			String rename = FileUpDownUtils.getNewFileName(path, editprofileimg.getOriginalFilename());// 같은 이름일때 파일제목변경
			File dest = new File(path + File.separator + rename);
			editprofileimg.transferTo(dest);// 파일 업로드
			map.put("profile", rename);// 데이타베이스에 입력될 프로필사진 이름
		} else
			map.put("profile", record.getProfile_img());
		String[] simpleAddr = ((String) map.get("fulladdress")).split(" ");
		String simpleAddress = simpleAddr[1];
		map.put("simpleAddress", simpleAddress);

		// 이부분 해주는 이유 : 페이지 나가도 다른 페이지에도 저장됨
		int affected = userService.update(map);
		if (affected != 0 && !editprofileimg.isEmpty()) {
			oldprofile.delete();
		}
		record = userService.selectOne(map);
		Map addr = userService.editselectOne(map);
		model.addAttribute("nickname", record.getNickname());
		model.addAttribute("password", record.getPassword());
		model.addAttribute("simpleAddress", addr.get("SIMPLEADDRESS"));
		model.addAttribute("FULLADDRESS", addr.get("FULLADDRESS"));
		model.addAttribute("email", record.getEmail());
		model.addAttribute("phonenumber", record.getPhonenumber());
		model.addAttribute("profileimage", record.getProfile_img());

		return "forward:/userinfo/mypage.do";
	}/////////////////////////

	@RequestMapping("/mypage.do")
	public String mypage(@RequestParam Map map, Model model, Authentication auth) {
		if(auth == null) {
			return "redirect:/location/login.do";
		}
		
		map.put("email", ((UserDetails) auth.getPrincipal()).getUsername());// 이메일 가져오기
		// 서비스 호출]
		UserDTO record = userService.selectOne(map);

		// 데이타 저장]
		model.addAttribute("userno", record.getUserno());
		model.addAttribute("nickname", record.getNickname());
		model.addAttribute("pwd", record.getPassword());
		model.addAttribute("address", record.getFulladdress());
		model.addAttribute("email", record.getEmail());
		model.addAttribute("phonenumber", record.getPhonenumber());
		model.addAttribute("profileimage", record.getProfile_img());
		model.addAttribute("platform", record.getPlatform());
		model.addAttribute("latitude",record.getLatitude());
		model.addAttribute("longitude",record.getLongitude());
		
		// 채팅리스
		map.put("userno", record.getUserno());
		model.addAttribute("userno", record.getUserno());
		List<ChatDTO> chatlist = chatService.chatlist(map);
		model.addAttribute("chatlist", chatlist);
		List<ChatDTO> unreadcount = chatService.unreadcount(map);
		model.addAttribute("unreadcount", unreadcount);
		
		// 판매/구매내역 & 관심목록 갯수
		int likeCount = boardService.getLikeCount(map);

		int sellCount = boardService.getSellCount(map);

		int buyCount = boardService.getBuyCount(map);
	
		model.addAttribute("likeCount", likeCount);
		model.addAttribute("sellCount", sellCount);
		model.addAttribute("buyCount", buyCount);
		
		
		//알림
		List<CommentDTO> commentList = commentService.commentSelectList(map);
		 model.addAttribute("commentList", commentList);
		 
		 List<BoardDTO> comments = boardService.countcomment(map);
		 model.addAttribute("comments", comments);
		 List<BoardDTO> mypageAuctionList = boardService.mypageAuctionList(map);
		 model.addAttribute("mypageAuctionList", mypageAuctionList);
		 
		 
		// 뷰정보 반환]
		return "/user/MyPage.market";
	}///////////////////////

	// 회원가입폼 이메일,폰번호 중복확인용(AJAX)
	@PostMapping(value = "/duplicate.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int emailDuplicationCheck(@RequestParam Map map) {
		int result = 0;
		UserDTO users = userService.selectOne(map);
		if (users != null)
			result = 1;
		return result;
	}

	// 마이페이지 프로필사진만 변경
	@PostMapping(value = "/changeProfilePic.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String changProfile(@RequestParam MultipartFile profileimg, HttpServletRequest req, Model model,
			Authentication auth) throws IllegalStateException, IOException {
		Map map = new HashMap();
		String succesOrFail = "fail";
		map.put("email", ((UserDetails) auth.getPrincipal()).getUsername());
		UserDTO userinfo = userService.selectOne(map);

		String path = req.getSession().getServletContext().getRealPath("/resources/assets/img/zabaraImg");
		String rename = FileUpDownUtils.getNewFileName(path, profileimg.getOriginalFilename());
		File oldprofile = new File(path + File.separator + userinfo.getProfile_img());
		File dest = new File(path + File.separator + rename);
		profileimg.transferTo(dest);
		map.put("simpleChangeProfile", rename);
		int affected = userService.update(map);
		if (affected == 1) {
			oldprofile.delete();
			succesOrFail = "success";
		}
		return succesOrFail;
	}

	// 마이페이지 마커위치로 주소변경
	@PostMapping(value = "/myPageSimpleAddressChange.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int changeAddrNowPosition(@RequestParam Map map, Authentication auth) {
		map.put("email", ((UserDetails) auth.getPrincipal()).getUsername());
		UserDTO userinfo = userService.selectOne(map);
		map.put("userno", userinfo.getUserno());
		map.put("latitude", Double.parseDouble((String) map.get("markerlat")));
		map.put("longitude", Double.parseDouble((String) map.get("markerlng")));

		String[] simpleAddr = ((String) map.get("nowAddress")).split(" ");
		String simpleAddress = simpleAddr[1];
		map.put("simpleAddr", simpleAddress);

		int affected = userService.update(map);
		return affected;
	}

	 // 마이페이지 판매내역
	   @GetMapping("selllist.do")
	   public String selllist(@RequestParam Map map, Model model, Authentication auth, Principal principal) {
		  map.put("email", ((UserDetails) auth.getPrincipal()).getUsername());// 이메일 가져오기
		  UserDTO userinfo = userService.selectOne(map);
		  map.put("userno", userinfo.getUserno());
		  
	      // 서비스 호출]
	      // 그 형식에 맞는 dto만들어서 넣는 방법이 있음
	      List<BoardDTO> record = boardService.mypageSelllist(map);

	      model.addAttribute("record", record);
	      model.addAttribute("email", map.get("email"));
	      model.addAttribute("board", "경매");
	      map.put("board", "경매");
	      map.put("where", "sell");
	      model = setModel(map, model, principal);
	      model.addAttribute("category", map.get("category"));

	      return "user/SellList.market";
	   }///////////////////////

	   @GetMapping("/purchaselist.do")
	   public String purchaselist(@RequestParam Map map, Model model, Authentication auth, Principal principal) {
	      map.put("email", ((UserDetails) auth.getPrincipal()).getUsername());// 이메일 가져오기
	      UserDTO userinfo = userService.selectOne(map);
	      map.put("userno", userinfo.getUserno());
	      // 서비스 호출]
	      // 그 형식에 맞는 dto만들어서 넣는 방법이 있음
	      List<BoardDTO> record = boardService.mypagepurchaselist(map);

	      model.addAttribute("record", record);
	      model.addAttribute("email", map.get("email"));
	      model.addAttribute("board", "경매");
	      map.put("board", "경매");
	      map.put("where", "purchase");
	      model = setModel(map, model, principal);
	      model.addAttribute("category", map.get("category"));
	      return "user/PurchaseList.market";
	   }///////////////////////


	   @GetMapping("likelist.do")
	   public String likelist(@RequestParam Map map, Model model, Authentication auth, Principal principal) {
	      // 유저넘버로 프로덕트 라이크를 셀렉트 해오자 그럼 프로덕트 넘버 나옴 프로덕트 리스트로 조회 리스트 조인
	      map.put("email", ((UserDetails) auth.getPrincipal()).getUsername());// 이메일 가져오기
	      UserDTO userinfo = userService.selectOne(map);
	      map.put("userno", userinfo.getUserno());
	      
	      // 서비스 호출]
	      // 그 형식에 맞는 dto만들어서 넣는 방법이 있음
	      List<BoardDTO> record = boardService.mypagelikelist(map);

	      model.addAttribute("record", record);
	      model.addAttribute("email", map.get("email"));
	      model.addAttribute("board", "경매");
	      map.put("board", "경매");
	      map.put("where", "like");
	      model = setModel(map, model, principal);
	      model.addAttribute("category", map.get("category"));
	      return "user/LikeList.market";
	   }///////////////////////

	   public Model setModel(Map map, Model model, Principal principal) {
	      
	      map = getUserInfo(map, model, principal);

	      if (map.get("nowpage") == null) {
	         map.put("nowpage", "1");
	      }

	      int page = Integer.parseInt((String) map.get("nowpage"));

	      map.put("startnum", (30 * (page - 1)) + 1);
	      map.put("endnum", 30 * (page));

	      if (map.get("category") == null) {
	         map.put("category", "모두");
	      }

	      // 리스트 받아오기
	      List<BoardDTO> allLists = boardService.selectListAll(map);
	      model.addAttribute("nowpage", page);
	      model.addAttribute("endpage", allLists.size() / 30 == 0 ? 1 : allLists.size() / 30);

	      List<BoardDTO> Lists = null;
	      if (map.get("where").toString().equals("like")) {
	         Lists = boardService.mypagelikelist(map);
	      } 
	      else if(map.get("where").toString().equals("purchase")){
	    	  Lists = boardService.mypagepurchaselist(map);
	      }
	      else {
	         Lists = boardService.mypageSelllist(map);
	      }      

	      List<List<ImageDTO>> imageList = new Vector<List<ImageDTO>>();

	      for (int i = 0; i < Lists.size(); i++) {
	         map.put("product_no", Lists.get(i).getProduct_no());
	         map.put("auction_no", Lists.get(i).getAuction_no());

	         List<ImageDTO> images = imageService.selectList(map);
	         imageList.add(images);
	      }

	      List<Integer> likes = boardService.selectLikeList(map);

	      model.addAttribute("likes", likes);
	      model.addAttribute("imageList", imageList);
	      model.addAttribute("address", map.get("simpleAddress"));
	      model.addAttribute("LISTS", Lists);

	      return model;
	   }

	   public Map getUserInfo(Map map, Model model, Principal principal) {

	      map.put("email", principal.getName());

	      UserDTO user = userService.selectOne(map);

	      map.put("userno", user.getUserno());

	      AddressDTO address = addressService.selectOne(map);

	      String simpleAddr = address.getSimpleAddress();

	      map.put("addrno", address.getAddrNo());
	      map.put("simpleAddress", simpleAddr);

	      return map;
	   }
		
	
	@RequestMapping("/category.do")
	public String category(Model model, Principal principal) {
		Map map = new HashMap<>();
		if(principal==null) {
			return "redirect:/location/login.do";
		}
		
		map.put("email", principal.getName());
		UserDTO userinfo = userService.selectOne(map);
	    model.addAttribute("userno", userinfo.getUserno());
		UserDTO record = userService.selectOne(map);
		model.addAttribute("latitude",record.getLatitude());
		model.addAttribute("longitude",record.getLongitude());
		model.addAttribute("address",record.getFulladdress());		
		
		
		
		return "user/category.market";
	}
	
	@RequestMapping(value = "/accountbook.do")
	   @ResponseBody
	   public String accountbook(@RequestParam Map map, Model model, Authentication auth) throws Exception {
		  Map result = new HashMap<>();
		  map.put("email", ((UserDetails) auth.getPrincipal()).getUsername());// 이메일 가져오기	     
		  UserDTO userinfo = userService.selectOne(map);
	      map.put("userno", userinfo.getUserno());
	      List<BoardDTO> record = boardService.mypageaccountbook(map);
	      int sum = 0;
	         for(BoardDTO item:record) {
	            sum +=Integer.parseInt(item.getUpper_Price());
	         }
	 		result.put("items",record.size());
			result.put("total", sum);

			return objectMapper.writeValueAsString(result);
	   }

}
