<%@page import="Ado.Medecin.Medecin"%>
<%@page import="java.util.List"%>
<%@page import="Ado.Medecin.CMedecinImp"%>
<%@page import="Ado.Admin.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	Admin a=(Admin)session.getAttribute("admin");
	if(a!=null){		      
%> 
<%@include file="includes/header.jsp" %>
 <div class="app-wrapper">
	  <div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-12 col-12">
				<h2 class="text-center text-success p-3 m-3">LISTE MEDCIN</h2>
				<table class="table">
				  <thead>
				    <tr class="table-info">
				      <th scope="col">ID</th>
				      <th scope="col">Nom</th>
				      <th scope="col">Username</th>
				      <th scope="col">Email</th>
				      <th scope="col">Password</th>
				      <th scope="col">Adresse</th>
				      <th scope="col">Telephone</th>
				      <th scope="col">Status</th>
				       <th scope="col">UPDATE</th>
				      <th scope="col">DELETE</th>
				    </tr>
				  </thead>
				  <tbody>
				  <%
				  		CMedecinImp cm=new CMedecinImp();
				  		List<Medecin> lm=cm.getAllMedecin();
				  		for(Medecin md:lm){
				  %>
				    <tr>
				      <th scope="row"><%= md.getId()  %></th>
				      <td><%= md.getNom() %></td>
				      <td><%= md.getUsername() %></td>
				      <td><%= md.getEmail() %></td>
				      <th><%= md.getPassword()  %></th>
				      <td><%= md.getAdresse() %></td>
				      <td><%= md.getTelephone() %></td>
				      <td><%= md.getStatus() %></td>
				      <td><span class="badge bg-warning"><a class="text-dark" href='pages/updateMedcin.jsp?id=<%= md.getId()  %>'>Update</a></span></td>
				      <td><span class="badge bg-danger"><a class="text-dark" onclick="return confirm('Are you sure to delete this Medcin')" href='pages/deleteMedcin.jsp?id=<%= md.getId() %>'>Delete</a></span></td>
				    </tr>
				    <% } %>
				  </tbody>
				</table>
			</div>
		</div>
	</div> 
</div>   
<%@include file="includes/footer.jsp" %>
<% }else{
        response.sendRedirect("login.jsp");
    } 
%>