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
						String nomMedecin=request.getParameter("medecin");
						String nomPatient=request.getParameter("patient");
						if(nomMedecin!=null && nomPatient!=null){
							CMConsultationImp cl=new CMConsultationImp();
							Consultation c=new Consultation(nomMedecin,nomPatient);
							cl.addConsultation(c);
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
							<option value="<%= m.getNom() %>"><%= m.getNom()+" "+m.getprenom() %></option>
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
							<option value="<%= p.getNom() %>"><%= p.getNom()+" "+p.getPrenom() %></option>
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