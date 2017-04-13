package edu.pitt.finalProject;

import java.sql.*;  
  
public class LoginDao {  
public static boolean validate(String name,String pass){  
boolean status=false;  
try{  
Class.forName("oracle.jdbc.driver.OracleDriver");  
Connection con=DriverManager.getConnection(  
"jdbc:mysql://sis-teach-01.sis.pitt.edu:3306/alg209is1017","alg209is1017","alg209@pitt.edu");  
      
PreparedStatement ps=con.prepareStatement(  
"select * from UserEntity where username=? and password=?");  
ps.setString(1,name);  
ps.setString(2,pass);  
      
ResultSet rs=ps.executeQuery();  
status=rs.next();  
          
}catch(Exception e){System.out.println(e);}  
return status;  
}  
}  