package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import com.entity.admin;


public class adminDao {
	
private Connection conn;
	

	public adminDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public  boolean addadmin(admin u) {
	    boolean f = false;
	    try {
	    	String sql = "INSERT INTO job_portal.admin (name, email, mobile, password, role) VALUES (?, ?, ?, ?, ?)";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, u.getName());
	        ps.setString(2, u.getEmail());
	        ps.setString(3,u.getMobile());
	        ps.setString(4, u.getPassword());
	     
	        ps.setString(5, "admin");
	        
	        int i = ps.executeUpdate();
	        
	        if (i==1) {
	            f = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		return f;
	   
	}



	public admin login(String em, String psw) {
		admin u = null;
		try {
			
			String sql = "select * from job_portal.admin where email=? and password=?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1,em);
	        ps.setString(2,psw);
	        ResultSet rs =ps.executeQuery();
	        while(rs.next()) {
	        	
	        	u = new admin();
	        	u.setId(rs.getInt(1));
	        	u.setName(rs.getString(2));
	        	u.setEmail(rs.getString(3));
	        	u.setMobile(rs.getString(4));
	        	u.setPassword(rs.getString(5));
	        	
	        	u.setRole(rs.getString(6)); 	
	        	
	  
	        }
	        
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return u;
		
	
	}
	

}


