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
import com.carrot.marketapp.model.dto.ImageDTO;
import com.carrot.marketapp.model.dto.PayDTO;
import com.carrot.marketapp.model.dto.ReviewDTO;
import com.carrot.marketapp.model.dto.UserDTO;
import com.carrot.marketapp.model.service.PayService;
import com.carrot.marketapp.model.service.impl.AddressServiceimpl;
import com.carrot.marketapp.model.service.impl.BoardServiceimpl;
import com.carrot.marketapp.model.service.impl.ChatServiceimpl;
import com.carrot.marketapp.model.service.impl.ImageServiceimpl;
import com.carrot.marketapp.model.service.impl.PayServiceimpl;
import com.carrot.marketapp.model.service.impl.ReviewServiceimpl;
import com.carrot.marketapp.model.service.impl.UserServiceimpl;
import com.carrot.marketapp.util.FileUpDownUtils;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

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
	ReviewServiceimpl reviewService;
	
	
   @RequestMapping(value = "/review.do")
   @ResponseBody
   public int review(@RequestParam Map map, Model model, Authentication auth,Principal principal) throws Exception {
    
    BoardDTO userno = boardService.mypageReview(map);
    map.put("writeuserno", userno.getUserNo());
	int record = reviewService.mypagereviewInsert(map);
	
	//map.get("writeuserno");
	//map.get("userno");
	
	//xml 넣을때 에이작스에서 받은 데이터 명 (키값) 그대로 넣어주기#{} 

	return record;
   }

   @RequestMapping(value = "/review_return.do")
   @ResponseBody
   public List reviewreturn(@RequestParam Map map, Model model, Authentication auth,Principal principal) throws Exception {
	List<ReviewDTO> result = reviewService.mypagereviewSelect(map);

	  return result;
   }

}
