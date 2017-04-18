package edu.pitt.finalProject;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.Context;

/**
 * Servlet implementation class PurchaseServlet
 */
@WebServlet("/PurchaseServlet")
public class PurchaseServlet extends HttpServlet {
	@EJB
	UserFacade uf;
	
	@Context
	HttpServletRequest request;
	
	HttpServletResponse response;
	
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession(true);
		System.out.println("At the purchase servlet");
		int key = (int) session.getAttribute("key");
		System.out.println(key);
		String username = (String) session.getAttribute("user");
		System.out.println(username);
		int price = Integer.parseInt(request.getParameter("price1"));
		System.out.println(price);
		int themeID = Integer.parseInt(request.getParameter("theme1"));
		System.out.println(themeID);
		int credits = uf.creditQuery(username);
		System.out.println(credits);
		if(price>credits){
			System.out.println("In the not enough credits statement");
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("no good");
			
		} else {
			
			uf.purchaseQuery(key, price, themeID);
			int newCredits = uf.creditQuery(username);
			if(newCredits<=0){
				uf.addCredits(key);
				newCredits=10;
			}
			session.setAttribute("credits", newCredits);
			session.setAttribute("purchase"+themeID, themeID);
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("good");
			//asfd
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
