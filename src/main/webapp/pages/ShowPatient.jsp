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
<style>
    .modal-header {
       background: #5cb377;
       color: #fff;
    }
</style> 
<script type="text/javascript">
	$(document).ready(function() {
		$('#datapatient').DataTable();
		$('.editbtn').on('click',function(){
			$tr=$(this).closest('tr');
			var data=$tr.children("td").map(function(){
				return $(this).text();
			}).get();
			console.log(data);
			$('#nom').val(data[0]);
			$('#prenom').val(data[1]);
			$('#email').val(data[2]);
			$('#adresse').val(data[3]);
			$('#telephone').val(data[4]);
		});
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
				                <th class="text-center">Update</th>
				                <th class="text-center">Vue</th>
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
									<td><a href="patientaction.jsp?op=update&id=<%= p.getId() %>" class="btn btn-warning text-dark"><i class="fas fa-edit"></i></a></td>
									<td class="text-center"><a href="?idpatient=<%= p.getId() %>" class="btn btn-secondary text-dark editbtn" data-bs-toggle="modal" data-bs-target="#myModal"><i class="fas fa-eye"></i></a></td>
								</tr>
							<% } %>
						</tbody>
				 </table>
				</div>
			</div>
			<div class="modal" id="myModal">
	            <div class="modal-dialog">
	                <div class="modal-content">
	                    <div class="modal-header">
	                        <h5 class="modal-title text-white">Information de Patient</h5>
	                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	                    </div>
	                    <div class="modal-body">
	                        <form>
	                            <div class="mb-2">
	                                <label class="form-label required">Nom</label>
	                                <input type="text" class="form-control" id="nom" readonly>
	                            </div>
	                            <div class="mb-2">
	                                <label class="form-label required">Prenom</label>
	                                <input type="text" class="form-control" id="prenom" readonly>
	                            </div>
	                            <div class="mb-2">
	                                <label class="form-label required">Email</label>
	                                <input type="email" class="form-control" id="email" readonly>
	                            </div>
	                            <div class="mb-2">
	                                <label class="form-label required">Adresse</label>
	                                <input type="text" class="form-control" id="adresse" readonly>
	                            </div>
	                            <div class="mb-2">
	                                <label class="form-label required">Telephone</label>
	                                <input type="text" class="form-control" id="telephone" readonly>
	                            </div>
	                        </form>
	                    </div>
	                </div>
	            </div>
	         </div>
	   </div> 
</div> 
<%@include file="footer1.jsp" %>
<% }else{
        response.sendRedirect("../login.jsp");
    } 
%>