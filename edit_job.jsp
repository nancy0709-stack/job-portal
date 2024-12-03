
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
 <%@ page import="com.dao.JobDao" %>
<%@ page import="com.DB.DBconnect" %>
<%@ page import="com.entity.jobs" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


	
<title>Edit Jobs</title>
<%@include file="all_component/all_css.jsp" %>

</head>
<body style="background-color: #fof1f2;">
<c:if test="${userobj.role ne 'admin'}">
    <c:redirect url="login.jsp" />
</c:if>
<%@include file="all_component/navbar.jsp" %>

<div class="container p-2">
	<div class="col-md-10 offset-md-1">
		<div class="card">
			<div class="card-body">
				<div class="text-center text-success">
				<i class="fas fa-user-friends fa-3x"></i>
				
	
				
				<%
				
				int id=Integer.parseInt(request.getParameter("id"));
				
				JobDao dao=new JobDao(DBconnect.getConn()); 
				jobs j=dao.getJobById(id);
				%>
				
				
		
				<h5>Edit Jobs</h5>
				</div>
				<form action="update" method="post">
	
				<input type ="hidden" value="<%=j.getId() %>" name="id">
				
					<div class="form-group">
					<label>Enter Title</label><input type="text" name="title" required class="form-control" value="<%=j.getTitle()%>">
					</div>
					<div class="form-row">
					<div class="form-group col-md-4">
					<label>Location</label> <select name="location" class="custom-select" id="inlineFormCustomSelectPref">
					<option value="<%=j.getLocation() %>"><%=j.getLocation() %></option>
					<option value ="Kathmandu">Kathmandu</option>
					<option value ="Bhaktapur">Bhaktapur</option>
					<option value ="Lalitpur">Lalitpur</option>
					<option value ="Kritipur">Kritipur</option>
					</select>
					
					</div>
					
					
					<div class="form-group col-md-4">
					<label>Category</label> <select name="category" class="custom-select" id="inlineFormCustomSelectPref">
					<option value="<%=j.getCategory() %>"><%=j.getCategory() %></option>
					<option value ="FullStackDeveloper">FullStackDeveloper</option>
					<option value ="FrontEndDeveloper">FrontEndDeveloper</option>
					<option value ="BackEndDeveloper">BackEndDeveloper</option>
					<option value ="JavaDeveloper">JavaDeveloper</option>
					</select>
					</div>
					
	
					<div class="form-group col-md-4">
					<label>Status</label> <select name="status" class="form-control" id="inlineFormCustomSelectPref">
					<option class="Active" value="<%=j.getStatus()%>"><%=j.getStatus()%> </option>
					<option class="Active" value="Active">Active</option>
					<option class="Inactive" value="Inactive">Inactive</option>
					
					
					</select>
					</div>
					</div>
				
					
					<div class="form-group">
					<label>Enter Description</label>
					<textarea required rows="6" cols="" name="desc" class="form-control"><%=j.getDescription() %></textarea>
					</div>
					<button class="btn btn-success">Update Job</button>
					
				</form>
				</div>
			</div>
		</div>
	</div>


</body>
</html>