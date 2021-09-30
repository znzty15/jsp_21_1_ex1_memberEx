package com.javaGG.ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	
	public static final int MEMBER_NONEXITSTMENT = 0;
	public static final int MEMBER_EXITSTMENT = 1;
	public static final int MEMBER_JOIN_FAIL = 0;
	public static final int MEMBER_JOIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_PW_NO_GOOD = 0;
	public static final int MEMBER_LOGIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_ID_NOT = -1;	
	
	public MemberDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public int insertMember(MemberDTO dto) {
		int ri= 0;
		
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    String query = "insert into memberex values(?, ?, ?, ?, ?)";
	    
	    try {	    	
	    	conn = getConnection();
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getAddr());			
			
		    pstmt.executeUpdate();
		    ri = MemberDAO.MEMBER_JOIN_SUCCESS;		    
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}	    
		return ri;
	}
	
	//* 이미 있는 아이디를 생성할 때 안되게 DB를 확인하는 것
	public int confirmId(String id) {  //* joinOk에서 호출할때 id값으로 불러온다
		int ri = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select id from memberex where id = ?";		
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			//아이디 유무 판단
			if(rs.next()) { //rs에 값이 들어있으면 참 없으면 거짓
				ri = MemberDAO.MEMBER_EXITSTMENT; //아이디가 있으면 1
			} else {
				ri = MemberDAO.MEMBER_NONEXITSTMENT; //아이디가 없으면 0
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return ri;
	}
	
	private Connection getConnection() {
		
		Context context = null;
		DataSource dataSource = null;
		Connection conn = null;		
		try {
			context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");		
			conn = dataSource.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return conn;
	}

}
