<%@page import="Ado.Admin.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	Admin a=(Admin)session.getAttribute("admin");
	if(a!=null){		      
%> 
<%@include file="includes/header.jsp" %>  
    <div class="app-wrapper">	    
	    <div class="app-content pt-3 p-md-3 p-lg-4">
		    <div class="container-xl">
			    <h1 class="app-page-title">Charts</h1>
			    </div>
			    <div class="row g-4 mb-4">
			        <div class="col-12 col-lg-6">
					    <div class="app-card app-card-chart h-100 shadow-sm">
					        <div class="app-card-header p-3 border-0">
						        <h4 class="app-card-title">Area Line Chart Demo</h4>
					        </div><!--//app-card-header-->
					        <div class="app-card-body p-4">					   
						        <div class="chart-container">
				                    <canvas id="chart-line" ></canvas>
						        </div>
					        </div><!--//app-card-body-->
				        </div><!--//app-card-->
			        </div><!--//col-->
		            <div class="col-12 col-lg-6">		        
				        <div class="app-card app-card-chart h-100 shadow-sm">
					        <div class="app-card-header p-3 border-0">
						        <h4 class="app-card-title">Bar Chart Demo</h4>
					        </div><!--//app-card-header-->
					        <div class="app-card-body p-4">					   
						        <div class="chart-container">
				                    <canvas id="chart-bar" ></canvas>
						        </div>
					        </div><!--//app-card-body-->
				        </div><!--//app-card-->
		            </div><!--//col-->
		            <div class="col-12 col-lg-6">		        
				        <div class="app-card app-card-chart h-100 shadow-sm">
					        <div class="app-card-header p-3 border-0">
						        <h4 class="app-card-title">Pie Chart Demo</h4>
					        </div><!--//app-card-header-->
					        <div class="app-card-body p-4">					   
						        <div class="chart-container">
				                    <canvas id="chart-pie" ></canvas>
						        </div>
					        </div><!--//app-card-body-->
				        </div><!--//app-card-->
		            </div><!--//col-->
		            <div class="col-12 col-lg-6">		        
				        <div class="app-card app-card-chart h-100 shadow-sm">
					        <div class="app-card-header p-3 border-0">
						        <h4 class="app-card-title">Doughnut Chart Demo</h4>
					        </div><!--//app-card-header-->
					        <div class="app-card-body p-4">					   
						        <div class="chart-container">
				                    <canvas id="chart-doughnut" ></canvas>
						        </div>
					        </div><!--//app-card-body-->
				        </div><!--//app-card-->
		            </div><!--//col-->
			    </div><!--//row-->
		    </div><!--//container-fluid-->
	    </div><!--//app-content-->
    </div><!--//app-wrapper-->  
      					
<%@include file="includes/footer.jsp" %>
<% }else{
        response.sendRedirect("login.jsp");
    } 
%>