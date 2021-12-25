package Ado.Admin;
public class Admin {
	private int id;
	private String username;
	private String email;
	private String password;
	private String code;
	public Admin() {}
	public Admin(String username, String password) {
		this.username = username;
		this.password = password;
	}
	public Admin(String username, String email, String code) {
		this.username = username;
		this.email = email;
		this.code = code;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	@Override
	public String toString() {
		return "Admin [id=" + id + ", username=" + username + ", email=" + email + ", password=" + password + "]";
	}
}
