package com.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.common.JDBCUtil;

public class AddrBookDAO {
	// JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// 주소 추가
	public void addAddress(AddrBook addrBook) {
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "INSERT INTO t_address(num, username, tel, email, gender)"
					+ " VALUES (ab_seq.NEXTVAL, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, addrBook.getUsername());
			pstmt.setString(2, addrBook.getTel());
			pstmt.setString(3, addrBook.getEmail());
			pstmt.setString(4, addrBook.getGender());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	// 주소 목록
	public ArrayList<AddrBook> getListAll(){
		ArrayList<AddrBook> addrList = new ArrayList<>();
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM t_address ORDER BY num";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AddrBook addrBook = new AddrBook();
				addrBook.setNum(rs.getInt("num"));
				addrBook.setUsername(rs.getString("username"));
				addrBook.setTel(rs.getString("tel"));
				addrBook.setEmail(rs.getString("email"));
				addrBook.setGender(rs.getString("gender"));
				addrBook.setJoinDate(rs.getDate("joinDate"));
				addrList.add(addrBook);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		return addrList;
	}
	
	// 로그인 체크
	public boolean checkLogin(String email) {
		conn = JDBCUtil.getConnection();
		String sql = "SELECT email FROM t_address WHERE email = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;	// 이메일 일치
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return false;	// 이메일 불일치
	}
	
	
	// 등록 번호로 사용자 찾기
	public AddrBook getAbByUserNum(String num) {
		AddrBook addrBook = new AddrBook();
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM t_address WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				addrBook.setNum(rs.getInt("num"));
				addrBook.setUsername(rs.getString("username"));
				addrBook.setTel(rs.getString("tel"));
				addrBook.setEmail(rs.getString("email"));
				addrBook.setGender(rs.getString("gender"));
				addrBook.setJoinDate(rs.getDate("joinDate"));
			}

		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return addrBook;
	}
	
	// 사용자 수정하기
	public void editUser(AddrBook addrBook) {
		try {
			conn = JDBCUtil.getConnection();
			String sql = "UPDATE t_address SET username=?, tel=?, email=?, gender=? WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, addrBook.getUsername());
			pstmt.setString(2, addrBook.getTel());
			pstmt.setString(3, addrBook.getEmail());
			pstmt.setString(4, addrBook.getGender());
			pstmt.setInt(5, addrBook.getNum());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	// 등록 번호로 사용자 삭제하기
	public void deleteUser(String num) {
		try {
			conn = JDBCUtil.getConnection();
			String sql = "DELETE FROM t_address WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	// 재정렬 하기
	public void reform() {
		ArrayList<AddrBook> addrList = new ArrayList<>();
		try {	// ArrayList에 목록 저장
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM t_address ORDER BY num";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AddrBook addrBook = new AddrBook();
				addrBook.setUsername(rs.getString("username"));
				addrBook.setTel(rs.getString("tel"));
				addrBook.setEmail(rs.getString("email"));
				addrBook.setGender(rs.getString("gender"));
				addrBook.setJoinDate(rs.getDate("joinDate"));
				addrList.add(addrBook);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		try {	// 테이블 데이터 삭제
			conn = JDBCUtil.getConnection();
			String sql = "DELETE FROM t_address";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, pstmt);
		}
		try {	// seq 삭제
			conn = JDBCUtil.getConnection();
			String sql = "DROP SEQUENCE ab_seq";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, pstmt);
		}
		try {	// seq 재설정
			conn = JDBCUtil.getConnection();
			String sql = "CREATE SEQUENCE ab_seq"
					+ " INCREMENT BY 1"
					+ " START WITH 1"
					+ " MINVALUE 1"
					+ " MAXVALUE 1000"
					+ " NOCYCLE"
					+ " NOCACHE";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, pstmt);
		}
		for(int i=0; i<addrList.size(); i++) {
			try {	// 다시 재입력
				conn = JDBCUtil.getConnection();
				String sql = "INSERT INTO t_address(num, username, tel, email, gender, joinDate)"
						+ " VALUES (ab_seq.NEXTVAL, ?, ?, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, addrList.get(i).getUsername());
				pstmt.setString(2, addrList.get(i).getTel());
				pstmt.setString(3, addrList.get(i).getEmail());
				pstmt.setString(4, addrList.get(i).getGender());
				pstmt.setDate(5, (Date)addrList.get(i).getJoinDate());
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(conn, pstmt);
			}
		}
	}
}
