<%@page import="Ado.Medicament.Medicament"%>
<%@page import="Ado.Medicament.CMedicamentImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Medicament Action</title>
</head>
<style>
	#mycontent{
		background: linear-gradient(45deg, greenyellow, dodgerblue);
	}
</style>
<body>
<%
	Admin a=(Admin)session.getAttribute("admin");
	if(a!=null){		      
%> 

<%@include file="header1.jsp" %>
	<%
		if(request.getParameter("op").equalsIgnoreCase("delete")){
			int id=Integer.parseInt(request.getParameter("id"));
			CMedicamentImp cm=new CMedicamentImp();
			cm.deleteMedicament(id);
	%>
	<script type="text/javascript">
		window.location.href="ShowMedicament.jsp";
	</script>
	<% 
		}
		else if(request.getParameter("op").equalsIgnoreCase("update")){
			int id=Integer.parseInt(request.getParameter("id"));
			CMedicamentImp cm=new CMedicamentImp();
			Medicament m=cm.getMedicament(id);
	%>
 	<div class="app-wrapper"  id="mycontent">
		   <div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-8 col-12">
						<form class="m-2 p-2" method="POST">
							<h2 class="text-center text-primary">FORM ADD MEDICAMENT</h2>
							<div class="mb-2">
							  <label for="id" class="form-label">ID</label>
							  <input type="text" class="form-control" id="id" name="id" readonly value="<%= m.getId() %>">
							</div>
							<div class="mb-2">
							  <label for="nom" class="form-label">Nom</label>
							  <input type="text" class="form-control" id="nom" name="nom" value="<%= m.getNom() %>">
							</div>
							<div class="mb-2">
							  <label for="username" class="form-label">Laboratoire</label>
							  <input type="text" class="form-control" id="username" name="labo" value="<%= m.getLaboratoire() %>">
							</div>
							<div class="mb-2">
								<label for="email" class="form-label">Maladie</label>
								<input type="text" class="form-control" name="maladie" value="<%= m.getMaladie() %>">
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
		   </div> 
	 </div>
	<%
		String nom=request.getParameter("nom");
		String labo=request.getParameter("labo");
		String maladie=request.getParameter("maladie");
		Medicament md=new Medicament(nom,labo,maladie);
		if(nom!=null && labo!=null && maladie!=null){
				cm.modifyMedicament(md, id);
	%>
	<script type="text/javascript">
		window.location.href="ShowMedicament.jsp";
	</script>
	<%
		}
	}
	%>
	
<%@include file="footer1.jsp" %>
<% }else{
        response.sendRedirect("../login.jsp");
    } 
%>
</body>
</html>