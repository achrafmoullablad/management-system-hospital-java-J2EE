package Ado.Admin;

public interface IMAdmin {
	public Admin Authentification(String username,String password);
	public int modifyPassword(String password,int id);
}
