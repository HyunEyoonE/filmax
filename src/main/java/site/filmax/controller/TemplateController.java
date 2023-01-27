package site.filmax.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/template/*")
public class TemplateController {
	
	@GetMapping("index")
	public String index() {
		return "template/index";
	}
	
	@GetMapping("anime-details")
	public String animedetails() {
		return "template/anime-details"; 
	}
	
	@GetMapping("blog")
	public String blog() {
		return "template/blog";
	}
}
