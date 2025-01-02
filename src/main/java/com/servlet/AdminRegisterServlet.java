package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBconnect;

import com.dao.adminDao;

import com.entity.admin;


    @WebServlet("/admin_register")
    public class AdminRegisterServlet extends HttpServlet {
        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            try {
                String name = req.getParameter("name");
               
                String email = req.getParameter("email");
                String mobile = req.getParameter("mobile");
                String ps = req.getParameter("ps");

              adminDao dao = new adminDao(DBconnect.getConn());

                HttpSession session = req.getSession();

                
        		
    			admin u = new admin();
    			u.setName(name);
    			u.setEmail(email);
    			u.setMobile(mobile);
    			u.setPassword(ps);
    			
    			u.setRole("admin");
    			
    		
                boolean isUserAdded = dao.addadmin(u);

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

