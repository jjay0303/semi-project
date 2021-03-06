package com.kh.mypage.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
import com.kh.mypage.model.dao.MemberReserveDao;
import com.kh.mypage.model.vo.Order;

public class MemberReserveService {
	
	// 예매 내역 페이징바
	public int selectReListCount(int memNo) {
		Connection conn = getConnection();
		int relistCount = new MemberReserveDao().selectReListCount(conn, memNo); 
		close(conn);
		return relistCount; 
	}
	
	/*
	// 예매내역 조회
	public ArrayList<Order> selectReserve(int memNo) {
		
		Connection conn = getConnection();
		ArrayList<Order> list = new MemberReserveDao().selectReserve(conn, memNo);
		close(conn);
		return list;
	}
	*/
	
	public ArrayList<Order> selectReserve(int memNo, PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Order> list = new MemberReserveDao().selectReserve(conn, memNo, pi);
		close(conn);
		return list;
	}
	
	// 예매상세 
	public Order selectReserveDetail(int memNo, int oNo) {
		Connection conn = getConnection();
		Order detailView = new MemberReserveDao().selectReserveDetail(conn, memNo, oNo);
		close(conn);
		return detailView;
	}
	
	// 환불 내역 페이징바
	public int selectCaListCount(int memNo) {
		Connection conn = getConnection();
		int listCount = new MemberReserveDao().selectReListCount(conn, memNo); 
		close(conn);
		return listCount; 
	}

	// 취소/환불내역 조회
	public ArrayList<Order> selectRefund(int memNo, PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Order> clist = new MemberReserveDao().selectRefund(conn, memNo, pi);
		close(conn);
		return clist;
	}
	
	// 취소/환불 상세
	public Order selectRefundDetail(int memNo, int oNo) {
		Connection conn = getConnection();
		Order cdetailView = new MemberReserveDao().selectRefundDetail(conn, memNo, oNo);
		close(conn);
		return cdetailView;
	}
	
}
