<%@page import="Ado.Admin.Admin"%>
<%@page import="Ado.Medecin.CMedecinImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		Admin a=(Admin)session.getAttribute("admin");
		if(a!=null){		      
	%>
	<%
		int id=Integer.parseInt(request.getParameter("id"));
		CMedecinImp cm=new CMedecinImp();
		cm.deleteMedcin(id);
		response.sendRedirect("../ShowMedecin.jsp");
	%>
	<% }else{
	        response.sendRedirect("login.jsp");
	    } 
	%>
</body>
</html>