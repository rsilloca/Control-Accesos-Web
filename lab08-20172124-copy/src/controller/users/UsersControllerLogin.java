package controller.users;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import model.entity.*;

import controller.PMF.PMF;

@SuppressWarnings("serial")
public class UsersControllerLogin extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		UserService us = UserServiceFactory.getUserService();
		com.google.appengine.api.users.User user = us.getCurrentUser();
		if (user == null) {
			response.sendRedirect(us.createLoginURL("/users/login"));
		} else {
			PersistenceManager persistenceManager = PMF.get().getPersistenceManager();
			String query = "select from "+model.entity.User.class.getName()+ " where email == '" + user.getEmail() + "'";
			List<model.entity.User> users = (List<model.entity.User>) persistenceManager.newQuery(query).execute();
			if(users.isEmpty()){
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Information/NotFoundAccount.jsp");
				dispatcher.forward(request, response);
			} else {
			request.setAttribute("user", user);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Users/login.jsp");
			dispatcher.forward(request, response);
			}
		}
		
	}
	
}
