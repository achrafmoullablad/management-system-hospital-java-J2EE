<%@page import="Ado.Cado"%>
<%@ page import="java.util.*,java.sql.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@page import="com.mysql.cj.x.protobuf.MysqlxNotice.GroupReplicationStateChangedOrBuilder"%>
<%@page import="Ado.Medicament.Medicament"%>
<%@page import="Ado.Medicament.CMedicamentImp"%>
<%@page import="Ado.Consultation.Consultation"%>
<%@page import="Ado.Consultation.CMConsultationImp"%>
<%@page import="Ado.Patient.Patient"%>
<%@page import="Ado.Patient.CMPatientImp"%>
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
<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
String dataPoints = null;
	try{
		Cado ado=new Cado();
		ado.connect();
		ResultSet resultSet =ado.select("SELECT COUNT(*),M.id FROM medecin M,consultation C where M.id=C.idMedcin GROUP by M.id;");
		while(resultSet.next()){
			int xVal = resultSet.getInt(2);
			int yVal = resultSet.getInt(1);
			map = new HashMap<Object,Object>(); 
			map.put("x", xVal); 
			map.put("y", yVal); 
			list.add(map);
			dataPoints = gsonObj.toJson(list);
		}
		ado.disconnect();
	}
	catch(SQLException e){
		out.print(e.getMessage());
		dataPoints = null;
	}
%>
<%@include file="includes/header.jsp" %>
<script type="text/javascript">
		window.onload = function() { 
		var chart = new CanvasJS.Chart("chartContainer", {
			animationEnabled: true,
			exportEnabled: true,
			title: {
				text: "Statistique des Consultations"
			},
			data: [{
				type: "column",
				dataPoints: <%= dataPoints %>	
			}]
			
		});
		chart.render();
		}
</script>
    <div class="app-wrapper">
	    
	    <div class="app-content pt-3 p-md-3 p-lg-4">
		    <div class="container-xl">
			    <%
			   		CMedecinImp cm=new CMedecinImp();
			    	List<Medecin> lm=cm.getAllMedecin();
			    %>
			    <h1 class="app-page-title">Overview</h1>    
			    <div class="row g-4 mb-3">
				    <div class="col-6 col-lg-3">
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 class="stats-type mb-1">Medcin</h4>
							    <div class="stats-figure"><%= lm.size() %></div>					
						    </div><!--//app-card-body-->
						    <a class="app-card-link-mask" href="ShowMedecin.jsp"></a>
					    </div><!--//app-card-->
				    </div><!--//col-->
				    <%
				    	CMPatientImp cp=new CMPatientImp();
				    	List<Patient> lp=cp.getAllPatient();
				    
				    %>
				    <div class="col-6 col-lg-3">
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 class="stats-type mb-1">Patient</h4>
							    <div class="stats-figure"><%= lp.size() %></div>
						    </div><!--//app-card-body-->
						    <a class="app-card-link-mask" href="pages/ShowPatient.jsp"></a>
					    </div><!--//app-card-->
				    </div><!--//col-->
				    <div class="col-6 col-lg-3">
				    	<%
				    		CMedicamentImp cd=new CMedicamentImp();
				    		List<Medicament> ld=cd.getAllMedicament();
				    	
				    	%>
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 class="stats-type mb-1">Medicament</h4>
							    <div class="stats-figure"><%= ld.size() %></div>							   
						    </div><!--//app-card-body-->
						    <a class="app-card-link-mask" href="pages/ShowMedicament.jsp"></a>
					    </div><!--//app-card-->
				    </div><!--//col-->
					<div class="col-6 col-lg-3">
						<%
				    		CMConsultationImp cl=new CMConsultationImp();
				    		List<Consultation> lc=cl.getAllConsultation();
				    	
				    	%>
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 class="stats-type mb-1">Consultation</h4>
							    <div class="stats-figure"><%= lc.size() %></div>							   
						    </div><!--//app-card-body-->
						    <a class="app-card-link-mask" href="pages/ShowConsulation.jsp"></a>
					    </div><!--//app-card-->
				    </div><!--//col-->
			    </div><!--//row-->
			    <div class="row g-4 mb-4">
			        <div class="container-xl">
						<div id="chartContainer" style="height: 360px; width: 100%;margin-top:30px;"></div>	
					</div>
			    </div><!--//row-->

		    </div><!--//container-fluid-->
	    </div><!--//app-content-->
    </div><!--//app-wrapper-->   					
<%@include file="includes/footer.jsp" %>
<% }else{
        response.sendRedirect("login.jsp");
    } 
%>