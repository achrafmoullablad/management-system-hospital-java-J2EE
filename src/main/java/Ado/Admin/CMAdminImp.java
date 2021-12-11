package Ado.Admin;

import java.sql.ResultSet;
import java.sql.SQLException;

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
}
