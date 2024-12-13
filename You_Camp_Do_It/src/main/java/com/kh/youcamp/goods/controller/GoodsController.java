package com.kh.youcamp.goods.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.youcamp.goods.model.service.GoodsService;
import com.kh.youcamp.goods.model.vo.Goods;

@Controller
public class GoodsController
{
	@Autowired
	private GoodsService goodsService;
	
	@GetMapping("product.gs")
	public ModelAndView selectList(ModelAndView mv)
	{
		// /WEB-INF/views/board/boardListView.jsp
		mv.setViewName("goods/shoppingMall");
		return mv;
	}
	
	@ResponseBody
	@PostMapping(value="enrollGoods.gs", produces="text/html; charset=UTF-8")
	public void insertGoods(Goods g)
	{
		int result = goodsService.insertGoods(g);
	}
}
