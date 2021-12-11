package Ado.Medecin;
public class Medecin {
	private int id;
	private String Nom;
	private String Username;
	private String Email;
	private String Password;
	private String Adresse;
	private String Telephone;
	private String status;
	public Medecin() {}
	public Medecin(String nom, String username, String email, String password, String adresse, String telephone,String status) {
		this.Nom = nom;
		this.Username = username;
		this.Email = email;
		this.Password = password;
		this.Adresse = adresse;
		this.Telephone = telephone;
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom() {
		return Nom;
	}
	public void setNom(String nom) {
		Nom = nom;
	}
	public String getUsername() {
		return Username;
	}
	public void setUsername(String username) {
		Username = username;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getAdresse() {
		return Adresse;
	}
	public void setAdresse(String adresse) {
		Adresse = adresse;
	}
	public String getTelephone() {
		return Telephone;
	}
	public void setTelephone(String telephone) {
		Telephone = telephone;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Medecin [id=" + id + ", Nom=" + Nom + ", Username=" + Username + ", Email=" + Email + ", Password="
				+ Password + ", Adresse=" + Adresse + ", Telephone=" + Telephone + ", status=" + status + "]";
	}
}
