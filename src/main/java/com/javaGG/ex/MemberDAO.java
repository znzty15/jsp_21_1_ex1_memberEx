package com.javaGG.ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
	    //ResultSet rs = null;
	    
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
