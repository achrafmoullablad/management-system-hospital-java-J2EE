package Ado.Consultation;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Ado.Cado;
public class CMConsultationImp implements IMConsulation{
	Cado ado;
	public CMConsultationImp() {
		this.ado=new Cado();
	}
	@Override
	public int addConsultation(Consultation c) {
		ado.connect();
		String sql="INSERT INTO consultation(id,nomMedcin,nomPatient) VALUES(null,'"+c.getNomMedecin()+"','"+c.getNomPatient()+"')";
		int nb=ado.MAJ(sql);
		ado.disconnect();
		return nb;
	}
	@Override
	public int modifyConsultation(Consultation c, int id) {
		ado.connect();
		String sql="UPDATE consultation SET nomMedcin='"+c.getNomMedecin()+"', nomPatient='"+c.getNomPatient()+"' WHERE id='"+id+"')";
		int nb=ado.MAJ(sql);
		ado.disconnect();
		return nb;
	}
	@Override
	public Consultation getSingleConsultation(int id) {
		Consultation c=null;
		ado.connect();
		String sql="SELECT * FROM consultation WHERE id='"+id+"'";
		ResultSet rs=ado.select(sql);
		try {
			while(rs.next()) {
				c=new Consultation(rs.getString(2),rs.getString(3));
				c.setId(rs.getInt(1));	
				c.setDate(rs.getDate(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ado.disconnect();
		return c;
	}
	@Override
	public List<Consultation> getAllConsultation() {
		List<Consultation> lc=new ArrayList<Consultation>();
		Consultation c=null;
		ado.connect();
		String sql="SELECT * FROM consultation";
		ResultSet rs=ado.select(sql);
		try {
			while(rs.next()) {
				c=new Consultation(rs.getString(2),rs.getString(3));
				c.setId(rs.getInt(1));	
				c.setDate(rs.getDate(4));
				lc.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ado.disconnect();
		return lc;
	}
	@Override
	public int deleteConsultation(int id) {
		ado.connect();
		String sql="DELETE FROM consultation WHERE id='"+id+"'";
		int nb=ado.MAJ(sql);
		ado.disconnect();
		return nb;
	}
}
