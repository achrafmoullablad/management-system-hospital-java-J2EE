<%@page import="Ado.Medicament.Medicament"%>
<%@page import="java.util.List"%>
<%@page import="Ado.Medicament.CMedicamentImp"%>
<%@page import="Ado.Admin.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	Admin a=(Admin)session.getAttribute("admin");
	if(a!=null){		      
%> 
<%@include file="header1.jsp" %>
 <div class="app-wrapper">
	   <div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-12 col-12">
				<h2 class="text-center text-success p-3 m-1">LISTE MEDICAMENT</h2>
				<form action="pages/SearchBar.jsp">
					<div class="input-group justify-content-center m-1 p-2">
					  <div class="form-outline">
					    <input name="search" style="width: 24rem;" class="form-control" />
					  </div>
					  <button type="button" class="btn btn-primary"><i class="fas fa-search"></i></button>
					</div>
				</form>
				<table  class="table" >
				  <thead>
				    <tr class="table-info">
				      <th scope="col">NOM</th>
				      <th scope="col">LABORATOIRE</th>
				      <th scope="col">MALADIE</th>
				       <th class="text-center" scope="col">UPDATE</th>
				      <th class="text-center" scope="col">DELETE</th>
				    </tr>
				  </thead>
				  <tbody>
				  <%
				  		CMedicamentImp cm=new CMedicamentImp();
				  		List<Medicament> lm=cm.getAllMedicament();
				  		for(Medicament m:lm){
				  %>
				    <tr>
				      <td><%= m.getNom() %></td>
				      <td><%= m.getLaboratoire()  %></td>
				      <td><%= m.getMaladie() %></td>
				      <td class="text-center"><span class="badge bg-warning"><a class="text-dark" href='medicamentaction.jsp?op=update&id=<%= m.getId()  %>'><i class="fas fa-edit"></i></a></span></td>
				      <td class="text-center"><span class="badge bg-danger"><a class="text-dark" onclick="return confirm('Are you sure to delete this Medcin')" href='medicamentaction.jsp?op=delete&id=<%= m.getId() %>'><i class="fas fa-trash-alt"></i></a></span></td>
				    </tr>
				    <% } %>
				  </tbody>
				</table>
			</div>
			</div>
	   </div> 
    </div><!--//app-wrapper-->   
<%@include file="footer1.jsp" %>
<% }else{
        response.sendRedirect("../login.jsp");
    } 
%>