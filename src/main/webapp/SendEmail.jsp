<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@include file="includes/header.jsp" %>
	 <div class="app-wrapper">
	    <div class="app-content pt-3 p-md-3 p-lg-4">
		    <div class="container-xl">
		    	<form class="auth-form login-form" method="POST" action="/ServAdmin">   
					<div class="email mb-3">
						<label class="sr-only" for="signin-email">Verify Email</label>
						<input id="signin-email" name="Rand" type="text" class="form-control signin-email" placeholder="username or Email address" required="required">
					</div>
					<div class="text-center">
						<button type="submit" class="btn app-btn-primary w-100 theme-btn mx-auto">Valide</button>
					</div>
				</form>
		    </div>
		</div>
	</div>
	<%@include file="includes/footer.jsp" %>
</body>
</html>