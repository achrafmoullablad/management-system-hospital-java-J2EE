package Ado.Medicament;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Ado.Cado;
import Ado.Consultation.Consultation;

public class CMedicamentImp implements IMedicament{
	Cado ado;
	public CMedicamentImp() {
		this.ado=new Cado();
	}

	@Override
	public int addMedicament(Medicament m) {
		ado.connect();
		String sql="INSERT INTO medicament VALUES(null,'"+m.getNom()+"','"+m.getLaboratoire()+"','"+m.getMaladie()+"')";
		int nb=ado.MAJ(sql);
		ado.disconnect();
		return nb;
	}

	@Override
	public int modifyMedicament(Medicament m, int id) {
		ado.connect();
		String sql="UPDATE medicament SET Nom='"+m.getNom()+"',laboratoire='"+m.getLaboratoire()+"',maladie='"+m.getMaladie()+"' WHERE id='"+id+"'";
		int nb=ado.MAJ(sql);
		ado.disconnect();
		return nb;
	}

	@Override
	public Medicament getMedicament(int id) {
		Medicament m=null;
		ado.connect();
		String sql="SELECT * FROM medicament WHERE id='"+id+"'";
		ResultSet rs=ado.select(sql);
		try {
			while(rs.next()) {
				m=new Medicament(rs.getString(2),rs.getString(3),rs.getString(4));
				m.setId(rs.getInt(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ado.disconnect();
		return m;
	}

	@Override
	public List<Medicament> getAllMedicament() {
		Medicament m=null;
		List<Medicament> lm=new ArrayList<Medicament>();
		ado.connect();
		String sql="SELECT * FROM medicament";
		ResultSet rs=ado.select(sql);
		try {
			while(rs.next()) {
				m=new Medicament(rs.getString(2),rs.getString(3),rs.getString(4));
				m.setId(rs.getInt(1));
				lm.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ado.disconnect();
		return lm;
	}

	@Override
	public int deleteMedicament(int id) {
		ado.connect();
		String sql="DELETE FROM medicament WHERE id='"+id+"'";
		int nb=ado.MAJ(sql);
		ado.disconnect();
		return nb;
	}

	@Override
	public Medicament SercherMedicament(String mc) {
		Medicament m=null;
		ado.connect();
		String sql="SELECT * FROM medicament WHERE Nom like '%"+mc+"%' OR laboratoire='%"+mc+"%' OR maladie='%"+mc+"%' ";
		ResultSet rs=ado.select(sql);
		try {
			while(rs.next()) {
				m=new Medicament(rs.getString(2),rs.getString(3),rs.getString(4));
				m.setId(rs.getInt(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ado.disconnect();
		return m;
	}

}
