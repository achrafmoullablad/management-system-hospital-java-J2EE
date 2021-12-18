package Ado.Patient;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Ado.Cado;

public class CMPatientImp implements IMPatient{
	Cado ado;
	public CMPatientImp() {
		this.ado=new Cado();
	}
	@Override
	public int addPatient(Patient p) {
		ado.connect();
		String sql="INSERT INTO patient VALUES(null,'"+p.getPrenom()+"','"+p.getNom()+"','"+p.getEmail()+"','"+p.getAdresse()+
				"','"+p.getTelephone()+"','"+p.getMedecin()+"')";
		int nb=ado.MAJ(sql);
		ado.disconnect();
		return nb;
	}
	@Override
	public int modifyPatient(Patient p, int id) {
		ado.connect();
		String sql="UPDATE patient SET prenom='"+p.getPrenom()+"', Nom='"+p.getNom()+"', Email='"+p.getEmail()+"', Adresse='"+p.getAdresse()+"', Telephone='"+p.getTelephone()+"' WHERE id='"+id+"'";
		int nb=ado.MAJ(sql);
		ado.disconnect();
		return nb;
	}

	@Override
	public Patient ShowPatientById(int id) {
		Patient p=null;
		ado.connect();
		String sql="SELECT * FROM patient WHERE id='"+id+"'";
		ResultSet rs=ado.select(sql);
		try {
			while(rs.next()) {
				p=new Patient(rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
				p.setId(rs.getInt(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ado.disconnect();
		return p;
	}

	@Override
	public List<Patient> getAllPatient() {
		Patient p=null;
		List<Patient> lm=new ArrayList<Patient>();
		ado.connect();
		String sql="SELECT * FROM patient";
		ResultSet rs=ado.select(sql);
		try {
			while(rs.next()) {
				p=new Patient(rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
				p.setId(rs.getInt(1));
				lm.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ado.disconnect();
		return lm;
	}

	@Override
	public int deletePatient(int id) {
		ado.connect();
		String sql="DELETE FROM patient where id='"+id+"'";
		int nb=ado.MAJ(sql);
		ado.disconnect();
		return nb;
	}
}
