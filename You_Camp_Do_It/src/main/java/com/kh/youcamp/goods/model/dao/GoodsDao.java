package com.kh.youcamp.goods.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.youcamp.common.model.vo.PageInfo;
import com.kh.youcamp.goods.model.vo.Goods;
import com.kh.youcamp.goods.model.vo.Rental;
import com.kh.youcamp.goods.model.vo.Search;
import com.kh.youcamp.order.model.vo.OrderDetail;

@Repository
public class GoodsDao {

	/* 상품정보 등록 */
	public int insertGoods(SqlSessionTemplate sqlSession, Goods g)
	{
		return sqlSession.insert("goodsMapper.insertGoods", g);
	}

	/* 등록된 상품 중 '판매', '품절' 개수 조회 */
	public int selectListCount(SqlSessionTemplate sqlSession)
	{
		return sqlSession.selectOne("goodsMapper.selectListCount");
	}

	/* 등록된 상품 중 '판매', '품절' 상품 리스트 조회 */
	public ArrayList<Goods> selectGoodsList(SqlSessionTemplate sqlSession, PageInfo pi)
	{
		Map<String, Object> pageSE = new HashMap<>();
				
		int start = (pi.getCurrentPage() - 1) * pi.getBoardLimit()+1;
		int end = start+pi.getBoardLimit()-1;
		
		pageSE.put("start", start);
		pageSE.put("end", end);

		return (ArrayList)sqlSession.selectList("goodsMapper.selectGoodsList", pageSE);
	}

	/* 상품 검색 리스트 개수 */
	public int searchingListCount(SqlSessionTemplate sqlSession, Search search){
		return sqlSession.selectOne("goodsMapper.searchingListCount", search);
	}
	
	/* 상품 검색 리스트 조회 */
	public ArrayList<Goods> searchingGoods(SqlSessionTemplate sqlSession, Search search, PageInfo pi)
	{
		Map<String, Object> pageSE = new HashMap<>();
		
		int start = (pi.getCurrentPage() - 1) * pi.getBoardLimit()+1;
		int end = start+pi.getBoardLimit()-1;
		if(search.getStartPrice() == "") {
			search.setStartPrice("0");
		}
		if(search.getEndPrice() == "") {
			search.setEndPrice("0");
		}
		int startPrice = Integer.parseInt(search.getStartPrice());
		int endPrice = Integer.parseInt(search.getEndPrice());
		
		pageSE.put("start", start);
		pageSE.put("end", end);
		pageSE.put("searchKeyword", search.getSearchKeyword());
		pageSE.put("searchCategory", search.getSearchCategory());
		pageSE.put("sort", search.getSort());
		pageSE.put("condition", search.getCondition());
		pageSE.put("startPrice", startPrice);
		pageSE.put("endPrice", endPrice);
		
		return (ArrayList)sqlSession.selectList("goodsMapper.searchingGoods", pageSE);
	}

	/* 상품 조회수 증가 */
	public int selectViewCount(SqlSessionTemplate sqlSession, int goods)
	{
		return sqlSession.update("goodsMapper.selectViewCount", goods);
	}
	
	/* 상품 상세 내용 조회 */
	public Goods selectOneGoods(SqlSessionTemplate sqlSession, int goods)
	{
		return sqlSession.selectOne("goodsMapper.selectOneGoods", goods);
	}

	/* 관리자 페이지 상품 전체 리스트 조회 */
	public ArrayList<Goods> ajaxGoodsSelect(SqlSessionTemplate sqlSession, Search search, PageInfo pi, String state) {
		Map<String, Object> pageSE = new HashMap<>();
		
		int start = (pi.getCurrentPage() - 1) * pi.getBoardLimit()+1;
		int end = start+pi.getBoardLimit()-1;
		
		pageSE.put("start", start);
		pageSE.put("end", end);
		
		pageSE.put("searchKeyword", search.getSearchKeyword());
		pageSE.put("searchCategory", search.getSearchCategory());
		pageSE.put("sort", search.getSort());
		pageSE.put("condition", search.getCondition());
		pageSE.put("startPrice", search.getStartPrice());
		pageSE.put("endPrice", search.getEndPrice());
		pageSE.put("state", state);
		
		return (ArrayList)sqlSession.selectList("goodsMapper.ajaxGoodsSelect", pageSE);
	}

	/* 관리자 페이지 선택적 리스트 개수 */
	public int ajaxSelectListCount(SqlSessionTemplate sqlSession, String state){
		return sqlSession.selectOne("goodsMapper.ajaxSelectListCount", state);
	}

	/* 전체 상품 개수 */
	public int totalCount(SqlSessionTemplate sqlSession, Search search){
		return sqlSession.selectOne("goodsMapper.totalCount");
	}

	/* 판매 상품 개수 */
	public int onSaleCount(SqlSessionTemplate sqlSession, Search search) {
		return sqlSession.selectOne("goodsMapper.onSaleCount");
	}

	/* 품절 상품 개수 */
	public int offSaleCount(SqlSessionTemplate sqlSession, Search search) {
		return sqlSession.selectOne("goodsMapper.offSaleCount");
	}

	/* 숨김 상품 개수 */
	public int hideCount(SqlSessionTemplate sqlSession, Search search) {
		return sqlSession.selectOne("goodsMapper.hideCount");
	}
	
	/* 관리자 페이지 상세 정보 조회 */
	public Goods ajaxGoodsDetail(SqlSessionTemplate sqlSession, int goodsNo) {
		return sqlSession.selectOne("goodsMapper.ajaxGoodsDetail", goodsNo);
	}

	/* 관리자 페이지 상세 정보 수정 */
	public int ajaxGoodsDetailUpdate(SqlSessionTemplate sqlSession, Goods g) {
		return sqlSession.update("goodsMapper.ajaxGoodsDetailUpdate", g);
	}
	
	/* 관리자 페이지 상세 정보 업데이트 페이지 이동 */
	public Goods adminUpdateGoods(SqlSessionTemplate sqlSession, int goodsNo) {
		return sqlSession.selectOne("goodsMapper.adminUpdateGoods", goodsNo);
	}
	
	/* 상품 정보 수정 */
	public int updateGoods(SqlSessionTemplate sqlSession, Goods g) {
		return sqlSession.update("goodsMapper.updateGoods", g);
	}
	
	/* 찜 유무 판별 */
	public int dibsCheck(SqlSessionTemplate sqlSession, int memberNo, int goodsNo) {
		Map<String, Object> dibs = new HashMap<>();
		dibs.put("memberNo", memberNo);
		dibs.put("goodsNo", goodsNo);
		
		return sqlSession.selectOne("goodsMapper.dibsCheck", dibs);
	}
	
	/* 상품 찜하기 */
	public int ajaxDibsInsert(SqlSessionTemplate sqlSession, int memberNo, int goodsNo) {

		Map<String, Object> dibs = new HashMap<>();
		dibs.put("memberNo", memberNo);
		dibs.put("goodsNo", goodsNo);
		
		return sqlSession.insert("goodsMapper.ajaxDibsInsert", dibs);
	}
	
	/* 상품 찜 삭제 */
	public int ajaxDibsDelete(SqlSessionTemplate sqlSession, int memberNo, int goodsNo) {

		Map<String, Object> dibs = new HashMap<>();
		dibs.put("memberNo", memberNo);
		dibs.put("goodsNo", goodsNo);
		return sqlSession.delete("goodsMapper.ajaxDibsDelete", dibs);
	}

	/* 내 찜 목록 */
	public ArrayList<Goods> selectDibs(SqlSessionTemplate sqlSession, int memberNo){
		return (ArrayList)sqlSession.selectList("goodsMapper.selectDibs", memberNo);
	}
	
	/* 내가 찜 한 목록 개수 */
	public int selectDibsCount(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("goodsMapper.selectDibsCount", memberNo);
	}
	
	/* 세일 품목 개수 조회 */
	public int discountListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("goodsMapper.discountListCount");
	}
	
	/* 세일 품목 불러오기 */
	public ArrayList<Goods> discountList(SqlSessionTemplate sqlSession, PageInfo pi) {
		Map<String, Object> pageSE = new HashMap<>();
		
		int start = (pi.getCurrentPage() - 1) * pi.getBoardLimit()+1;
		int end = start+pi.getBoardLimit()-1;
		
		pageSE.put("start", start);
		pageSE.put("end", end);

		return (ArrayList)sqlSession.selectList("goodsMapper.discountList", pageSE);
	}
	
	/* 전체 대여 개수 */
	public int AjaxRentalListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("goodsMapper.AjaxRentalListCount");
	}
	
	/* 대여(예정) 개수 */
	public int AjaxRentalCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("goodsMapper.AjaxRentalCount");
	}
	
	/* 반납 개수 */
	public int AjaxReturnCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("goodsMapper.AjaxReturnCount");
	}
	
	/* 목록 불러오기 */
	public ArrayList<OrderDetail> AjaxRentalList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		Map<String, Object> pageSE = new HashMap<>();
		
		int start = (pi.getCurrentPage() - 1) * pi.getBoardLimit()+1;
		int end = start+pi.getBoardLimit()-1;
		
		pageSE.put("start", start);
		pageSE.put("end", end);
		
		return (ArrayList)sqlSession.selectList("goodsMapper.AjaxRentalList", pageSE);
	}
	
	/* 상품 정보 불러오기 */
	public Goods ajaxRentalGoods(SqlSessionTemplate sqlSession, int goodsNo) {
		return sqlSession.selectOne("goodsMapper.ajaxRentalGoods", goodsNo);
	}
	
	/* 회원 정보 불러오기 */
	public Rental ajaxRentalMember(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.selectOne("goodsMapper.ajaxRentalMember", orderNo);
	}
	
/************************************************************************************************************************/	
/************************************************************************************************************************/	
/************************************************************************************************************************/	
	
	public ArrayList<Goods> selectGoodsThumbnailList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("goodsMapper.selectGoodsThumbnailList", memberNo);
	}

	public ArrayList<Goods> selectGoodsThumbnailListByOrderNo(SqlSessionTemplate sqlSession, int orderNo) {
		return (ArrayList)sqlSession.selectList("goodsMapper.selectGoodsThumbnailListByOrderNo", orderNo);
	}
}
