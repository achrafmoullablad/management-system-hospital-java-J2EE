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
 <div class="app-wrapper">
	   <div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8 col-12">
					<%
						try{
							CMedecinImp m=new CMedecinImp();
							Medecin me=m.ShowMedecinById(Integer.parseInt(request.getParameter("id")));	
					%>
					<form class="m-2 p-2">
						<h2 class="text-center text-primary">FORM ADD MEDECIN</h2>
						<div class="mb-2">
						  <label for="id" class="form-label">ID</label>
						  <input type="text" class="form-control" id="id" name="id" readonly value="<%= me.getId() %>">
						</div>
						<div class="mb-2">
						  <label for="nom" class="form-label">Nom</label>
						  <input type="text" class="form-control" id="nom" name="nom" value="<%= me.getNom() %>">
						</div>
						<div class="mb-2">
						  <label for="prenom" class="form-label">prenom</label>
						  <input type="text" class="form-control" id="prenom" name="prenom" value="<%= me.getprenom() %>">
						</div>
						<div class="mb-2">
							<label for="email" class="form-label">Email</label>
							<input type="email" class="form-control" name="email" value="<%= me.getEmail() %>">
						  </div>
						  <div class="mb-2">
							<label for="exampleInputPassword1" class="form-label">Password</label>
							<input type="password" class="form-control" id="exampleInputPassword1" name="password" value="<%= me.getPassword() %>">
						  </div>
						  <div class="mb-2">
							<label for="adresse" class="form-label">Adresse</label>
							<input type="text" class="form-control" id="adresse" name="adresse" value="<%= me.getAdresse() %>">
						  </div>
						  <div class="mb-2">
							<label for="telephone" class="form-label">Telephone</label>
							<input type="text" class="form-control" id="telephone" name="telephone" value="<%= me.getTelephone() %>">
						  </div>
						  <select class="mb-3 form-select" aria-label="Default select example" name="status">
							<option value="Disponible">Disponible</option>
							<option value="Non Disponible">Non Disponible</option>
						  </select>
						<button type="submit" class="btn btn-primary" name="update" value="up">Submit</button>
					</form>
				</div>
			</div>
	   </div> 
    </div><!--//app-wrapper-->   
	<% 
		String nom=request.getParameter("nom");
		String prenom=request.getParameter("prenom");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String adresse=request.getParameter("adresse");
		String telephone=request.getParameter("telephone");
		String status=request.getParameter("status");
			if(nom!=null && prenom!=null && email!=null && password!=null && adresse!=null && telephone!=null){
				Medecin md=new Medecin(nom,prenom,email,password,adresse,telephone,status);
				CMedecinImp cm=new CMedecinImp();
				cm.modifyMedcin(md, me.getId());
			}
		}	
		catch(NumberFormatException e){
			out.print(e.getMessage());
		}	
	%>
	<%
		}else{
	        response.sendRedirect("../login.jsp");
	    }
	%>
<%@include file="footer1.jsp" %>