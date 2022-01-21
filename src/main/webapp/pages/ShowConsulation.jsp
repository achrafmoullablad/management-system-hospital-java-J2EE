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
	<script type="text/javascript">
		$(document).ready(function() {
		    $('#example').DataTable();
		} );
	</script>
	   <div class="container p-2 m-2">
			<div class="row justify-content-center">
				<div class="col-lg-11 col-12">
				<h2 class="text-center text-success p-2 m-1">LISTE CONSULTATION</h2>
					<table id="example" class="table">
				        <thead>
				            <tr>
				                <th>ID Consultation</th>
				                <th>Date Consultation</th>
				                <th>Nom Medecin</th>
				                <th>Nom Patient </th>
				                <th>Nom Medicament</th>
				                <th>Update</th>
				                <th>Delete</th>
				                <th>Print</th>
				            </tr>
				        </thead>
				        <tbody>
				        	<%
								CMConsultationImp cm=new CMConsultationImp();
								List<Consultation> lc=cm.getAllConsultation();
								CMedecinImp ci=new CMedecinImp();
								CMPatientImp ct=new CMPatientImp();
								CMedicamentImp cd=new CMedicamentImp();
								for(Consultation c:lc){
									Medecin m=ci.ShowMedecinById(c.getIdMedecin());
									Patient p=ct.ShowPatientById(c.getIdPatient());
									Medicament d=cd.getMedicament(c.getIdMedicament());
							%>
				            <tr>
				                <td><%= c.getId() %></td>
				                <td><%= c.getDate() %></td>
				                <td><%= m.getNom()+" "+m.getprenom()  %></td>
				                <td><%= p.getNom()+" "+p.getPrenom()  %></td>
				                <td><%= d.getNom() %></td>
				                <td><a href="consultationupdate.jsp?op=update&id=<%= c.getId() %>" class="btn btn-warning" id="link"><i class="fas fa-edit"></i></a></td>
				                <td><a href="consultationaction.jsp?op=delete&id=<%= c.getId() %>" class="btn btn-danger" onclick="return confirm('Are you sure to delete this one');" ><i class="fas fa-trash-alt"></i></a></td>
				                <td><a href="consultationaction.jsp?op=print&id=<%= c.getId() %>&nommedecin=<%= m.getNom()+" "+m.getprenom() %>&nompatient=<%= p.getNom()+" "+p.getPrenom() %>&nommedicament<%= d.getNom() %>&date=<%= c.getDate() %>" class="btn btn-primary"><i class="fas fa-print"></i></a></td>
				            </tr>
				            <% } %>
				        </tbody>
				 </table>
			</div>
	   </div> 
    </div>   
<%@include file="footer1.jsp" %>
<%	}else{
        response.sendRedirect("../404.jsp");
    } 
%>