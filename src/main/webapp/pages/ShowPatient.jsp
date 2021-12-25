<%@page import="Ado.Patient.Patient"%>
<%@page import="java.util.List"%>
<%@page import="Ado.Patient.CMPatientImp"%>
<%@page import="Ado.Medecin.CMedecinImp"%>
<%@page import="Ado.Admin.CMAdminImp"%>
<%@page import="Ado.Medecin.Medecin"%>
<%@page import="Ado.Admin.Admin"%>
<%@page import="Ado.Admin.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header1.jsp" %>
	<%
		Admin a=(Admin)session.getAttribute("admin");
		if(a!=null){		      
	%> 
<script type="text/javascript">
	$(document).ready(function() {
		$('#datapatient').DataTable();
	} );
</script>
 <div class="app-wrapper">
	   <div class="container">
			<div class="row justify-content-center">
			<div class="col-lg-12 col-12">
				<h2 class="text-center text-success p-2 m-1">LISTE PATIENT</h2>
					<table id="datapatient" class="table">
				        <thead>
				            <tr>
				                <th>NOM Patient</th>
				                <th>Prenom Patient</th>
				                <th>Email Patient</th>
				                <th>Adresse Patient</th>
				                <th>Telephone Patient </th>
				                <th>Nom Medecin</th>
				                <th>Update</th>
				                <th>Delete</th>
				            </tr>
				        </thead>
				        <tbody>
							<%
								CMPatientImp cm=new CMPatientImp();
								List<Patient> l=cm.getAllPatient();
								for(Patient p:l){
							
							%>
								<tr>
									<td><%= p.getNom() %></td>
									<td><%= p.getPrenom() %></td>
									<td><%= p.getEmail() %></td>
									<td><%= p.getAdresse() %></td>
									<td><%= p.getTelephone() %></td>
									<td><%= p.getMedecin() %></td>
									<td class="text-center"><span class="badge bg-warning"><a href="patientaction.jsp?op=update&id=<%= p.getId() %>" class="text-dark"><i class="fas fa-edit"></i></a></span></td>
									<td class="text-center"><span class="badge bg-danger"><a href="patientaction.jsp?op=delete&id=<%= p.getId() %>" class="text-dark" onclick="return confirm('Are you sure to delete this one');"><i class="fas fa-trash-alt"></i></a></span></td>
								</tr>
							<% } %>
						</tbody>
				 </table>
				</div>
			</div>
	   </div> 
    </div> 
<%@include file="footer1.jsp" %>
<% }else{
        response.sendRedirect("../login.jsp");
    } 
%>