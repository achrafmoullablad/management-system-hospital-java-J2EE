<%@page import="com.itextpdf.text.Font.FontStyle"%>
<%@page import="com.itextpdf.text.Rectangle"%>
<%@page import="com.itextpdf.text.BaseColor"%>
<%@page import="com.itextpdf.text.Font.FontFamily"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="Ado.Consultation.CMConsultationImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@include file="header1.jsp" %>

<style>
	#mycontent{
		background: linear-gradient(45deg, greenyellow, dodgerblue);
	}
</style>
<%
	Admin a=(Admin)session.getAttribute("admin");
	if(a!=null){		      
%>
	<%
		CMConsultationImp cm=new CMConsultationImp();
		int id=Integer.parseInt(request.getParameter("id"));
		if(request.getParameter("op").equalsIgnoreCase("delete")){
			cm.deleteConsultation(id);
		}else
		if(request.getParameter("op").equalsIgnoreCase("print")){
			String nomMedecin=request.getParameter("nommedecin");
			String nompatient=request.getParameter("nompatient");
			String date=request.getParameter("date");
			response.setContentType("application/pdf");
			try {
				OutputStream file = new FileOutputStream(new File("C:/Users/hp/eclipse-workspace/Tutorial2_J2ee/src/main/webapp/PrintPdf/file"+id+".pdf"));
				Rectangle pagepdf = new Rectangle(720, 720); 
				pagepdf.setBackgroundColor(BaseColor.LIGHT_GRAY);
				Document document = new Document(pagepdf);
				PdfWriter.getInstance(document, file);
				Font f=new Font(FontFamily.TIMES_ROMAN,24.0f,Font.BOLDITALIC,BaseColor.WHITE);
				document.open();
				document.add(new Paragraph(" CABINET PARMACO :",f));
				document.add(new Paragraph("ID Consultation :"+id,f));
				document.add(new Paragraph("Nom Medecin :"+nomMedecin,f));
				document.add(new Paragraph("Nom Patient :"+nompatient,f));
				document.add(new Paragraph("Date Consultation :"+date,f));
				document.close();
				file.close();
			} catch (Exception e) {
				e.printStackTrace();
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