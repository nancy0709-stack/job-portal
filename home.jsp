<%@page import="com.dao.JobDao"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.jobs"%>
<%@page import="com.servlet.LoginServlet"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User: View Jobs</title>
    <%@include file="all_component/all_css.jsp" %>
</head>
<body style="background-color: #f0f1f2;">
	
	<c:if test="${empty userobj}">
    <c:redirect url="login.jsp" />
</c:if>
	
    <%@include file="all_component/navbar.jsp" %>
    

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h5 class="text-center text-primary">All Jobs</h5>

                <div class="card">
                    <div class="card-body">
                        <form class="form-inline" action="more_view.jsp" method="get">

                            <div class="form-group col-md-5 mt-1">
                                <h5>Location</h5>
                            </div>

                            <div class="form-group col-md-4 mt-1">
                                <h5>Category</h5>
                            </div>

                            <div class="form-group col-md-5">
                                <select name="loc" class="custom-select" id="inlineFormCustomSelectPref">
                                    <option selected value="lo">Choose...</option>
                                    <option value="Kathmandu">Kathmandu</option>
                                    <option value="Bhaktapur">Bhaktapur</option>
                                    <option value="Lalitpur">Lalitpur</option>
                                    <option value="Kritipur">Kritipur</option>
                                </select>
                            </div>

                            <div class="form-group col-md-5">
                                <select name="cat" class="custom-select" id="inlineFormCustomSelectPref">
                                    <option selected value="ca">Choose...</option>
                                    <option value="FullStackDeveloper">FullStackDeveloper</option>
                                    <option value="FrontEndDeveloper">FrontEndDeveloper</option>
                                    <option value="UI/UX Designer">UI/UX Designer</option>
                                    <option value="QA">QA</option>
                                    <option value="Java Developer">Java Developer</option>
                                    <option value="WebDeveloper">WebDeveloper</option>
                                </select>
                            </div>
                            <button class="btn btn-success">Search</button>
                        </form>
                    </div>
                </div>

                <% 
                JobDao dao = new JobDao(DBconnect.getConn());
                List<jobs> list = dao.getAllJobsForUser();
                for (jobs j : list) {
                %>
                <div class="card mt-2">
                    <div class="card-body">
                        <div class="text-center text-primary">
                            <i class="far fa-clipboard fa-2x"></i>
                        </div>
                        <h6><%= j.getTitle() %></h6>
                        <% 
                        if (j.getDescription().length() > 0 && j.getDescription().length() < 120) {
                        %>
                        <p><%= j.getDescription() %></p>
                        <% 
                        } else {
                        %>
                        <p><%= j.getDescription().substring(0, 120) %></p>
                        <% 
                        }
                        %>
                        <div class="form-row">
                            <div class="form-group col-md-3">
                                <input type="text" class="form-control form-control-sm" value="Location:<%= j.getLocation() %>" readonly>
                            </div>
                            <div class="form-group col-md-3">
                                <input type="text" class="form-control form-control-sm" value="Category:<%= j.getCategory() %>" readonly>
                            </div>
                             <div class="form-group col-md-3">
                                <input type="text" class="form-control form-control-sm" value="status:<%= j.getStatus() %>" readonly>
                            </div>
                        </div>
                        <h6>Publish Date:<%= j.getPdate().toString() %></h6>
                        <div class="text-center">
                            <a href="one_view.jsp?id=<%= j.getId() %>" class="btn btn-sm bg-success text-white">View More</a>
                        </div>
                    </div>
                </div>
                <% 
                }
                %>
            </div>
        </div>
    </div>

</body>
</html>
