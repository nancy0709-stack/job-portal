package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBconnect;
import com.entity.User;
import com.dao.UserDao;
import com.entity.admin;
import com.dao.adminDao;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String em = req.getParameter("email");
            String ps = req.getParameter("password");
            adminDao adminDao = new adminDao(DBconnect.getConn());
            UserDao userDao = new UserDao(DBconnect.getConn());
            HttpSession session = req.getSession();

            admin loggedInAdmin = adminDao.login(em, ps); // Validate admin login
            if (loggedInAdmin != null) {
                loggedInAdmin.setRole("admin");
                session.setAttribute("userobj", loggedInAdmin);
                resp.sendRedirect("admin.jsp"); // Redirect to admin page
            } else {
                User user = userDao.login(em, ps); // Validate regular user login
                if (user != null) {
                    session.setAttribute("userobj", user);
                    resp.sendRedirect("home.jsp"); // Redirect to user's home page
                } else {
                    session.setAttribute("succMsg", "Invalid Email and Password");
                    resp.sendRedirect("login.jsp"); // Redirect to login with error message
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions here
        }
    }
}
