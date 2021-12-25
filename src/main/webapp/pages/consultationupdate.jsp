<%@page import="Ado.Medicament.Medicament"%>
<%@page import="Ado.Medicament.CMedicamentImp"%>
<%@page import="Ado.Consultation.Consultation"%>
<%@page import="java.util.List"%>
<%@page import="Ado.Consultation.CMConsultationImp"%>
<%@page import="Ado.Admin.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	Admin a=(Admin)session.getAttribute("admin");
	if(a!=null){		      
%> 
<%@include file="header1.jsp" %>
 <style>
	#mycard{
		background-image: linear-gradient(to right, white , lightgreen);
		border: none;
	}
	#mycard:hover{
		transform: scale(1.05);
  		box-shadow: 0 10px 20px rgba(0,0,0,.12), 0 4px 8px rgba(0,0,0,.06);
	  	-webkit-transition: all 0.2s ease-in;
	  	-moz-transition: all 0.2s ease-in;
	  	-ms-transition: all 0.2s ease-in;
	 	-o-transition: all 0.2s ease-in;
	 	transition: all 0.2s ease;
	 	margin-top: 20px;
	 	font-weight: bold;
	}
	p{
		font-family: "Times New Roman", Times, serif;
		font-style: italic;
		font-size: 1.2rem;
	}
</style>
 <div class="app-wrapper">
	   <div class="container" id="mycontent">
			<div class="row justify-content-center">
				<div class="col-lg-8 col-12">
					<%
						int id=Integer.parseInt(request.getParameter("id"));
						CMConsultationImp cm=new CMConsultationImp();
						CMPatientImp ct=new CMPatientImp();
						CMedicamentImp cd=new CMedicamentImp();
						Consultation c=cm.getSingleConsultation(id);
						CMedecinImp ce=new CMedecinImp();
						Medecin e=ce.ShowMedecinById(c.getIdMedecin());
						Patient t=ct.ShowPatientById(c.getIdPatient());
						Medicament n=cd.getMedicament(c.getIdMedicament());

					%>
					<form class="m-2 p-2" method="POST">
						<h2 class="text-center text-primary p-2 m-2">FORM UPDATE CONSULTATION</h2>
						<div class="mb-2">
						  <label for="id" class="form-label">ID</label>
						  <input type="text" class="form-control" id="id" name="id" readonly value="<%= c.getId() %>">
						</div>
						<div class="mb-2">
						  <select class="mb-3 form-select" name="medecin">
						  	<option disabled selected>---Changer <%= e.getNom() %>---</option>
						  	<%
						  		List<Medecin> lm=ce.getMedecinDisponible();
						  		for(Medecin m:lm){
						  			if(m.getId()!=e.getId()){
						  	%>
							<option value="<%= m.getId()%>"><%= m.getNom()+" "+m.getprenom() %></option>
							<% }} %>
						  </select>
						</div>
						<div class="mb-2">
						  <select class="mb-3 form-select" name="patient">
						  	<option value="" disabled selected>---Changer <%= t.getNom() %> ---</option>
							<%
						  		List<Patient> lt=cp.getAllPatient();
						  		for(Patient p:lt){
						  			if(p.getId()!=t.getId()){
						  	%>
							<option value="<%= p.getId() %>"><%= p.getNom()+" "+p.getPrenom() %></option>
							<% }} %>
						  </select>
						  <select class="mb-3 form-select" name="medicament">
						  	<option value="" disabled selected>---Changer <%= n.getNom() %>---</option>
						  	<% 
						  		List<Medicament> ld=cd.getAllMedicament();
						  		for(Medicament d:ld){
						  			if(d.getId()!=n.getId()){
						  	%>
						  	<option value="<%= d.getId() %>"><%= d.getNom() %></option>
						 	 <% }} %>
						  </select>
						</div>
						<button type="submit" class="btn btn-primary">Submit</button>
					</form>
					<%
						try{
							int Medecin=Integer.parseInt(request.getParameter("medecin"));
							int Patient=Integer.parseInt(request.getParameter("patient"));
							int Medicament=Integer.parseInt(request.getParameter("medicament"));
							if(Medecin!=0 && Patient!=0 && Medicament!=0){
								Consultation co=new Consultation(Medecin,Patient,Medicament);
								cm.modifyConsultation(co, id);
							}
						}catch(NumberFormatException er){
							
						}
					%>
				</div>
			</div>
	   </div> 
    </div>
<%@include file="footer1.jsp" %>
<%	}else{
        response.sendRedirect("../404.jsp");
    } 
%>