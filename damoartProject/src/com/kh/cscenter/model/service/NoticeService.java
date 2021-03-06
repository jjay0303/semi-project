package com.kh.cscenter.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.Attachment;
import com.kh.common.model.vo.PageInfo;
import com.kh.cscenter.model.dao.NoticeDao;
import com.kh.cscenter.model.vo.Notice;

public class NoticeService {
	
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new NoticeDao().selectListCount(conn);
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<Notice> selectList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectList(conn, pi);
		close(conn);
		return list;
	}
	
	public ArrayList<Notice> selectList() {
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectList(conn);
		close(conn);
		return list;
	}
	
	public int increaseCount(int noticeNo) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().increaseCount(conn, noticeNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	public Notice selectNotice(int noticeNo) {
		Connection conn = getConnection();
		Notice n = new NoticeDao().selectNotice(conn, noticeNo);
		close(conn);
		return n;
	}
	
	public Notice updateDetailNotice(int noticeNo) {
		Connection conn = getConnection();
		Notice n = new NoticeDao().updateDetailNotice(conn, noticeNo);
		close(conn);
		return n;
	}
	
	public ArrayList<Attachment> selectAttachment(int noticeNo) {
		Connection conn = getConnection();
		ArrayList<Attachment> atList = new NoticeDao().selectAttachment(conn, noticeNo);
		close(conn);
		return atList;
	}
	
	public int updateNotice(Notice n, ArrayList<Attachment> list) {
		
		Connection conn = getConnection();
		
		int result1 = new NoticeDao().updateNotice(conn, n);
		
		int result2 = 1;
		
		if(list != null) {
			for(Attachment a : list) {
				if(a.getFileNo() != 0) {
					result2 *= new NoticeDao().updateAttachment(conn, a);
				}else {
					result2 *= new NoticeDao().insertNewAttachment(conn, a);
				}
			}
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}
	
	public int insertNotice(Notice n, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		
		int result1 = new NoticeDao().insertNotice(conn, n);
		
		int result2 = 1;
		
		if(list != null) {
			
			result2 = new NoticeDao().insertAttachment(conn, list);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
		
	}
	
	public int deleteNotice(int noticeNo) {
		Connection conn = getConnection();
		int result = new NoticeDao().deleteNotice(conn, noticeNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int selectSearchListCount(String category, String keyword) {
		Connection conn = getConnection();
		int listCount = 0;
		if(category.equals("searchTitle")) {
			
			listCount = new NoticeDao().selectTitleSearchListCount(conn, keyword);
		}else {
			listCount = new NoticeDao().selectContentSearchListCount(conn, keyword);
		}
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<Notice> selectSearchList(PageInfo pi, String category, String keyword) {
		Connection conn = getConnection();
		ArrayList<Notice> list = new ArrayList<>();
		if(category.equals("searchTitle")) {
			list = new NoticeDao().selectTitleSearchList(conn, pi, keyword);
		}else {
			list = new NoticeDao().selectContentSearchList(conn, pi, keyword);
		}
		close(conn);
		return list;
	}
	
	public int adminSelectSearchListCount(String keyword) {
		Connection conn = getConnection();
		int listCount = 0;
		listCount = new NoticeDao().adminSelectSearchListCount(conn, keyword);
		close(conn);
		return listCount;
		
	}
	
	public ArrayList<Notice> adminSelectSearchList(PageInfo pi, String keyword) {
		Connection conn = getConnection();
		ArrayList<Notice> list = new ArrayList<>();		
		list = new NoticeDao().adminSelectSearchList(conn, pi, keyword);		
		close(conn);
		return list;
	}


}
