package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.entity.jobs;


public class JobDao {
	
	private Connection conn;
	private Object id;

	public JobDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addJobs(jobs j) {
		
		boolean f= false;
		
		try {
			
			String sql ="insert into job_portal.jobs(title,description,category,status,location) values(?,?,?,?,?)";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getStatus());
			ps.setString(5, j.getLocation());
			int i =ps.executeUpdate();
			if(i == 1) {
				f=true;
			}
		}
		
		catch(Exception e)
			{
				e.printStackTrace();
			}
		
		
		return f;
		
		
		
		
	}
	
	public List<jobs> getAllJobs(){
		List<jobs> list =new ArrayList<jobs>();
	
		jobs j =null;
		try {
			
			
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM job_portal.jobs ORDER BY id DESC");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				j = new jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+"");
				
				list.add(j);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	
	
	
	public List<jobs> getAllJobsForUser(){
		List<jobs> list =new ArrayList<jobs>();
	
		jobs j =null;
		try {
			
			
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM job_portal.jobs where status=? ORDER BY id DESC");
			ps.setString(1,"Active");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				j = new jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+"");
				
				list.add(j);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	
	public jobs getJobById(int id) {
	    jobs j = null;
	    try {
	        PreparedStatement ps = conn.prepareStatement("SELECT * FROM job_portal.jobs WHERE id = ?");
	        ps.setInt(1, id);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            j = new jobs();
	            j.setId(rs.getInt(1));
	            j.setTitle(rs.getString(2));
	            j.setDescription(rs.getString(3));
	            j.setCategory(rs.getString(4));
	            j.setStatus(rs.getString(5));
	            j.setLocation(rs.getString(6));
	            j.setPdate(rs.getTimestamp(7) + "");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return j;
	}

	
	public boolean updateJob(jobs j) {
		
		
boolean f= false;
		
		try {
			
			String sql ="update job_portal.jobs set title=?,description=?,category=?,status=?,location=? where id=? ";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getStatus());
			ps.setString(5, j.getLocation());
			ps.setInt(6, j.getId());
			int i =ps.executeUpdate();
			if(i == 1) {
				f=true;
			}
		}
		
		catch(Exception e)
			{
				e.printStackTrace();
			}
		
		
		return f;

		
	}
	
	public boolean deleteJobs(int id) {
		boolean f=false;
		try {
			

			PreparedStatement ps = conn.prepareStatement("DELETE FROM job_portal.jobs WHERE id = ?");
			ps.setInt(1, id);
			int i =ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			else {
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
		
	}

//	public Object getId() {
//		return id;
//	}
//
//	public void setId(Object id) {
//		this.id = id;
//	}



public List <jobs> getjobsORLocationAndCate(String category,String location){
	List<jobs> list =new ArrayList<jobs>();
	jobs j =null;
	try {
		String sql = "select * from job_portal.jobs where category=? or location=? order by id DESC ";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1,category);
		ps.setString(2,location);
		
		ResultSet rs =ps.executeQuery();
		while(rs.next()) {
			j= new jobs();
			
			j.setId(rs.getInt(1));
			j.setTitle(rs.getString(2));
			j.setDescription(rs.getString(3));
			j.setCategory(rs.getString(4));
			j.setStatus(rs.getString(5));
			j.setLocation(rs.getString(6));
			j.setPdate(rs.getTimestamp(7)+"");
			
			list.add(j);
			
		}
		
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	return list;
}




public List <jobs> getjobsAndLocationAndCate(String category,String location){
	List<jobs> list =new ArrayList<jobs>();
	jobs j =null;
	try {
		String sql = "select * from job_portal.jobs where category=? And location=? order by id DESC ";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1,category);
		ps.setString(2,location);
		
		ResultSet rs =ps.executeQuery();
		while(rs.next()) {
			j= new jobs();
			
			j.setId(rs.getInt(1));
			j.setTitle(rs.getString(2));
			j.setDescription(rs.getString(3));
			j.setCategory(rs.getString(4));
			j.setStatus(rs.getString(5));
			j.setLocation(rs.getString(6));
			j.setPdate(rs.getTimestamp(7)+"");
			
			list.add(j);
			
		}
		
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	return list;
}	
	
	
}
