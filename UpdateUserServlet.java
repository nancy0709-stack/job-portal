package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBconnect;
import com.dao.UserDao;
import com.entity.User;

@WebServlet("/update_profile")
public class UpdateUserServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		

	
		 try {
		     int id =Integer.parseInt(req.getParameter("id"));
             String name = req.getParameter("name");
             String qua = req.getParameter("qua");
             String email = req.getParameter("email");
             String ps = req.getParameter("ps");

             UserDao dao = new UserDao(DBconnect.getConn());

             HttpSession session = req.getSession();

             
     		
 			User u = new User();
 			u.setId(id);
 			u.setName(name);
 			u.setEmail(email);
 			u.setPassword(ps);
 			u.setQualification(qua);
 		
 			
 		
             boolean isUserAdded = dao.updateUser(u);

             if (isUserAdded) {
                 session.setAttribute("successMessage", "User registered successfully.");
                 resp.sendRedirect("home.jsp");
             } else {
                 session.setAttribute("errorMessage", "Failed to register user.");
                 resp.sendRedirect("login.jsp");
             }
         } catch (Exception e) {
             e.printStackTrace();
           
         }
     }
	

}
