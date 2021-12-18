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
 <div class="app-wrapper">
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
	   <div class="container">
			<form>
					<div class="input-group justify-content-center m-1 p-2">
					  <div class="form-outline">
					    <input name="search" style="width: 24rem;" class="form-control" />
					  </div>
					  <button type="button" class="btn btn-primary"><i class="fas fa-search"></i></button>
					</div>
			</form>
			<div class="row justify-content-center">
			<%
				CMConsultationImp cm=new CMConsultationImp();
				List<Consultation> lc=cm.getAllConsultation();
				for(Consultation c:lc){
			
			%>
				<div class="col-lg-4 col-md-6 col-12 p-2">
					<div class="card" style="width: 21rem;" id="mycard">
					  <div class="card-body">
					  	<p class="card-text  p-2 m-2">ID Consultation : <%= c.getId() %></p>
					    <p class="card-text  p-2 m-2">Nom Patient : <%= c.getNomPatient() %></p>
					    <p class="card-text p-2 m-2">Nom Medecin : <%= c.getNomMedecin() %></p>
					    <p class="card-text p-2 m-2">Date Consultation : <%= c.getDate() %></p>
					    <a href="consultationaction.jsp?op=update&id=<%= c.getId() %>" class="btn btn-warning" id="link">Update</a>
					    <a href="consultationaction.jsp?op=delete&id=<%= c.getId() %>" class="btn btn-danger" onclick="return confirm('Are you sure to delete this one');" id="link">delete</a>
					  </div>
					</div>
				</div>
				<% } %>
			</div>
	   </div> 
    </div>   
<%@include file="footer1.jsp" %>
<%	}else{
        response.sendRedirect("../login.jsp");
    } 
%>