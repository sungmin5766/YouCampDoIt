package com.kh.youcamp.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageManagerController
{
	@GetMapping("addProduct.ma")
	public ModelAndView addProduct(ModelAndView mv)
	{
		mv.setViewName("goods/addProduct");
		return mv;
	}
	
	@GetMapping("Management.ma")
	public ModelAndView productManagement(ModelAndView mv)
	{
		mv.setViewName("goods/productManagement");
		return mv;
	}
	
	@ResponseBody
	@GetMapping("wrongApproach.ma")
	public ModelAndView wrongApproach(ModelAndView mv, HttpSession session) {
		session.setAttribute("wrongMsg", "잘못된 접근입니다.");
		mv.setViewName("redirect:/");
		return mv;
	}
}
