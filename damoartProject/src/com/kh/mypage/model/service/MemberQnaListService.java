package com.kh.mypage.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.mypage.model.dao.MemberQnaListDao;
import com.kh.mypage.model.vo.Qna;

public class MemberQnaListService {

	public ArrayList<Qna> selectQnaList(String nickName){
		Connection conn = getConnection();
		ArrayList<Qna> list = new MemberQnaListDao().selectQnaList(conn, nickName);
		close(conn);
		return list;
	}
	
}