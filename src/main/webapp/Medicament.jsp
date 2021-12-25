<%@page import="Ado.Medicament.Medicament"%>
<%@page import="Ado.Medicament.CMedicamentImp"%>
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
 <div class="app-wrapper"  id="mycontent">
	   <div class="container">
	   	<%
	   		CMedicamentImp cm=new CMedicamentImp();
	   		String nom=request.getParameter("nom");
	   		String labo=request.getParameter("labo");
	   		String maladie=request.getParameter("maladie");
	   		Medicament m=new Medicament(nom,labo,maladie);
	   		if(nom!=null && labo!=null && maladie!=null){
	   			cm.addMedicament(m);
	   		}
	   	%>
			<div class="row justify-content-center">
				<div class="col-lg-8 col-12">
					<form class="m-2 p-2" method="POST">
						<h2 class="text-center text-primary">FORM ADD MEDICAMENT</h2>
						<div class="mb-2">
						  <label for="nom" class="form-label">Nom</label>
						  <input type="text" class="form-control" id="nom" name="nom">
						</div>
						<div class="mb-2">
						  <label for="username" class="form-label">Laboratoire</label>
						  <input type="text" class="form-control" id="username" name="labo">
						</div>
						<div class="mb-2">
							<label for="email" class="form-label">Maladie</label>
							<input type="text" class="form-control" name="maladie">
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