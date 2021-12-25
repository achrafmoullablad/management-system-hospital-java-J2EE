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

@WebServlet("/ServAdmin")
public class ServAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CMAdminImp sm;
    public ServAdmin() {
    }
	public void init(ServletConfig config) throws ServletException {
		sm=new CMAdminImp();
	}
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           String name = request.getParameter("Rand");
           String email = request.getParameter("useremail");           
           sm=new CMAdminImp();
           String code = sm.getRandom();
           Admin user = new Admin(name,email,code);
           boolean test = sm.sendEmail(user);
           if(test){
               HttpSession session  = request.getSession();
               session.setAttribute("authcode", user);
               response.sendRedirect("index.jsp");
           }else{
      		  out.println("Failed to send verification email");
      	   }
        }
    }
}
