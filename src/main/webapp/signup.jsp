<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User SignUp</title>
<%@include file="all_component/all_css.jsp" %>

</head>
<body style="background-color: #fof1f2">
<%@include file="all_component/navbar.jsp" %>

<div class="container-fluid">
	<div class="row p-5">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-body">
			<div class="text-center">
	<i class="fa-solid fa-user-plus"></i>
			<h5>SignUp Page</h5>
			
						<c:if test="${not empty succMSg}">
    <div class="alert alert-success" role="alert">${succMSg}</div>
    <%-- Display your success message here --%>
    <c:remove var="succMSg"/>
</c:if>
			</div>
			<form action="register" method="post">
			
				<div class="form-group">
				<label>Enter Full Name</label>
				<input type="text" required="required" class="form-control" id="exampleInputEmail" aria-describedy="emailHelp" name="name">
				
				</div>
			
				<div class="form-group">
				<label>Enter Qualification</label>
				<input type="text" required="required" class="form-control" id="exampleInputEmail" aria-describedy="emailHelp" name="qua">
				
				</div>
				<div class="form-group">
				<label>Enter Email</label>
				<input type="email" required="required" class="form-control" id="exampleInputEmail" aria-describedy="emailHelp" name="email">
				
				</div>
				
				<div class="form-group">
				<label for="exampleInputPassword1">Enter Password</label>
				
				<input  required="required" type="password" class="form-control" id="exampleInputPassword1" aria-describedy="emailHelp" name="ps">
				
				</div>
				
			   
			
				<button type="submit" class="btn btn-primary badge-pill btn-block mt-2">Register As User</button>
				
				 <div class="centered-button">
    		   		 <a href="admin_signup.jsp" class="btn btn-secondary badge-pill">Register As Admin</a>
   				 </div>
				
			
			</form>
			
			</div>
			</div>
		

</div>
</div>
</div>

</body>
</html>