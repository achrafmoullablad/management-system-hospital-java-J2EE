package Ado.Medicament;

public class Medicament {
	private int id;
	private String nom;
	private String laboratoire;
	private String maladie;
	public Medicament() {}
	public Medicament(String nom, String laboratoire, String maladie) {
		this.nom = nom;
		this.laboratoire = laboratoire;
		this.maladie = maladie;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getLaboratoire() {
		return laboratoire;
	}
	public void setLaboratoire(String laboratoire) {
		this.laboratoire = laboratoire;
	}
	public String getMaladie() {
		return maladie;
	}
	public void setMaladie(String maladie) {
		this.maladie = maladie;
	}
	@Override
	public String toString() {
		return "Medicament [id=" + id + ", nom=" + nom + ", laboratoire=" + laboratoire + ", maladie=" + maladie + "]";
	}
}
