 <%@include file="header1.jsp" %>
<%
	Admin a=(Admin)session.getAttribute("admin");
	if(a!=null){		      
%> 

<!DOCTYPE HTML>
<html>
<head>
</head>
<body>
	<div class="app-wrapper">
		 <div class="app-content pt-3 p-md-3 p-lg-4">
			  <div class="container-xl">
			  		 <form class="m-2 p-2" method="POST">
						<h2 class="text-center text-primary">FORM CHANGE PASSWORD ADMIN</h2>
						<div class="mb-2">
							<label for="password" class="form-label">Password</label>
							<input type="text" class="form-control" id="password" name="pwd">
						</div>
						<div class="mb-2">
							<label for="confpassword" class="form-label">Confirm Password</label>
							<input type="text" class="form-control" id="confpassword" name="confpwd">
						</div>
						<button type="submit" class="btn btn-primary">Submit</button>
					</form>
				</div>
				<% 
			  		String pwd=request.getParameter("pwd");
			  		String confpwd=request.getParameter("confpwd");
			  		CMAdminImp ca=new CMAdminImp();
			  		if(pwd!=null && confpwd!=null){
			  			if(pwd.equals(confpwd)){
				  			ca.modifyPassword(pwd, a.getId());
				 %>
				 <div class="alert alert-warning alert-dismissible fade show" role="alert">
				  <strong>Information !!</strong> votre password a ete changer aves success.
				  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
				<%
				  		}
			  		}
			  	%>
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
