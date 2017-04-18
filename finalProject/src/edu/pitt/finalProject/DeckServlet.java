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
 * Servlet implementation class DeckServlet
 */
@WebServlet("/DeckServlet")
public class DeckServlet extends HttpServlet {
	
	@EJB
	UserFacade uf;
	
	@Context
	HttpServletRequest request;
	
	HttpServletResponse response;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());kjas
		System.out.println("At the deck update servlet");
		String deck = request.getParameter("deck1");
		
		
		HttpSession session = request.getSession(true);
		session.setAttribute("activeDeck", deck);
		System.out.println(session.getAttribute("activeDeck"));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
