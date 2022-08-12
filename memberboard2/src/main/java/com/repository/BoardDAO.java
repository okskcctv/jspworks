package com.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.common.JDBCUtil;

public class BoardDAO {

		// 새글 추가
		public void insertBoard(Board board) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			conn = JDBCUtil.getConnection();
			String sql = "INSERT INTO t_board(title, content, memberId)"
					+ "VALUES (?, ?, ?)";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, board.getTitle());
				pstmt.setString(2, board.getContent());
				pstmt.setString(3, board.getMemberId());
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn, pstmt);
			}
		}
		
		// 게시글 목록 조회
		public ArrayList<Board> getListAll(){
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			ArrayList<Board> boardList = new ArrayList<>();
			
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM t_board ORDER BY bnum DESC";
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Board board = new Board();
					board.setBnum(rs.getInt("bnum"));
					board.setTitle(rs.getString("title"));
					board.setContent(rs.getString("content"));
					board.setRegDate(rs.getDate("regdate"));
					board.setMemberId(rs.getString("memberId"));
					board.setHit(rs.getInt("hit"));
					boardList.add(board);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn, pstmt, rs);
			}
			return boardList;
		}
		
		// 게시글 조회
		public Board getBoard(int bnum) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			Board board = new Board();
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM t_board WHERE bnum=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bnum);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					board.setBnum(rs.getInt("bnum"));
					board.setTitle(rs.getString("title"));
					board.setContent(rs.getString("content"));
					board.setRegDate(rs.getDate("regdate"));
					board.setMemberId(rs.getString("memberId"));
					board.setHit(rs.getInt("hit"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn, pstmt, rs);
			}
			return board;
		}
		
		// 게시물 삭제
		public void deleteBoard(int bnum) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			conn = JDBCUtil.getConnection();
			String sql = "DELETE FROM t_board WHERE bnum=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bnum);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn, pstmt);
			}
		}
		
		// 게시물 수정
		public void updateBoard(Board board) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			conn = JDBCUtil.getConnection();
			String sql = "UPDATE t_board SET title=?, content=? WHERE bnum=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, board.getTitle());
				pstmt.setString(2, board.getContent());
				pstmt.setInt(3, board.getBnum());
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn, pstmt);
			}
		}
		
		// 조회수 측정
		public void updateHit(int bnum) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				conn = JDBCUtil.getConnection();
				String sql = "SELECT * FROM t_board WHERE bnum=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bnum);
				rs = pstmt.executeQuery();
				int hit = 0;
				if(rs.next()) {
					hit = rs.getInt("hit") + 1;
				}
				
				// 조회수 업데이트 처리
				sql = "UPDATE t_board SET hit=? WHERE bnum=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, hit);
				pstmt.setInt(2, bnum);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn, pstmt, rs);
			}
		}
}
