package Ado;
import java.sql.ResultSet;
public interface Iado {
	public void connect();
	public int MAJ(String sql);
	public ResultSet select(String sql);
	public void disconnect();
}
