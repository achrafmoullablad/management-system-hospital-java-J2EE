<%@page import="Ado.Medecin.CMedecinImp"%>
<%@page import="Ado.Admin.CMAdminImp"%>
<%@page import="Ado.Medecin.Medecin"%>
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
	   <div class="container" id="mycontent" >
			<div class="row justify-content-center">
				<div class="col-lg-8 col-12">
					<%
						String nom=request.getParameter("nom");
						String prenom=request.getParameter("prenom");
						String email=request.getParameter("email");
						String password=request.getParameter("password");
						String adresse=request.getParameter("adresse");
						String telephone=request.getParameter("telephone");
						String status=request.getParameter("status");
						String message="";
						if(nom!=null && prenom!=null && email!=null && password!=null && adresse!=null && telephone!=null && status!=null){
							Medecin md=new Medecin(nom,prenom,email,password,adresse,telephone,status);
							CMedecinImp cm=new CMedecinImp();
							int nb=cm.addMedcien(md);
							if(nb==1){
					%>
					<div class="alert alert-success alert-dismissible fade show" role="alert">
					  <strong>Notification !!!</strong> Medecin Ajouter avec success .
					  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
					</div>
					<%
							}
						}
					%>
					<form class="m-2 p-2">
						<h2 class="text-center text-primary">FORM ADD MEDECIN</h2>
						<div class="mb-2">
						  <label for="nom" class="form-label">Nom</label>
						  <input type="text" class="form-control" id="nom" name="nom">
						</div>
						<div class="mb-2">
						  <label for="prenom" class="form-label">Prenom</label>
						  <input type="text" class="form-control" id="prenom" name="prenom">
						</div>
						<div class="mb-2">
							<label for="email" class="form-label">Email</label>
							<input type="email" class="form-control" name="email">
						  </div>
						  <div class="mb-2">
							<label for="exampleInputPassword1" class="form-label">Password</label>
							<input type="password" class="form-control" id="exampleInputPassword1" name="password">
						  </div>
						  <div class="mb-2">
							<label for="adresse" class="form-label">Adresse</label>
							<input type="text" class="form-control" id="adresse" name="adresse">
						  </div>
						  <div class="mb-2">
							<label for="telephone" class="form-label">Telephone</label>
							<input type="text" class="form-control" id="telephone" name="telephone">
						  </div>
						  <select class="mb-3 form-select" aria-label="Default select example" name="status">
							<option value="Disponible">Disponible</option>
							<option value="Non Disponible">Non Disponible</option>
						  </select>
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