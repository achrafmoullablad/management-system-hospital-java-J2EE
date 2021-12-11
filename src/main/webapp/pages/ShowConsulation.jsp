<%@page import="Ado.Admin.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	Admin a=(Admin)session.getAttribute("admin");
	if(a!=null){		      
%> 
<%@include file="../includes/header.jsp" %>
 <div class="app-wrapper">
	   <div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8 col-12">
					<form class="m-2 p-2">
						<h2 class="text-center text-primary">FORM ADD MEDECIN</h2>
						<div class="mb-2">
						  <label for="nom" class="form-label">Nom</label>
						  <input type="text" class="form-control" id="nom" name="nom">
						</div>
						<div class="mb-2">
						  <label for="username" class="form-label">Username</label>
						  <input type="text" class="form-control" id="username" name="username">
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
							<option selected>Select Status</option>
							<option value="1">Disponible</option>
							<option value="0">Non Disponible</option>
						  </select>
						<button type="submit" class="btn btn-primary">Submit</button>
					</form>
				</div>
			</div>
	   </div> 
    </div><!--//app-wrapper-->   
<%@include file="../includes/footer.jsp" %>
<% }else{
        response.sendRedirect("login.jsp");
    } 
%>