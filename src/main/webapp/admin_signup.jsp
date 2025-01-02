<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin SignUp</title>
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
			<h5>Register Page</h5>
			
						<c:if test="${not empty succMSg}">
    <div class="alert alert-success" role="alert">${succMSg}</div>
    <%-- Display your success message here --%>
    <c:remove var="succMSg"/>
</c:if>
			</div>
			<form action="admin_register" method="post">
			
				<div class="form-group">
				<label>Enter Admin Name</label>
				<input type="text" required="required" class="form-control" id="exampleInputEmail" aria-describedy="emailHelp" name="name">
				
				</div>
			
				
				<div class="form-group">
				<label>Enter Email</label>
				<input type="email" required="required" class="form-control" id="exampleInputEmail" aria-describedy="emailHelp" name="email">
				
				</div>
				
				
				<div class="form-group">
 <label>Enter Mobile Number</label>
<div class="input-group">
    <div class="input-group-prepend">
        <span class="input-group-text">+977</span> <!-- Default country code -->
    </div>
    <input type="tel" required="required" class="form-control" id="exampleInputMobile" aria-describedby="mobileHelp" name="mobile" pattern="[0-9]{10}" placeholder="Mobile Number">
</div>
<small id="mobileHelp" class="form-text text-muted">Please enter a 10-digit mobile number.</small>
 
				
				
				<div class="form-group">
				<label for="exampleInputPassword1">Enter Password</label>
				
				<input  required="required" type="password" class="form-control" id="exampleInputPassword1" aria-describedy="emailHelp" name="ps">
				
				</div>
				
			
			
				<button type="submit" class="btn btn-primary badge-pill btn-block mt-2">Register</button>
				
			
			</form>
			
			</div>
			</div>
		

</div>
</div>
</div>

</body>
</html>