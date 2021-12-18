package Ado.Patient;
import java.util.List;
public interface IMPatient {
	public int addPatient(Patient p);
	public int modifyPatient(Patient p,int id);
	public Patient ShowPatientById(int id);
	public List<Patient> getAllPatient();
	public int deletePatient(int id);
}
