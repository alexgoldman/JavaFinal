package edu.pitt.finalProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.mysql.jdbc.PreparedStatement;

import edu.pitt.finalProject.entity.UserEntity;

@Stateless
public class UserFacade {

	@PersistenceContext(unitName="finalProject")
	private EntityManager em;

	public UserFacade(){
		super();
	}

	//
	public UserEntity checkCredentials(String username, String password){
		Query query = em.createQuery("SELECT b FROM UserEntity b WHERE b.username=" + username + " AND b.password=" + password);
		UserEntity user = null;
		try {
			user = (UserEntity) query.getSingleResult();
		} catch(NoResultException e){
			System.out.println("User not found");
		}
		return user;
	}
	
	public int creditQuery(String username){
		System.out.println("Running credit query...");
		int credits = 0;
		Connection connection;
		try {
			connection = DriverManager.getConnection("jdbc:mysql://sis-teach-01.sis.pitt.edu:3306/alg209is1017","alg209is1017","alg209@pitt.edu");
		
			PreparedStatement pst = null;
			String sql = "SELECT credits FROM UserEntity WHERE username = ? ";
			try {
				pst = (PreparedStatement) connection.prepareStatement(sql);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			pst.setString(1,username);
			System.out.println(pst);
			ResultSet rs = pst.executeQuery();
			System.out.println("Credit query executed");
			 while (rs.next()) {
				 credits = rs.getInt("credits");
			 }
			 System.out.println(credits);
		//asdf
		
			} catch (SQLException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
		
			return credits;
	}
	
	public int keyQuery(String username){
		System.out.println("Running key query...");
		int key = 0;
		Connection connection;
		try {
			connection = DriverManager.getConnection("jdbc:mysql://sis-teach-01.sis.pitt.edu:3306/alg209is1017","alg209is1017","alg209@pitt.edu");
		
			PreparedStatement pst = null;
			String sql = "SELECT userID FROM UserEntity WHERE username = ? ";
			try {
				pst = (PreparedStatement) connection.prepareStatement(sql);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			pst.setString(1,username);
			System.out.println(pst);
			ResultSet rs = pst.executeQuery();
			System.out.println("Key query executed");
			 while (rs.next()) {
				 key = rs.getInt("userID");
			 }
			 System.out.println(key);
		//asdf
		
			} catch (SQLException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
		
			return key;
	}
	
	public void creditUpdate(int key,int credits){
		System.out.println("Running credit query...");
		
		Connection connection;
		try {
			connection = DriverManager.getConnection("jdbc:mysql://sis-teach-01.sis.pitt.edu:3306/alg209is1017","alg209is1017","alg209@pitt.edu");
		
			PreparedStatement pst = null;
			String sql = "UPDATE UserEntity SET credits=  ?  WHERE userID = ?";
			try {
				pst = (PreparedStatement) connection.prepareStatement(sql);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			pst.setInt(1,credits);
			pst.setInt(2, key);
			//dsfsdaffsadasdfsad
			pst.executeUpdate();
			//adsfdasfads
			System.out.println(pst);
			/*
			ResultSet rs = pst.executeQuery();
			System.out.println("Credit query executed");
			 while (rs.next()) {
				 credits = rs.getInt("credits");
			 }
			 System.out.println(credits);
			 */
		//asdf
		
			} catch (SQLException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
		
			
	}
	

	
	public int signInQuery(String username, String password){
		System.out.println("Running query...");
		int count = 0;
		Connection connection;
		try {
			connection = DriverManager.getConnection("jdbc:mysql://sis-teach-01.sis.pitt.edu:3306/alg209is1017","alg209is1017","alg209@pitt.edu");
		
			PreparedStatement pst = null;
			String sql = "SELECT * FROM UserEntity WHERE username = ? AND password=?";
			try {
				pst = (PreparedStatement) connection.prepareStatement(sql);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			pst.setString(1,username);
			pst.setString(2,password);
			//asbb
			System.out.println(pst);
			ResultSet rs = pst.executeQuery();
			
			

			while (rs.next()) {
			    ++count;
			    // Get data from the current row and use it
			}

			if (count == 0) {
			    System.out.println("No records found");
			}
			System.out.println("Num of rows: " + count);
			//System.out.println(sql);
				//Query insertTest = em.createQuery("");
				//System.out.println("Below the creation of query...");
				//System.out.println(insertTest);
				
		
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}

		return count;
	
	}
	
	public void testQuery(String username){
		System.out.println("Running queryer...");
		
		Connection connection;
		try {
			connection = DriverManager.getConnection("jdbc:mysql://sis-teach-01.sis.pitt.edu:3306/alg209is1017","alg209is1017","alg209@pitt.edu");
		
			PreparedStatement pst = null;
			String sql = "UPDATE UserEntity SET fname = ? WHERE userID=?";
			try {
				pst = (PreparedStatement) connection.prepareStatement(sql);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			pst.setString(1,username);
			pst.setString(2,"1");
			pst.executeUpdate();
			System.out.println(sql);
				//Query insertTest = em.createQuery("");
				System.out.println("Below the creation of query...");
				//System.out.println(insertTest);
				
		
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}


	
	}
}