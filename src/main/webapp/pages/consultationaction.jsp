<%@page import="Ado.Consultation.CMConsultationImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@include file="header1.jsp" %>

<style>
	#mycontent{
		background: linear-gradient(45deg, greenyellow, dodgerblue);
	}
</style>
<%
	Admin a=(Admin)session.getAttribute("admin");
	if(a!=null){		      
%>
	<%
		CMConsultationImp cm=new CMConsultationImp();
		int id=Integer.parseInt(request.getParameter("id"));
		if(request.getParameter("op").equalsIgnoreCase("delete")){
			cm.deleteConsultation(id);
		}
		
	%>
<%@include file="footer1.jsp" %>
<% }else{
        response.sendRedirect("../login.jsp");
    } 
%>
</body>
</html>