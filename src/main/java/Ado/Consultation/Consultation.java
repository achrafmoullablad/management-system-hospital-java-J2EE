package Ado.Consultation;
import java.util.Date;
public class Consultation {
	private int id;
	private int idMedecin;
	private int idPatient;
	private int idMedicament;
	private Date date;
	public Consultation() {
	}
	public Consultation(int idMedecin, int idPatient, int idMedicament) {
		this.idMedecin = idMedecin;
		this.idPatient = idPatient;
		this.idMedicament = idMedicament;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIdMedecin() {
		return idMedecin;
	}
	public void setIdMedecin(int idMedecin) {
		this.idMedecin = idMedecin;
	}
	public int getIdPatient() {
		return idPatient;
	}
	public void setIdPatient(int idPatient) {
		this.idPatient = idPatient;
	}
	public int getIdMedicament() {
		return idMedicament;
	}
	public void setIdMedicament(int idMedicament) {
		this.idMedicament = idMedicament;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Consultation [id=" + id + ", idMedecin=" + idMedecin + ", idPatient=" + idPatient + ", idMedicament="
				+ idMedicament + ", date=" + date + "]";
	}
}
