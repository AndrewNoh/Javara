package com.carrot.marketapp.web;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainViewController {

	@RequestMapping({ "/", "/location/MainPage.do" })
	public String mainPage(Authentication auth, Model model) {
		if (auth != null) {
			String id = auth.getName();
		}

		return "MainPage.market";
	}

}
