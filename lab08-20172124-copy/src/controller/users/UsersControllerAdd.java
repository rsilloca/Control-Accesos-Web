package controller.users;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.UserServiceFactory;
import com.google.appengine.repackaged.org.joda.time.DateTimeZone;
import com.google.appengine.repackaged.org.joda.time.LocalDateTime;

import model.entity.*;
import controller.PMF.*;

public class UsersControllerAdd extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

		PersistenceManager persistenceManager = PMF.get().getPersistenceManager();
		String query = "select from "+Role.class.getName()+ " where name != ''";
		List<Role> roles = (List<Role>) persistenceManager.newQuery(query).execute();

		request.setAttribute("roles", roles);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Users/add.jsp");
		dispatcher.forward(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

		PersistenceManager persistenceManager = PMF.get().getPersistenceManager();
		String query = "select from "+User.class.getName()+ " where email == '" + request.getParameter("email") + "'";
		List<User> users = (List<User>) persistenceManager.newQuery(query).execute();

		if (users.isEmpty()) {
			String name = request.getParameter("name");
			String surname = request.getParameter("surname");
			String email = request.getParameter("email");
			String day = request.getParameter("day");
			String month = request.getParameter("month");
			String year = request.getParameter("year");
			Date birth = new Date(Integer.parseInt(year)-1900, Integer.parseInt(month)-1, Integer.parseInt(day));
			String gender = request.getParameter("gender");
			String idRol = request.getParameter("role");
			Date now = LocalDateTime.now(DateTimeZone.forID("America/Lima")).toDate();
			User newUser = new User(name, surname, email, birth, gender, now, Long.parseLong(idRol));
			try {
				persistenceManager.makePersistent(newUser);
			}catch(Exception e) {
				response.sendRedirect("/index.html");
			}
			finally {
				persistenceManager.close();
			}
			response.sendRedirect("/users");
		} else {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Information/DuplicateElement.jsp");
			dispatcher.forward(request, response);
		}

	}

}
