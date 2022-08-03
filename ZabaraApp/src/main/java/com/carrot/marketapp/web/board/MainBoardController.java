package com.carrot.marketapp.web.board;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Vector;

import javax.imageio.ImageIO;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.carrot.marketapp.model.dto.AddressDTO;
import com.carrot.marketapp.model.dto.BoardDTO;
import com.carrot.marketapp.model.dto.ImageDTO;
import com.carrot.marketapp.model.dto.UserDTO;
import com.carrot.marketapp.model.service.impl.AddressServiceimpl;
import com.carrot.marketapp.model.service.impl.BoardServiceimpl;
import com.carrot.marketapp.model.service.impl.ImageServiceimpl;
import com.carrot.marketapp.model.service.impl.UserServiceimpl;
import com.carrot.marketapp.util.FileUpDownUtils;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/board")
public class MainBoardController {

	private static final int IMG_WIDTH = 800;
	private static final int IMG_HEIGHT = 600;

	@Autowired
	BoardServiceimpl boardService;

	@Autowired
	UserServiceimpl userService;

	@Autowired
	AddressServiceimpl addressService;

	@Autowired
	ImageServiceimpl imageService;

	@Autowired
	ObjectMapper objectMapper;

	@RequestMapping("/gropboard.do")
	public String gropboard(Map map, Model model, Principal principal) {
		model.addAttribute("board", "우리동네");
		map.put("email", principal.getName());

		UserDTO user = userService.selectOne(map);

		map.put("userno", user.getUserno());
		model.addAttribute("userno", user.getUserno());

		AddressDTO address = addressService.selectOne(map);

		String simpleAddr = address.getSimpleAddress();

		map.put("simpleAddress", simpleAddr);
		// 리스트 받아오기
		List<BoardDTO> Lists = boardService.selectList(map);

		model.addAttribute("address", simpleAddr);
		model.addAttribute("LISTS", Lists);

		List<List<ImageDTO>> imageList = new Vector<List<ImageDTO>>();

		for (int i = 0; i < Lists.size(); i++) {

			map.put("townlist_no", Lists.get(i).getTownlist_no());

			List<ImageDTO> images = imageService.selectList(map);
			imageList.add(images);
		}

		model.addAttribute("imageList", imageList);
		model.addAttribute("address", map.get("simpleAddress"));
		model.addAttribute("LISTS", Lists);

		return "/board/GropBoardList.market";
	}

	@RequestMapping("/auctionlist.do")
	public String auction(Map map, Model model, Principal principal) {
		model.addAttribute("board", "경매");
		map.put("board", "경매");
		model = setModel(map, model, principal);
		model.addAttribute("category", map.get("category"));

		return "/board/AuctionList.market";
	}

	@RequestMapping("/qna.do")
	public String qna() {
		return "/board/QuestionAndAnswer.market";
	}
	// 리스트 불러오기(끝)

	// 리스트 크게보기(시작)
	@RequestMapping("/auctionview.do")
	public String auctionview(Model model, @RequestParam Map map, Principal principal) {
		map.put("board", "경매");

		BoardDTO list = boardService.selectOne(map);

		int no = Integer.parseInt((String) map.get("no"));
		map = getUserInfo(map, model, principal);
		map.put("auction_no", no);
		List<ImageDTO> image = imageService.selectList(map);

		model.addAttribute("images", image);
		model.addAttribute("userno", map.get("userno"));
		model.addAttribute("list", list);
		model.addAttribute("goChat", map.getOrDefault("goChat", 'N'));

		if (map.getOrDefault("isupdate", 0).equals(1)) {
			model.addAttribute("update", 1);
		}

		return "/board/AuctionView.market";
	}
	// 리스트 크게보기(끝)

	// 글쓰기
	@GetMapping("/write.do")
	public String gowrite(Model model, @RequestParam Map map) {
		String board = (String) map.get("board");
		return "/board/" + board + "Write.market";
	}

	@PostMapping("/write.do")
	public String write(@RequestParam Map map, Model model, Principal principal,
			@RequestParam("filename") MultipartFile[] filename, MultipartHttpServletRequest req)
			throws IllegalStateException, IOException {

		String board = (String) map.get("board");

		System.out.println(map.get("content"));
		
		map = getUserInfo(map, model, principal);

		int a = 0;

		if (board.equals("경매")) {
			map.put("enddate", Integer.parseInt((String) map.get("enddate")));
		}

		String title = map.get("title").toString().trim();
		String content = map.get("content").toString().trim();
		String price = "0";
		if (!board.equals("우리동네"))
			price = map.get("price").toString().trim();

		if (board.equals("우리동네") && filename[0].getOriginalFilename().equals("")) {
			System.out.println("잘 작동하나 테스트해봐야 합니다.");
			a = boardService.insert(map);

		} else if (title.equals("") || content.equals("") || price.equals("")
				|| filename[0].getOriginalFilename().equals("")) {
			switch (board) {
			case "우리동네":
				return "/board/GropBoardWrite.market";
			default:
				return "/board/AuctionWrite.market";
			}

		} else {
			a = boardService.insert(map);

			if (!map.get("latitude").equals("not") && a == 1) {

				map.put("latitude", Double.parseDouble((String) map.get("latitude")));
				map.put("longitude", Double.parseDouble((String) map.get("longitude")));

				String[] simpleAddr = ((String) map.get("address")).split(" ");
				String simpleAddress = simpleAddr[1];
				map.put("simpleAddress", simpleAddress);

				BoardDTO auction_no = boardService.getWriteAuctionView(map);
				map.put("auction_no", auction_no.getAuction_no());

				a = boardService.insertNewAddress(map);

				if (a == 1) {
					AddressDTO updateAddress = boardService.getUpdateAddress(map);
					map.put("addrno", updateAddress.getAddrNo());

					a = boardService.UpdateAddress(map);
				} /////// if

			} /////// if

		} ////////// else

		String path = req.getSession().getServletContext().getRealPath("/resources/assets/img/product_img"); // 경로

		if (a == 1 && !(filename[0].getOriginalFilename().equals(""))) {

			for (int i = 0; i < filename.length; i++) {

				String rename = FileUpDownUtils.getNewFileName(path, filename[i].getOriginalFilename());// 같은 이름일때
																										// 파일제목변경

				File dest = new File(path + File.separator + rename);

				filename[i].transferTo(dest);

				BufferedImage original = ImageIO.read(dest);
				int type = original.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : original.getType();

				BufferedImage resizeImagePng = resizeImage(original, type);
				ImageIO.write(resizeImagePng, "png", dest);
				BufferedImage resigeImage = ImageIO.read(dest);

				File resize = new File(rename);

				filename[i].transferTo(resize);

				map.put("profile", rename);
				int aff = boardService.insertImage(map);
			}
		}

		switch (board) {
		case "우리동네":
			return "redirect:/board/gropboard.do";
		default:
			return "redirect:/board/auctionlist.do";
		}

	}

	private BufferedImage resizeImage(BufferedImage original, int type) {
		BufferedImage resizedImage = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, type);
		Graphics2D g = resizedImage.createGraphics();
		g.drawImage(original, 0, 0, IMG_WIDTH, IMG_HEIGHT, null);
		g.dispose();

		return resizedImage;
	}

	// 글쓰기 끝

	// 글수정
	@PostMapping("/edit.do")
	@ResponseBody
	public int edit(@RequestParam Map map, Model model, Principal principal, MultipartHttpServletRequest req, @RequestParam("filename") MultipartFile[] filename)
			throws IllegalStateException, IOException {

		String board = (String) map.get("board");
		System.out.println(map.get("auction_no"));
		
		map = getUserInfo(map, model, principal);

		int a = 0;

		if (board.equals("경매")) {
			System.out.println("종료일");
			map.put("enddate", Integer.parseInt((String) map.get("enddate")));
		}

		//경매면 금액 들어가야함
		String price = "0";
		if (!board.equals("우리동네")) {
			System.out.println("가격입력");
			price = map.get("price").toString().trim();
		}

		//경매가아님 & 사진이 없음
		if (board.equals("우리동네") && filename[0].getOriginalFilename().equals("")) {
			System.out.println("잘 작동하나 테스트해봐야 합니다.");
			a = boardService.update(map);

		} else if(board.equals("우리동네")){
			//이미지를 포함해서 동네글 수정해야함
			map.put("profile", "have");
			a = boardService.update(map);
		} else if(board.equals("경매") && filename[0].getOriginalFilename().equals("")) {
			System.out.println("글만 수정");
			a = boardService.update(map);
		} else {
			System.out.println("사진도 수정");
			map.put("profile", "have");
			a = boardService.update(map);
		}
		
		String path = req.getSession().getServletContext().getRealPath("/resources/assets/img/product_img"); // 경로
		
		System.out.println("A의 값 : " + a);

		if (a == 1 && !(filename[0].getOriginalFilename().equals(""))) {
			System.out.println("그럼 이프문 들어온거잖아");
			for (int i = 0; i < filename.length; i++) {

				String rename = FileUpDownUtils.getNewFileName(path, filename[i].getOriginalFilename());// 같은 이름일때
																										// 파일제목변경
				System.out.println(rename);
				
				File dest = new File(path + File.separator + rename);

				System.out.println(dest);
				
				filename[i].transferTo(dest);

				BufferedImage original = ImageIO.read(dest);
				int type = original.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : original.getType();

				BufferedImage resizeImagePng = resizeImage(original, type);
				ImageIO.write(resizeImagePng, "png", dest);
				BufferedImage resigeImage = ImageIO.read(dest);

				File resize = new File(rename);

				filename[i].transferTo(resize);

				map.put("profile", rename);
				System.out.println(map.get("profile"));
				
				int aff = boardService.insertImage(map);
				System.out.println("업로드 성공 : " + aff);
				a=aff;
				
			}
		}
		
		return a;

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

	public Model setModel(Map map, Model model, Principal principal) {
		map = getUserInfo(map, model, principal);

		if (map.get("nowpage") == null) {
			map.put("nowpage", "1");
		}

		int page = Integer.parseInt((String) map.get("nowpage"));

		map.put("startnum", (30 * (page - 1)));
		map.put("endnum", 30 * (page) + 1);

		if (map.get("category") == null) {
			map.put("category", "모두");
		}

		// 리스트 받아오기
		List<BoardDTO> allLists = boardService.selectListAll(map);
		model.addAttribute("nowpage", page);
		model.addAttribute("endpage", allLists.size() / 30 == 0 ? 1 : allLists.size() / 30);

		List<BoardDTO> Lists = boardService.selectList(map);

		List<List<ImageDTO>> imageList = new Vector<List<ImageDTO>>();

		for (int i = 0; i < Lists.size(); i++) {
			map.put("auction_no", Lists.get(i).getAuction_no());

			List<ImageDTO> images = imageService.selectList(map);
			imageList.add(images);
		}

		List<Integer> likes = boardService.selectLikeList(map);

		model.addAttribute("likes", likes);
		model.addAttribute("imageList", imageList);
		model.addAttribute("address", map.get("simpleAddress"));
		model.addAttribute("LISTS", Lists);
		model.addAttribute("nowUser", map.get("userno"));

		return model;
	}

	@RequestMapping(value = "/delete.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int delete(@RequestParam Map map, Model model, Principal principal) {
		return boardService.delete(map);

	}

	@RequestMapping("deleteTown.do")
	public String deleteTown(@RequestParam Map map, Model model, Principal principal) {
		boardService.delete(map);

		return "redirect:/board/gropboard.do";

	}

	@RequestMapping(value = "/likeUp.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int like(@RequestParam Map map, Model model, Principal principal) {
		map = getUserInfo(map, model, principal);
		int aff = 0;
		int haveLike = boardService.selectLike(map);

		if (haveLike != 0) {
			aff = boardService.deleteLike(map);
			int noLike = boardService.selectLikeNo(map);
			map.put("noLike", noLike);
			aff = boardService.updateLike(map);
			aff = 1;

		} else {
			aff = boardService.insertLike(map);
			int noLike = boardService.selectLikeNo(map);
			map.put("noLike", noLike);
			aff = boardService.updateLike(map);
			aff = 0;
		}

		return aff;

	}

	@RequestMapping(value = "/newUpperPrice.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int updateUpperPrice(@RequestParam Map map, Model model, Principal principal) {

		int upper = Integer.parseInt((String) map.get("upperprice"));
		int newprice = Integer.parseInt((String) map.get("newprice"));

		map = getUserInfo(map, model, principal);

		int aff = 0;
		if (upper >= newprice) {
			return aff;
		} else {
			aff = boardService.updatePrice(map);
		}

		return aff;

	}

	public static HashMap<String, String> map;

	@GetMapping("/news.do")
	public String startCrawl(Authentication auth, Model model) throws IOException {
		System.out.println("****크롤링 컨트롤러 입니다****");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy.MM.dd", Locale.KOREA);//
		Date currentTime = new Date();
		Map map = new HashMap();
		String e_date = formatter.format(currentTime);// 원하는 형식대로 dTime에 스트링으로 날짜 넣어주긔
		// String e_date = dTime; //이거 왜 해주는지 모르겠어서 일단 뺌

		currentTime.setDate(currentTime.getDate() - 1);

		String s_date = formatter.format(currentTime);

		map.put("email", ((UserDetails) auth.getPrincipal()).getUsername());// 이메일 가져오기
		UserDTO record = userService.selectOne(map);
		map.put("userno", record.getUserno());
		Map addr = userService.editselectOne(map);
		model.addAttribute("simpleAddress", addr.get("SIMPLEADDRESS"));
		String query = (String) addr.get("SIMPLEADDRESS");// simpleAdress넣어주몀ㄴ되ㅏㅁ~!~
		String s_from = s_date.replace(".", "");
		String e_to = e_date.replace(".", "");
		int page = 0;
		ArrayList<String> al1 = new ArrayList<>();
		ArrayList<String> al2 = new ArrayList<>();
		ArrayList<String> al3 = new ArrayList<>();

		while (page < 20) {
			String address = "https://search.naver.com/search.naver?where=news&query=" + query + "&sort=1&ds="
					+ Integer.toString(page);
			Document rawData = Jsoup.connect(address).timeout(5000).get();
			Elements blogOption = rawData.select("a[title!='']");
			Elements imgOption = rawData.select(".dsc_thumb");

			String realURL = "";
			String realTITLE = "";
			String realIMG = "";
			String imagesrc = "";
			String imgLink = "";

			for (Element option : blogOption) {
				realURL = option.select("a").attr("href");
				realTITLE = option.select("a").attr("title");

				al1.add(realURL);
				al2.add(realTITLE);
			}
			
			int k = 0;
			for (int i = 0; i < blogOption.size(); i++) {
				Element thumbnail = imgOption.get(k);
				imgLink = thumbnail.select("a").attr("href");
				realIMG = thumbnail.select("img").attr("src");

				String[] imagearr = realIMG.split("src=");

				if (imagearr.length == 2)
					imagesrc = URLDecoder.decode(imagearr[1].split("&type")[0], "UTF-8");

				if (blogOption.get(i).select("a").attr("href").equals(imgLink)) {
					al3.add(imagesrc);
					k++;
				} else {
					al3.add("");
				}
				if (imgOption.size() == k) {
					break;
				}
			}

			page += 20;
			System.out.println("사이즈1 : " + al1.size());
			System.out.println("사이즈2 : " + al2.size());
			System.out.println("사이즈3 : " + al3.size());
		}

		model.addAttribute("urls", al1);
		model.addAttribute("titles", al2);
		model.addAttribute("img", al3);

		String station = (String) addr.get("SIMPLEADDRESS");
		String url = "https://m.search.naver.com/search.naver?sm=mtp_hty.top&where=m&query=" + station + "날씨";
		Document doc = null;
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			String temperate = doc.select("div.temperature_text").first().text();
			String weather = doc.select("p.summary span.weather.before_slash").first().text();
			model.addAttribute("temperate", temperate);// 온도
			model.addAttribute("weather", weather);// 맑음
			String info = "";
			switch (weather) {
			case "맑음":
				info = "맑음.png";
				break;
			case "구름조금":
				info = "구름조금.png";
				break;
			case "구름많음":
				info = "구름많음.png";
				break;
			case "흐림":
				info = "흐림.png";
				break;
			case "비":
				info = "비.png";
				break;
			case "한때 비":
			case "소나기":
				info = "한때비.png";
				break;
			case "천둥번개":
				info = "천둥번개.png";
				break;
			}
			model.addAttribute("info", info);
		} catch (Exception e) {
			System.out.println("오류 났음..");
		}

		return "/board/News.market";

	}

	@RequestMapping(value = "/changeStatus.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public int changeStatus(@RequestParam Map map, Model model, Principal principal) {

		int aff = boardService.updateStatus(map);
		return aff;
	}

	@PostMapping("/search.do")
	public String search(Model model, @RequestParam Map map, Principal principal) {

		String board = map.get("board").toString();

		List<BoardDTO> searchList = new Vector<BoardDTO>();

		map.put("email", principal.getName());

		UserDTO user = userService.selectOne(map);

		map.put("userno", user.getUserno());

		AddressDTO address = addressService.selectOne(map);

		String simpleAddr = address.getSimpleAddress();

		map.put("addrno", address.getAddrNo());
		map.put("simpleAddress", simpleAddr);

		switch (board) {
		case "경매":
			searchList = boardService.searchAuction(map);
			break;
		case "우리동네":
			searchList = boardService.searchGropBoard(map);
			break;
		}

		List<List<ImageDTO>> imageList = new Vector<List<ImageDTO>>();

		for (int i = 0; i < searchList.size(); i++) {
			map.put("auction_no", searchList.get(i).getAuction_no());

			List<ImageDTO> images = imageService.selectList(map);
			imageList.add(images);
		}

		List<Integer> likes = boardService.selectLikeList(map);

		model.addAttribute("LISTS", searchList);
		model.addAttribute("likes", likes);
		model.addAttribute("imageList", imageList);
		model.addAttribute("address", map.get("simpleAddress"));
		model.addAttribute("nowUser", map.get("userno"));

		return "/board/SearchList.market";
	}

	// 이미지 분석
	@RequestMapping(value = "/image.do", produces = "application/json;charset=UTF-8")
	public String image(@RequestParam Map map, Model model, Principal principal) {

		return "/board/ImageAnalysis.market";

	}

	//카테고리아이템용
	@RequestMapping(value="/myAddressItemList.do",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String myAddressItemList(@RequestParam Map map,Model model,Principal principal) throws JsonProcessingException {
			map.put("email", principal.getName());
			UserDTO record = userService.selectOne(map);
			map.put("userno", record.getUserno());
			String[] simpleAddr = map.get("nowAddress").toString().split(" ");
			map.put("simpleAddress", simpleAddr[1]);
			map.put("board", "동네아이템가져오기");
			List<BoardDTO>itemlist = boardService.selectListAll(map);
			return objectMapper.writeValueAsString(itemlist);
	}
	
	

}
