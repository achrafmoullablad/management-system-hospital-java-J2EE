package Ado.Consultation;
import java.util.Date;
public class Consultation {
	private int id;
	private String nomMedecin;
	private String nomPatient;
	private Date date;
	public Consultation() {
	}
	public Consultation(String nomMedecin, String nomPatient) {
		this.nomMedecin = nomMedecin;
		this.nomPatient = nomPatient;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNomMedecin() {
		return nomMedecin;
	}
	public void setNomMedecin(String nomMedecin) {
		this.nomMedecin = nomMedecin;
	}
	public String getNomPatient() {
		return nomPatient;
	}
	public void setNomPatient(String nomPatient) {
		this.nomPatient = nomPatient;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Consultation [id=" + id + ", nomMedecin=" + nomMedecin + ", nomPatient=" + nomPatient + ", date=" + date
				+ "]";
	}
}
