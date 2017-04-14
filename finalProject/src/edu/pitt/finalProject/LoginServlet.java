package edu.pitt.finalProject;

import java.io.IOException;
import java.io.PrintWriter;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.Context;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	
	
	@EJB
	UserFacade uf;
	
	@Context
	HttpServletRequest request;
	
	HttpServletResponse response;
	
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//Request= response;
		/*
		response.setContentType("text/html");
		//PrintWriter out = 
		UserEntity user = uf.checkCredentials("username","password");
		response.getWriter().append("Served at: ").append(request.getContextPath());
		*/
		
		System.out.println("here");
		
		 response.setContentType("text/html");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		int rows = uf.signInQuery(username, password);
		
		PrintWriter writer = response.getWriter();
		
		if(rows==0){
			request.setAttribute("errorMessage", "Invalid login");
			request.getRequestDispatcher("/javaFinalLogin.jsp").forward(request, response);
			/*
			String htmlRespone = "<!DOCTYPE html><html>";
	        htmlRespone += "<h2>Wrong credentials<br/></h2>";      
	        htmlRespone += "</html>";
	        
	        writer.println(htmlRespone);
	        */
		} else{
			int credits = uf.creditQuery(username);
			int key = uf.keyQuery(username);
			HttpSession session = request.getSession(true);
			session.setAttribute("user", username.toString());
			session.setAttribute("key", key);
			session.setAttribute("credits", credits);
			response.sendRedirect("javaFinalHome.jsp");
			System.out.println(session.getAttribute("user"));
			System.out.println(session.getAttribute("credits"));
			System.out.println(session.getAttribute("key"));

			/*
			String htmlRespone = "<!DOCTYPE html><html>";
	        htmlRespone += "<h2>Sign in successful.<br/></h2>";      
	        htmlRespone += "<input type='submit' value='Click me' onclick='windown.location ='javaFinalHome'/>";
	        htmlRespone += "</html>";
	        
	        writer.println(htmlRespone);
	        */
		}
		
		 
		//uf.testQuery(username);
		//System.out.println("username: " + username);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
