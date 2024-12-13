package com.kh.youcamp.cart.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.youcamp.cart.model.dao.CartDao;
import com.kh.youcamp.cart.model.vo.Cart;
import com.kh.youcamp.member.model.vo.Member;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CartDao cartDao;

	@Override
	public ArrayList<Cart> selectList(int memberNo) {
		return cartDao.selectList(sqlSession, memberNo);
	}

	@Override
	@Transactional
	public int insertCart(Cart cart) {
		return 0; //cartDao.insertCart(sqlSession, cart);
	}

	@Override
	@Transactional
	public int deleteCart(int cartNo) {
	// public int deleteCart(String[] cartNoList) {
		// return cartDao.deleteCart(sqlSession, cartNoList);
		return cartDao.deleteCart(sqlSession, cartNo);
	}

}
