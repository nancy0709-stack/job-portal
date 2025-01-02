
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>
  <%@ page import="com.entity.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				
			<c:if test="${not empty succMSg}">
    <div class="alert alert-success" role="alert">${succMSg}</div>
    <%-- Display your success message here --%>
    <c:remove var="succMSg"/>
</c:if>
			
		
				<h5>Add Jobs</h5>
				</div>
				<form action="add_job" method="post">
				
					<div class="form-group">
					<label>Enter Title</label><input type="text" name="title" required class="form-control">
					</div>
					<div class="form-row">
					<div class="form-group col-md-4">
					<label>Location</label> <select name="location" class="custom-select" id="inlineFormCustomSelectPref">
					<option selected>Choose...</option>
					<option value ="Kathmandu">Kathmandu</option>
					<option value ="Bhaktapur">Bhaktapur</option>
					<option value ="Lalitpur">Lalitpur</option>
					<option value ="Kritipur">Kritipur</option>
					</select>
					
					</div>
					
					
					<div class="form-group col-md-4">
					<label>Category</label> <select name="category" class="custom-select" id="inlineFormCustomSelectPref">
					<option selected>Choose...</option>
					<option value ="FullStackDeveloper">FullStackDeveloper</option>
					<option value ="FrontEndDeveloper">FrontEndDeveloper</option>
					<option value ="UI/UX Designer">UI/UX Designer</option>
					<option value ="QA">QA</option>
					<option value ="Java Developer">Java Developer</option>
					<option value ="WebDeveloper">WebDeveloper</option>
					</select>
					</div>
					
	
					<div class="form-group col-md-4">
					<label>Status</label> <select name="status" class="form-control" id="inlineFormCustomSelectPref">
					<option class="Active" value="Active">Active</option>
					<option class="Inactive" value="Inactive">Inactive</option>
					
					
					</select>
					</div>
					</div>
				
					
					<div class="form-group">
					<label>Enter Description</label>
					<textarea required rows="6" cols="" name="desc" class="form-control"></textarea>
					</div>
					<button class="btn btn-success">Publish Job</button>
					
				</form>
				</div>
			</div>
		</div>
	</div>


</body>
</html>