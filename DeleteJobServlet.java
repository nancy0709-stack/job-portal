package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBconnect;
import com.dao.JobDao;

@WebServlet("/delete")

public class DeleteJobServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			JobDao dao= new JobDao(DBconnect.getConn());
			boolean f=dao.deleteJobs(id);
			
	HttpSession session=req.getSession();
			
			if(f) {
				
				session.setAttribute("succMSg","Job Post Delete Successfully..");
				resp.sendRedirect("view_jobs.jsp");
				
			}
			else {
				
				session.setAttribute("succMSg","Something wrong on server..");
				resp.sendRedirect("signup.jsp");
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	

}
