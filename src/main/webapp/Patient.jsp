<%@page import="Ado.Patient.CMPatientImp"%>
<%@page import="Ado.Patient.Patient"%>
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

<style>
	#mycontent{
		background: linear-gradient(45deg, greenyellow, dodgerblue);
	}

</style>
 <div class="app-wrapper">
	   <div class="container" id="mycontent">
			<div class="row justify-content-center">
				<div class="col-lg-8 col-12">
					<div class="center">	
				   <%
				    String prenom=request.getParameter("prenom");
					String nom=request.getParameter("nom");
					String email=request.getParameter("email");
					String adresse=request.getParameter("adresse");
					String telephone=request.getParameter("telephone");
					String medecin=request.getParameter("medecin");
					if(prenom!=null && nom!=null && email!=null && adresse!=null && telephone!=null && medecin!=null){
						Patient p=new Patient(prenom,nom,email,adresse,telephone,medecin);
						CMPatientImp cp=new CMPatientImp();
						cp.addPatient(p);
					}else{
						
					}
			     %>
				  <form class="m-2 p-2">
						<h2 class="text-center text-primary">FORM ADD PATIENT</h2>
						<div class="mb-2">
						<div class="mb-2">
						  <label for="prenom" class="form-label">Prenom</label>
						  <input type="text" class="form-control" id="prenom" required="true" name="prenom">
						</div>
						  <label for="nom" class="form-label">Nom</label>
						  <input type="text" class="form-control" required="true" id="nom" name="nom">
						</div>
						<div class="mb-2">
							<label for="email" class="form-label">Email</label>
							<input type="email" class="form-control" required="true" name="email">
						  </div>
						  <div class="mb-2">
							<label for="adresse" class="form-label">Adresse</label>
							<input type="text" class="form-control" required="true" id="adresse" name="adresse">
						  </div>
						  <div class="mb-2">
							<label for="telephone" class="form-label">Telephone</label>
							<input type="text" class="form-control" required="true" id="telephone" name="telephone">
						  </div>
						  <select class="mb-3 form-select" required="true" name="medecin" >
					    	 <option value="" disabled selected>Select your option</option>
					    	<%
						    	CMedecinImp cm=new CMedecinImp();
						    	List<Medecin> lm=cm.getMedecinDisponible();
					    		for(Medecin m:lm){
					    	%>
					    	<option value="<%= m.getNom() %>"><%= m.getNom()%></option>
					    	<% } %>
					  	 </select>
						<button type="submit" class="btn btn-primary">Submit</button>
					</form>
					</div>
				</div>
			</div>
	   </div> 
    </div><!--//app-wrapper-->   
<%@include file="includes/footer.jsp" %>
<% }else{
        response.sendRedirect("login.jsp");
    } 
%>