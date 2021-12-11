<%@page import="Ado.Admin.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Disconnect</title>
</head>
<body>
	<%
		Admin a=(Admin)session.getAttribute("admin");
		if(a!=null){
			session.removeAttribute("admin");
			response.sendRedirect("login.jsp");
		}else{
        	response.sendRedirect("login.jsp");
        } 
    %>
</body>
</html>