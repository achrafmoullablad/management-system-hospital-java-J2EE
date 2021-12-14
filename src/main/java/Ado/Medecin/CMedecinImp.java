package Ado.Medecin;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Ado.Cado;

public class CMedecinImp implements IMedecin{
	Cado ado;
	public CMedecinImp() {
		this.ado=new Cado();
	}
	@Override
	public int addMedcien(Medecin md) {
		ado.connect();
		String sql="INSERT INTO medecin VALUES(null,'"+md.getNom()+"','"+md.getprenom()+"','"+md.getEmail()+"','"+md.getPassword()+"',"
				+ "'"+md.getAdresse()+"','"+md.getTelephone()+"','"+md.getStatus()+"')";
		int nb=ado.MAJ(sql);
		ado.disconnect();
		return nb;
	}

	@Override
	public int modifyMedcin(Medecin md,int id) {
		ado.connect();
		String sql="UPDATE medecin SET Nom='"+md.getNom()+"', prenom='"+md.getprenom()+"', Email='"+md.getEmail()+"', Password='"+md.getPassword()+
				"', Adresse='"+md.getAdresse()+"', Telephone='"+md.getTelephone()+"', status='"+md.getStatus()+"' WHERE id='"+id+"'";
		int nb=ado.MAJ(sql);
		ado.disconnect();
		return nb;
	}

	@Override
	public Medecin ShowMedecinById(int id) {
		Medecin md=null;
		ado.connect();
		String sql="SELECT * FROM medecin WHERE id='"+id+"'";
		ResultSet rs=ado.select(sql);
		try {
			while(rs.next()) {
				md=new Medecin(rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
				md.setId(rs.getInt(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ado.disconnect();
		return md;
	}

	@Override
	public List<Medecin> getAllMedecin() {
		Medecin md=null;
		List<Medecin> lm=new ArrayList<Medecin>();
		ado.connect();
		String sql="SELECT * FROM medecin";
		ResultSet rs=ado.select(sql);
		try {
			while(rs.next()) {
				md=new Medecin(rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
				md.setId(rs.getInt(1));
				lm.add(md);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ado.disconnect();
		return lm;
	}

	@Override
	public int deleteMedcin(int id) {
		ado.connect();
		String sql="DELETE FROM medecin WHERE id='"+id+"'";
		int nb=ado.MAJ(sql);
		ado.disconnect();
		return nb;
	}
	
}
