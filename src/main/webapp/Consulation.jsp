<%@page import="Ado.Medicament.Medicament"%>
<%@page import="Ado.Medicament.CMedicamentImp"%>
<%@page import="Ado.Consultation.Consultation"%>
<%@page import="Ado.Consultation.CMConsultationImp"%>
<%@page import="Ado.Patient.Patient"%>
<%@page import="Ado.Patient.CMPatientImp"%>
<%@page import="Ado.Medecin.CMedecinImp"%>
<%@page import="Ado.Medecin.Medecin"%>
<%@page import="java.util.List"%>
<%@page import="Ado.Admin.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	Admin a=(Admin)session.getAttribute("admin");
	if(a!=null){		      
%> 
<%@include file="includes/header.jsp" %>
<style>
	#mycontent{
		background: linear-gradient(45deg, greenyellow, dodgerblue);
		position: absolute;
		top: 20%;
		width: 80%;
	}
</style>
 <div class="app-wrapper">
	   <div class="container" id="mycontent">
			<div class="row justify-content-center">
				<div class="col-lg-8 col-12">
					<%
						try{
							int Medecin=Integer.parseInt(request.getParameter("medecin"));
							int Patient=Integer.parseInt(request.getParameter("patient"));
							int Medicament=Integer.parseInt(request.getParameter("medicament"));
							CMConsultationImp cl=new CMConsultationImp();
							Consultation c=new Consultation(Medecin,Patient,Medicament);
							cl.addConsultation(c);
						}catch(NumberFormatException e){
							
						}
					%>
					<form class="m-2 p-2" method="POST">
						<h2 class="text-center text-primary p-2 m-2">FORM ADD CONSULTATION</h2>
						<div class="mb-2">
						  <select class="mb-3 form-select" name="medecin">
						  	<option value="" disabled selected>---Select Medecin---</option>
						  	<%
						  		CMedecinImp cm=new CMedecinImp();
						  		List<Medecin> lm=cm.getMedecinDisponible();
						  		for(Medecin m:lm){
						  	%>
							<option value="<%= m.getId()%>"><%= m.getNom()+" "+m.getprenom() %></option>
							<% } %>
						  </select>
						</div>
						<div class="mb-2">
						  <select class="mb-3 form-select" name="patient">
						  	<option value="" disabled selected>---Select Patient---</option>
						  	<%
						  		CMPatientImp cp=new CMPatientImp();
						  		List<Patient> lp=cp.getAllPatient();
						  		for(Patient p:lp){
						  	%>
							<option value="<%= p.getId() %>"><%= p.getNom()+" "+p.getPrenom() %></option>
							<% } %>
						  </select>
						  <select class="mb-3 form-select" name="medicament">
						  	<option value="" disabled selected>---Select Medicament---</option>
						  	<% 
						  		CMedicamentImp cd=new CMedicamentImp();
						  		List<Medicament> ld=cd.getAllMedicament();
						  		for(Medicament d:ld){
						  	%>
						  	<option value="<%= d.getId() %>"><%= d.getNom() %></option>
						 	 <% } %>
						  </select>
						</div>
						<button type="submit" class="btn btn-primary">Submit</button>
					</form>
				</div>
			</div>
	   </div> 
    </div><!--//app-wrapper-->   
<%@include file="includes/footer.jsp" %>
<% }else{
        response.sendRedirect("login.jsp");
    } 
%>