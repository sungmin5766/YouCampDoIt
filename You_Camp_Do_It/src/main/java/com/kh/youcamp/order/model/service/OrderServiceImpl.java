package com.kh.youcamp.order.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.youcamp.order.model.dao.OrderDao;
import com.kh.youcamp.order.model.vo.Order;
import com.kh.youcamp.order.model.vo.OrderDetail;
import com.kh.youcamp.order.util.DataEncrypt;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private OrderDao orderDao;

	@Override
	@Transactional
	public int insertOrder(Order order) {
		return orderDao.insertOrder(sqlSession, order);
	}

	@Override
	public int selectGeneratedOrderNo() {
		return orderDao.selectGeneratedOrderNo(sqlSession);
	}

	@Override
	@Transactional
	public int insertOrderDetail(OrderDetail orderDetail) {
		return orderDao.insertOrderDetail(sqlSession, orderDetail);
	}

	@Override
	public Order selectOrder(int orderNo) {
		return orderDao.selectOrder(sqlSession, orderNo);
	}

	@Override
	public ArrayList<OrderDetail> selectOrederDetailList(int orderNo) {
		return orderDao.selectOrederDetailList(sqlSession, orderNo);
	}

	@Override
	@Transactional
	public int updateOrder(Order order) {
		return orderDao.updateOrder(sqlSession, order);
	}

	@Override
	public ArrayList<Order> selectOrederWithDetailListByMemberNo(int memberNo) {
		return orderDao.selectOrederWithDetailListByMemberNo(sqlSession, memberNo);
	}

	@Override
	public ArrayList<Order> selectOrederListByMemberNo(int memberNo) {
		return orderDao.selectOrederListByMemberNo(sqlSession, memberNo);
	}

	@Override
	@Transactional
	public int deleteOrder(int orderNo) {
		return orderDao.deleteOrder(sqlSession, orderNo);
	}

	///////////////////////////////////////////////////////////////////////////////
	// 재고 소진
	@Override
	public int remainStockCounting(int goodsNo, int counting) {
		return orderDao.remainStockCounting(sqlSession, goodsNo, counting);
	}
}
