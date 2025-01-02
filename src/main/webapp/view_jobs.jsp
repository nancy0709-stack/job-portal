<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false"%>
<%@ page import="com.dao.JobDao" %>
<%@ page import="com.DB.DBconnect" %>
<%@ page import="com.entity.jobs" %>
<%@ page import="java.util.List" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page import="com.entity.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    
    <title>View Jobs</title>
    <%@include file="all_component/all_css.jsp" %>
</head>
<body style="background-color: #f0f1f2;">
<c:if test="${userobj.role ne 'admin'}">
    <c:redirect url="login.jsp" />
</c:if>
    <%@include file="all_component/navbar.jsp" %>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h5 class="text-center text-primary">All Jobs</h5>
    <c:if test="${not empty succMSg}">
    <div class="alert alert-success" role="alert">${succMSg}</div>
    <%-- Display your success message here --%>
    <c:remove var="succMSg"/>
</c:if>
                <% 
                JobDao dao = new JobDao(DBconnect.getConn());
                List<jobs> list = dao.getAllJobs();
                for(jobs j : list) { 
                %>
                <div class="card mt-2">
                    <div class="card-body">
                        <div class="text-center text-primary">
                            <i class="far fa-clipboard fa-2x"></i>
                        </div>

                        
                        <h6><%= j.getTitle()%></h6>
                        <p><%= j.getDescription()%></p>
                        <br>
                        <div class="form-row">
                            <div class="form-group col-md-3">
                                <input type="text" class="form-control form-control-sm" value="Location: <%= j.getLocation()%>" readonly>
                            </div>
                            <div class="form-group col-md-3">
                                <input type="text" class="form-control form-control-sm" value="Category: <%= j.getCategory()%>" readonly>
                            </div>
                            <div class="form-group col-md-3">
                                <input type="text" class="form-control form-control-sm" value="Status: <%= j.getStatus()%>" readonly>
                            </div>
                        </div>
                        <h6>Publish Date: <%= j.getPdate() %></h6>
                        <div class="text-center">
                            <a href="edit_job.jsp?id=<%=j.getId()%>"
                             class="btn btn-sm bg-success text-white">Edit</a>
                            <a href=" delete?id=<%=j.getId() %>"
                            class="btn btn-sm bg-danger text-white">Delete</a>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</body>
</html>
