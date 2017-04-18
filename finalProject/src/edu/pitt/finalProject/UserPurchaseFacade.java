package edu.pitt.finalProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.mysql.jdbc.PreparedStatement;

@Stateless
public class UserPurchaseFacade {

	@PersistenceContext(unitName="finalProject")
	private EntityManager em;
	
	
	public UserPurchaseFacade(){
		super();
	}
	
	
	public ArrayList<Integer> checkPurchases(int key){
		System.out.println("Running check purchase query...");
		ArrayList<Integer> purchases = new ArrayList<Integer>();

		
		Connection connection;
		try {
			connection = DriverManager.getConnection("jdbc:mysql://sis-teach-01.sis.pitt.edu:3306/alg209is1017","alg209is1017","alg209@pitt.edu");
		
			PreparedStatement pst = null;
			String sql = "SELECT * FROM UserPurchases WHERE fk_userID = ?";
			try {
				pst = (PreparedStatement) connection.prepareStatement(sql);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			pst.setInt(1,key);
			
			//asbb
			System.out.println(pst);
			ResultSet rs = pst.executeQuery();
			
			
			int i = 0;
			while (rs.next()) {
				System.out.println("In check purchase while loop");
				purchases.add(rs.getInt("fk_themeID"));
				i++;
			    // Get data from the current row and use itas
			}
			System.out.println("Above");
			System.out.println(purchases);
			System.out.println("Below");
			if (purchases.isEmpty()) {
			    System.out.println("No purchases found");
			}
			//System.out.println("Num of rows: " + count);
			//System.out.println(sql);a
				//Query insertTest = em.createQuery("");
				//System.out.println("Below the creation of query...");
				//System.out.println(insertTest);
				
		
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		//gds
		
		return (purchases);
	
	}	
}


	
