<%@page import="Ado.Medicament.CMedicamentImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Medicament Action</title>
</head>
<body>
<%
	Admin a=(Admin)session.getAttribute("admin");
	if(a!=null){		      
%> 
<%@include file="header1.jsp" %>
	<%
		if(request.getParameter("op").equalsIgnoreCase("delete")){
			int id=Integer.parseInt(request.getParameter("id"));
			CMedicamentImp cm=new CMedicamentImp();
			cm.deleteMedicament(id);
		}
	%>
	<script type="text/javascript">
		window.location.href="ShowMedicament.jsp";
	</script>

<%@include file="footer1.jsp" %>
<% }else{
        response.sendRedirect("../login.jsp");
    } 
%>
</body>
</html>