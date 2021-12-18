package Ado.Medecin;
import java.util.List;
public interface IMedecin {
	public int addMedcien(Medecin md);
	public int modifyMedcin(Medecin md,int id);
	public Medecin ShowMedecinById(int id);
	public List<Medecin> getAllMedecin();
	public Medecin SearchMedecin(String motcle);
	public List<Medecin> getMedecinDisponible();
	public int deleteMedcin(int id);
}
