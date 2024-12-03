<%@page import="com.DB.DBconnect" %>
<%@page import="java.sql.Connection" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Job Portal</title>
<%@include file="all_component/all_css.jsp" %>
<style type="text/css">
.back-img{
background: url("img/back2.jpg");
width:100%;
height:85vh;
background-position:center;
background-repeat: no-repeat;
background-size: contain,cover;
}
</style>
</head>
<body>
<%@include file="all_component/navbar.jsp" %>


<div class="container-fluid back-img">
<div class="text-center">
<h1 class="text-black p-4">
<i class="fa fa-book" aria-hidden="true"></i>Online Job Portal
</h1>
</div>
</div>
<%@include file="all_component/footer.jsp" %>

</body>
</html>