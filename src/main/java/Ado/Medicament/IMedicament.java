package Ado.Medicament;
import java.util.List;
public interface IMedicament {
	public int addMedicament(Medicament m);
	public int modifyMedicament(Medicament m,int id);
	public Medicament getMedicament(int id);
	public List<Medicament> getAllMedicament();
	public Medicament SercherMedicament(String mc);
	public int deleteMedicament(int id);
}