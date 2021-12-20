package com.kh.mypage.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.mypage.model.vo.Order;

import static com.kh.common.JDBCTemplate.*;

public class MemberReserveDao {

	Properties prop = new Properties();
	
	public MemberReserveDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(MemberReserveDao.class.getResource("/db/sql/mypage-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 예매내역조회
	public ArrayList<Order> selectReserve(Connection conn, int memNo){
		ArrayList<Order> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;	
		String sql = prop.getProperty("selectReserve");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				String opt = "";
				switch(rset.getString("order_opt")) {
				case "C" : opt = "어린이"; break;
				case "T" : opt = "청소년"; break;
				case "A" : opt = "성인"; break;
				default : break;
				}
				
				String status = "";
				switch(rset.getString("order_status")) {
				case "W" : status = "입금대기"; break;
				case "P" : status = "결제완료"; break;
				case "C" : status = "예매취소"; break;
				case "CC" : status = "취소완료"; break;
				case "N" : status = "취소거절"; break;
				case "O" : status = "예매확정"; break;
				default : break;
				}
				
				list.add(new Order(rset.getInt("mem_no"),
								   rset.getInt("order_no"),
								   rset.getInt("final_price"),
								   rset.getDate("order_date"),
								   rset.getInt("pno"),
								   rset.getString("title"),
								   rset.getString("main_img"),
								   opt,
								   rset.getInt("order_count"),
								   status));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	// 예매내역 상세조회
	public Order selectReserveDetail(Connection conn, int memNo) {
		Order detailView = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;	
		String sql = prop.getProperty("selectReserveDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				String opt = "";
				switch(rset.getString("order_opt")) {
				case "C" : opt = "어린이"; break;
				case "T" : opt = "청소년"; break;
				case "A" : opt = "성인"; break;
				default : break;
				}
				
				String payOpt = "";
				switch(rset.getString("pay_opt")) {
				case "C" : payOpt = "신용카드"; break;
				case "D" : payOpt = "무통장입금"; break;
				default : break;
				}
				
				detailView = new Order(rset.getInt("order_no"),
									   rset.getDate("order_date"),
									   rset.getString("order_name"),
									   rset.getInt("pno"),
									   rset.getString("title"),
									   rset.getString("main_img"),
									   opt,
									   rset.getInt("order_count"),
									   rset.getString("area"),
									   rset.getDate("pay_date"),
									   payOpt,
									   rset.getInt("pay_price"),
									   rset.getString("order_phone"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return detailView;
	}

}