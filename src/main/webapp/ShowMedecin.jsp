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
				<h2 class="text-center text-success p-3 m-1">LISTE MEDCIN</h2>
				<form action="pages/SearchBar.jsp">
					<div class="input-group justify-content-center m-1 p-2">
					  <div class="form-outline">
					    <input name="search" style="width: 24rem;" class="form-control" />
					  </div>
					  <button type="button" class="btn btn-primary"><i class="fas fa-search"></i></button>
					</div>
				</form>
				<table id="" class="table" >
				  <thead>
				    <tr class="table-info">
				      <th scope="col">Nom</th>
				      <th scope="col">Prenom</th>
				      <th scope="col">Email</th>
				      <th scope="col">Adresse</th>
				      <th scope="col">Telephone</th>
				      <th scope="col">Status</th>
				       <th class="text-center" scope="col">UPDATE</th>
				      <th class="text-center" scope="col">DELETE</th>
				    </tr>
				  </thead>
				  <tbody>
				  <%
				  		CMedecinImp cm=new CMedecinImp();
				  		List<Medecin> lm=cm.getAllMedecin();
				  		for(Medecin md:lm){
				  %>
				    <tr>
				      <td><%= md.getNom() %></td>
				      <td><%= md.getprenom() %></td>
				      <td><%= md.getEmail() %></td>
				      <td><%= md.getAdresse() %></td>
				      <td><%= md.getTelephone() %></td>
				      <td><%= md.getStatus() %></td>
				      <td class="text-center"><span class="badge bg-warning"><a class="text-dark" href='pages/updateMedcin.jsp?id=<%= md.getId()  %>'><i class="fas fa-edit"></i></a></span></td>
				      <td class="text-center"><span class="badge bg-danger"><a class="text-dark" onclick="return confirm('Are you sure to delete this Medcin')" href='pages/deleteMedcin.jsp?id=<%= md.getId() %>'><i class="fas fa-trash-alt"></i></a></span></td>
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