<%@page import="Ado.Patient.Patient"%>
<%@page import="Ado.Medecin.Medecin"%>
<%@page import="java.util.List"%>
<%@page import="Ado.Medecin.CMedecinImp"%>
<%@page import="Ado.Admin.Admin"%>
<%@page import="Ado.Patient.CMPatientImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@include file="header1.jsp" %>

<style>
	#mycontent{
		background: linear-gradient(45deg, greenyellow, dodgerblue);
	}
</style>
<%
	Admin a=(Admin)session.getAttribute("admin");
	if(a!=null){		      
%>
	<%
			CMPatientImp cm=new CMPatientImp();
			int id=Integer.parseInt(request.getParameter("id"));
			if(request.getParameter("op").equalsIgnoreCase("delete")){
				cm.deletePatient(id);
			}
			%>
		<div class="app-wrapper">
		   <div class="container" id="mycontent">
				<div class="row justify-content-center">
					<div class="col-lg-8 col-12">
						<div class="center">
			<%
				if(request.getParameter("op").equalsIgnoreCase("update")){
					Patient pi=cm.ShowPatientById(id);
			%>
					<form class="m-2 p-2" method="POST">
							<h2 class="text-center text-primary">FORM MODIFY PATIENT</h2>
							<div class="mb-2">
							  <label for="id" class="form-label">ID</label>
							  <input type="text" class="form-control" id="id" name="id" readonly value="<%= pi.getId() %>">
							</div>
							<div class="mb-2">
							  <label for="prenom" class="form-label">Prenom</label>
							  <input type="text" class="form-control" id="prenom" required="true" name="prenom" value="<%= pi.getPrenom() %>">
							</div>
							<div class="mb-2">
							  <label for="nom" class="form-label">Nom</label>
							  <input type="text" class="form-control" required="true" id="nom" name="nom" value="<%= pi.getNom() %>">
							</div>
							<div class="mb-2">
								<label for="email" class="form-label">Email</label>
								<input type="email" class="form-control" required="true" name="email" value="<%= pi.getEmail() %>">
							  </div>
							  <div class="mb-2">
								<label for="adresse" class="form-label">Adresse</label>
								<input type="text" class="form-control" required="true" id="adresse" name="adresse" value="<%= pi.getAdresse() %>">
							  </div>
							  <div class="mb-2">
								<label for="telephone" class="form-label">Telephone</label>
								<input type="text" class="form-control" required="true" id="telephone" name="telephone" value="<%= pi.getTelephone() %>">
							  </div>
							  <select class="mb-3 form-select" required="true" name="medecin">
						    	 <option value="" disabled selected>Select your option</option>
						    	<%
							    	CMedecinImp cp=new CMedecinImp();
							    	List<Medecin> lm=cp.getMedecinDisponible();
						    		for(Medecin m:lm){
						    	%>
						    	<option value="<%= m.getNom() %>"><%= m.getNom()%></option>
						    	<% } %>
						  	 </select>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
				<% }%>
				</div>
			</div>
		</div>
		<%
			String prenom=request.getParameter("prenom");
			String nom=request.getParameter("nom");
			String email=request.getParameter("email");
			String adresse=request.getParameter("adresse");
			String telephone=request.getParameter("telephone");
			String medecin=request.getParameter("medecin");
			if(nom!=null && prenom!=null && email!=null && adresse!=null && telephone!=null){
				Patient p=new Patient(prenom,nom,email,adresse,telephone,medecin);
				cm.modifyPatient(p,id);
			}
	%>
 </div> 
 </div>
<%@include file="footer1.jsp" %>
<% }else{
        response.sendRedirect("../login.jsp");
    } 
%>
</body>
</html>