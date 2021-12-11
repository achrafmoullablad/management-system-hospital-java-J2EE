package Ado;
import java.sql.*;
public class Cado implements Iado{
	public Connection conn;
	public Statement st;
	public ResultSet rs;
	@Override
	public void connect() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url="jdbc:mysql://localhost/db_miniprojet";
			conn=DriverManager.getConnection(url, "root", "");
			st=conn.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public int MAJ(String sql) {
		int nb=0;
		try {
			nb=st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return nb;
	}
	@Override
	public ResultSet select(String sql) {
		try {
			rs=st.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	@Override
	public void disconnect() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
