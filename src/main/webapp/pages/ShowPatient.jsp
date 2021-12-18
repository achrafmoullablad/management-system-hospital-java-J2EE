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
	h5{
		font-family: "Times New Roman", Times, serif;
		font-style: italic;
		font-size: 1.2rem;
	}
	p{
		color: grid;
		font-family: "Times New Roman", Times, serif;
		font-style: italic;
		font-size: 1.2rem;
	}
	#link{
		font-family: "Times New Roman", Times, serif;
		font-style: italic;
		font-size: 1rem;
	}
	#mybtn{
		background-image: linear-gradient(to right, white , lightgreen);
		border: none;
	}
	#mybtn:hover{
		background-image: linear-gradient(to right,lightgreen, white);
		border: none;
	}
</style>
 <div class="app-wrapper">
	   <div class="container">
	   		<form action="">
					<div class="input-group justify-content-center m-1 p-2">
					  <div class="form-outline">
					    <input name="search" style="width: 24rem;" class="form-control" />
					  </div>
					  <button type="button" class="btn btn-primary"><i class="fas fa-search"></i></button>
					</div>
			</form>
			<div class="row justify-content-center">
			<%
				CMPatientImp cm=new CMPatientImp();
				List<Patient> lp=cm.getAllPatient();
				for(Patient p:lp){
			
			%>
				<div class="col-lg-4 col-md-6 col-12 p-2">
					<div class="card" style="width: 21rem;" id="mycard">
					  <div class="card-body">
					    <h5 class="card-title">Patient :<%= p.getPrenom()+" "+p.getNom() %></h5>
					    <p class="card-text">Email :<%= p.getEmail() %></p>
					    <p class="card-text">Adresse : <%= p.getAdresse() %></p>
					    <p class="card-text">Telephone :<%= p.getTelephone() %></p>
					    <p class="card-text">Nom Medecin :<%= p.getMedecin() %></p>
					    <a href="patientaction.jsp?op=update&id=<%= p.getId() %>" class="btn btn-warning" id="link">Update</a>
					    <a href="patientaction.jsp?op=delete&id=<%= p.getId() %>" class="btn btn-danger" onclick="return confirm('Are you sure to delete this one');" id="link">delete</a>
					  </div>
					</div>
				</div>
				<% } %>
			</div>
	   </div> 
    </div> 
<%@include file="../includes/footer.jsp" %>
<% }else{
        response.sendRedirect("../login.jsp");
    } 
%>