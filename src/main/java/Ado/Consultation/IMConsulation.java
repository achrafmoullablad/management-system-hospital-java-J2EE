package Ado.Consultation;
import java.util.List;
public interface IMConsulation {
	public int addConsultation(Consultation c);
	public int modifyConsultation(Consultation c,int id);
	public Consultation getSingleConsultation(int id);
	public List<Consultation> getAllConsultation();
	public int deleteConsultation(int id);
}
