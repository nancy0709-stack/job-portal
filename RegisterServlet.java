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
import com.entity.jobs;

    @WebServlet("/register")
    public class RegisterServlet extends HttpServlet {
        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            try {
                String name = req.getParameter("name");
                String qua = req.getParameter("qua");
                String email = req.getParameter("email");
                String ps = req.getParameter("ps");

                UserDao dao = new UserDao(DBconnect.getConn());

                HttpSession session = req.getSession();

                
        		
    			User u = new User();
    			u.setName(name);
    			u.setEmail(email);
    			u.setPassword(ps);
    			u.setQualification(qua);
    			u.setRole("user");;
    			
    		
                boolean isUserAdded = dao.addUser(u);

                if (isUserAdded) {
                    session.setAttribute("successMessage", "User registered successfully.");
                    resp.sendRedirect("signup.jsp");
                } else {
                    session.setAttribute("errorMessage", "Failed to register user.");
                    resp.sendRedirect("signup.jsp");
                }
            } catch (Exception e) {
                e.printStackTrace();
              
            }
        }
    }

