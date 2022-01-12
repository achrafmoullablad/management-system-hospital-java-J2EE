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
<script type="text/javascript">
		$(document).ready(function() {
		    $('#tabledata').DataTable();
		} );
</script>
 <div class="app-wrapper">
	   <div class="container p-2 m-2">
			<div class="row justify-content-center">
				<div class="col-lg-11 col-12">
				<h2 class="text-center text-success p-3 m-1">LISTE MEDICAMENT</h2>
				<table id="tabledata" class="table" >
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
				      <td class="text-center"><span class="badge bg-danger"><a href="#" class="text-dark" id="enable"><i class="fas fa-trash-alt"></i></a></span></td>
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