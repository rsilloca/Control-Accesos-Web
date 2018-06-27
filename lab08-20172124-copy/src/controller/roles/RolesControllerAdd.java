package controller.roles;

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

import controller.PMF.PMF;
import model.entity.Access;
import model.entity.Resource;
import model.entity.Role;
import model.entity.User;

public class RolesControllerAdd extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		com.google.appengine.api.users.User userG = UserServiceFactory.getUserService().getCurrentUser();
		if (userG == null){
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Information/deniedLogin.jsp");
			dispatcher.forward(request, response);
		} else {
			PersistenceManager persistenceManager = PMF.get().getPersistenceManager();
			String queryG =  "select from "+User.class.getName()+ " where email == '"+ userG.getEmail() +"' && status == true";
			List<User> userSearch = (List<User>) persistenceManager.newQuery(queryG).execute();
			if (userSearch.isEmpty()) {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Information/deniedForbidden.jsp");
				dispatcher.forward(request, response);
			} else {
				String queryR = "select from "+Resource.class.getName()+ " where url == '"+ request.getServletPath() +"' && status == true";
				List<Resource> resourceSearch = (List<Resource>) persistenceManager.newQuery(queryR).execute();
				if (resourceSearch.isEmpty()) {
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Information/deniedBlockedPage.jsp");
					dispatcher.forward(request, response);
				} else {
					String queryA = "select from "+Access.class.getName()+ " where idRole == "+ 
							userSearch.get(0).getIdRole() +" && idUrl == "+ resourceSearch.get(0).getId() +" && status == true";
					List<Access> accessSearch = (List<Access>) persistenceManager.newQuery(queryA).execute();
					if (accessSearch.isEmpty()){
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Information/deniedAccess.jsp");
						dispatcher.forward(request, response);
					} else {
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Roles/add.jsp");
						dispatcher.forward(request, response);
					}
				}
			}
		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

		PersistenceManager persistenceManager = PMF.get().getPersistenceManager();
		String query = "select from "+Role.class.getName()+ " where name == '" + request.getParameter("name") +"'";
		List<Role> Role = (List<Role>) persistenceManager.newQuery(query).execute();
		
		if (Role.isEmpty()) {
			String name = request.getParameter("name");
			Date now = LocalDateTime.now(DateTimeZone.forID("America/Lima")).toDate();
			Role newRole = new Role(name, now);
			try {
				persistenceManager.makePersistent(newRole);
			}catch(Exception e) {
				response.sendRedirect("/index.html");
			}
			finally {
				persistenceManager.close();
			}
			response.sendRedirect("/roles");
		} else {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Information/DuplicateElement.jsp");
			dispatcher.forward(request, response);
		}
		

	}
	
}
