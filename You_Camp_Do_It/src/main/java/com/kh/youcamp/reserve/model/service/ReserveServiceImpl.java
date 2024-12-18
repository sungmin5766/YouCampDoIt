package com.kh.youcamp.reserve.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.youcamp.reserve.model.dao.ReserveDao;
import com.kh.youcamp.reserve.model.vo.Reserve;
import com.kh.youcamp.reserve.model.vo.RestSite;

@Service
public class ReserveServiceImpl implements ReserveService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ReserveDao reserveDao;

	/**
	 * 24.12.18 정성민
	 * 캠핑장 섹션별 남은자리 갯수 조회용 서비스 메소드
	 */
	@Override
	public ArrayList<RestSite> selectRestSite(Reserve r) {
		
		return reserveDao.selectRestSite(sqlSession, r);
	}
	
	
	

}
