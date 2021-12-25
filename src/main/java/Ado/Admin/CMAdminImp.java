package Ado.Admin;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;
import javax.mail.*;
import javax.mail.internet.*;
import Ado.Cado;
public class CMAdminImp implements IMAdmin{
	Cado ado;
	public CMAdminImp() {
		this.ado=new Cado();
	}
	@Override
	public Admin Authentification(String username,String password) {
		Admin a=null;
		ResultSet rs=null;
		this.ado.connect();
		String sql="SELECT * FROM admin WHERE Username='"+username+"' AND Password='"+password+"'";
		rs=this.ado.select(sql);
		try {
			while(rs.next()) {
				a=new Admin(rs.getString(2),rs.getString(4));
				a.setId(rs.getInt(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ado.disconnect();
		return a;
	}
	//generate random valeur:
	public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }
	
	//send email to the user email:
    public boolean sendEmail(Admin user) {
        boolean test = false;
        String toEmail = user.getEmail();
        String fromEmail = "hamamasaid01@gmail.com";
        String password = "";
        try {
            Properties pr = new Properties();
            pr.setProperty("mail.smtp.host", "smtp.mail.com");
            pr.setProperty("mail.smtp.port", "587");
            pr.setProperty("mail.smtp.auth", "true");
            pr.setProperty("mail.smtp.starttls.enable", "true");
            pr.put("mail.smtp.socketFactory.port", "587");
            pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            javax.mail.Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });
            Message mess = new MimeMessage(session);
            mess.setFrom(new InternetAddress(fromEmail));
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            mess.setSubject("User Email Verification");
            mess.setText("Registered successfully.Please verify your account using this code: " + user.getCode());
            Transport.send(mess);
            test=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }
	@Override
	public int modifyPassword(String password,int id) {
		ado.connect();
		String sql="UPDATE admin set Password='"+password+"' WHERE id='"+id+"'";
		int nb=ado.MAJ(sql);
		ado.disconnect();
		return nb;
	}
}