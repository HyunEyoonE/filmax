package site.filmax.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import site.filmax.admin.service.StaticService;

@Controller
@RequestMapping("/static/*")
public class StaticController {
	@Autowired
	private StaticService service;
	
	@GetMapping("dashboard")
	public String dashboard (Model model) {
		return service.dashboard(model);
	}
	
}
