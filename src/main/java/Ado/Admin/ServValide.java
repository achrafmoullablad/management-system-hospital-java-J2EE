package Ado.Admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ServValide
 */
@WebServlet("/ServValide")
public class ServValide extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ServValide() {
  
    }
	public void init(ServletConfig config) throws ServletException {
		
	}
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            Admin user= (Admin) session.getAttribute("authcode");
            String code = request.getParameter("authcode");
            if(code.equals(user.getCode())){
                out.println("Verification Done");
                response.sendRedirect("../index.jsp");
            }else{
                out.println("Incorrect verification code");
                response.sendRedirect("../login.jsp");
            }
        }
    }
}
