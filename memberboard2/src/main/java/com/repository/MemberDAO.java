package com.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.common.JDBCUtil;

public class MemberDAO {
	
	// 회원 추가
	public void addMember(Member member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "INSERT INTO t_member(memberid, passwd, name, gender) VALUES (?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getGender());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	// 회원 목록
	public ArrayList<Member> getListAll(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<Member> memberList = new ArrayList<>();
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM t_member ORDER BY joindate";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Member member = new Member();
				member.setMemberId(rs.getString("memberId"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setGender(rs.getString("gender"));
				member.setJoinDate(rs.getDate("joindate"));
				memberList.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return memberList;
	}
	
	// 로그인 체크
	public Boolean checkLogin(String memberId, String password) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		conn = JDBCUtil.getConnection();
		String sql = "SELECT * FROM t_member WHERE memberid=? and passwd=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return false;
	}
	
	// 회원 삭제
	public void deleteMember(String memberId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		conn = JDBCUtil.getConnection();
		String sql = "DELETE FROM t_member WHERE memberid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	// 회원 정보
	public Member getMember(String memberId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Member member = new Member();
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM t_member WHERE memberId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member.setMemberId(rs.getString("memberId"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getNString("name"));
				member.setGender(rs.getString("gender"));
				member.setJoinDate(rs.getDate("joinDate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		
		return member;
	}
	
	// 회원 수정
	public void updateMember(Member member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "UPDATE t_member SET passwd=?, name=?, gender=? WHERE memberId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPasswd());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getGender());
			pstmt.setString(4, member.getMemberId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	// 아아디 중복 확인
	public boolean IdCheck(String memberId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT memberid FROM t_member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				if(memberId.equals(rs.getString("memberid"))){
					return false;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return true;
	}
}
