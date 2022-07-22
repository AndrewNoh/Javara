package com.carrot.marketapp.web.user;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UrlPathHelper;

import com.carrot.marketapp.model.dto.UserDTO;
import com.carrot.marketapp.model.service.impl.UserServiceimpl;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SNSLoginController {
	@Autowired
	UserServiceimpl userService;
	@Autowired
	ObjectMapper objectMapper;

	@RequestMapping(value = "/oauth2/code/kakao", method = RequestMethod.GET)
	public String loginpage_kakao_callback(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, Model model) throws Exception {
		UrlPathHelper urlPathHelper = new UrlPathHelper();
		String originalURL = urlPathHelper.getOriginatingRequestUri(request);
		Map<String, String[]> paramMap = request.getParameterMap();
		Iterator keyData = paramMap.keySet().iterator();
		Map dto = new HashMap<>();
		while (keyData.hasNext()) {
			String key = ((String) keyData.next());
			String[] value = paramMap.get(key);
			dto.put(key, value[0].toString());
		}
		String url = "https://kauth.kakao.com/oauth/token";
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
		LinkedMultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
		map.add("client_id", "c26800b2d4f7dfeab7a096be23eaa789");
		String redirect_url = "http://localhost:8080/marketapp/oauth2/code/kakao";

		map.add("redirect_uri", redirect_url.trim());
		map.add("grant_type", "authorization_code");
		map.add("code", dto.get("code").toString());
		System.out.println(map);
		HttpEntity<LinkedMultiValueMap<String, String>> request2 = new HttpEntity<LinkedMultiValueMap<String, String>>(
				map, headers);
		Map response2 = restTemplate.postForObject(url, request2, HashMap.class);
		map.clear();
		model.addAttribute("access_token", response2.get("access_token"));
		System.out.println(response2);
		return "/user/kakaoLoging.market";
	}

	@RequestMapping(value = "/userid_duplicate_check.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userid_duplicate_check(HttpServletRequest request, HttpServletResponse response, @RequestBody Map map,
			Model model) throws Exception {
		System.out.println("체크컨트롤러");

		model.addAttribute("email", map.get("email"));

		System.out.println(map.get("email"));// hezi98@naver.com
		System.out.println(map.get("pwd"));// 2307928395
		System.out.println(map.get("nickname"));// 조혜지
		System.out.println(map);// {pwd=2307928395, name=조혜지, email=hezi98@naver.com, join_pass=KAKAO,
								// nickname=조혜지, _csrf=72190f79-93df-4092-b00e-360efa95afea}

		Map result = new HashMap<>();

		UserDTO record = userService.selectOne(map);

		System.out.println(record);// null

		if (record != null) {// 가입이력이 있음
			result.put("result", "YES");
			result.put("id", map.get("email"));
			result.put("pwd", map.get("pwd"));
			result.put("nickname", map.get("nickname"));
			result.put("profile", map.get("profile"));
			return objectMapper.writeValueAsString(result);
		}
		// 가입 이력 없음
		result.put("result", "NOT");
		result.put("id", map.get("email"));
		result.put("pwd", map.get("pwd"));
		result.put("nickname", map.get("nickname"));
		result.put("profile", map.get("profile"));
		System.out.println("가입이력없음");
		// 아이디 비밀번호 저장

		return objectMapper.writeValueAsString(result);
	}

}