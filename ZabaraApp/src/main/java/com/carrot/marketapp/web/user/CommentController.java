package com.carrot.marketapp.web.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.carrot.marketapp.model.service.impl.CommentServiceimpl;

@Controller
@RequestMapping("/town")
public class CommentController {
	
	@Autowired
	CommentServiceimpl commentService;
	

}
