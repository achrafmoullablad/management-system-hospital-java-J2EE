package Ado.Patient;
public class Patient {
	private int id;
	private String prenom;
	private String nom;
	private String email;
	private String adresse;
	private String telephone;
	private String medecin;
	public Patient() {}
	public Patient(String prenom, String nom, String email, String adresse, String telephone, String medecin) {
		this.prenom = prenom;
		this.nom = nom;
		this.email = email;
		this.adresse = adresse;
		this.telephone = telephone;
		this.medecin = medecin;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAdresse() {
		return adresse;
	}
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getMedecin() {
		return medecin;
	}
	public void setMedecin(String medecin) {
		this.medecin = medecin;
	}
	@Override
	public String toString() {
		return "Patient [id=" + id + ", prenom=" + prenom + ", nom=" + nom + ", email=" + email + ", adresse=" + adresse
				+ ", telephone=" + telephone + ", medecin=" + medecin + "]";
	}
}
