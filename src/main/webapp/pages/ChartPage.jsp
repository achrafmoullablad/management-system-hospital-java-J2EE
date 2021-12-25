<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Ado.Cado"%>
<%@ page import="java.util.*,java.sql.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%
	Admin a=(Admin)session.getAttribute("admin");
	if(a!=null){		      
%> 
 <%@include file="header1.jsp" %>
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

<!DOCTYPE HTML>
<html>
<head>
	<script type="text/javascript">
		window.onload = function() { 
		var chart = new CanvasJS.Chart("chartContainer", {
			animationEnabled: true,
			exportEnabled: true,
			title: {
				text: "Column Chart"
			},
			data: [{
				type: "column",
				dataPoints: <%= dataPoints %>	
			}]
			
		});
		chart.render();
		}
	</script>
</head>
<body>
	<div class="app-wrapper">
		 <div class="app-content pt-3 p-md-3 p-lg-4">
			  <div class="container-xl">
			  		<%= dataPoints %>
					<div id="chartContainer" style="height: 360px; width: 100%;margin-top:30px;"></div>	
				</div>
		 </div>
	</div>
	<script src="../assets/jquery/canvasjs.min.js"></script>
</body>
</html>
<%	}else{
        response.sendRedirect("../login.jsp");
    } 
%>   
<%@include file="footer1.jsp" %> 