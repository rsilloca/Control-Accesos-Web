package controller.messages;

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
import model.entity.Message;
import model.entity.Resource;
import model.entity.User;

public class MessagesControllerAdd extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
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
						String queryUsers = "select from "+User.class.getName()+ " where email != ''";
						List<User> users = (List<User>) persistenceManager.newQuery(queryUsers).execute();
						request.setAttribute("users", users);
						request.setAttribute("user", userSearch.get(0));
						
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Messages/add.jsp");
						dispatcher.forward(request, response);

					}
				}
			}
		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

		Long idUser = Long.parseLong(request.getParameter("idUser"));
		Long idReceiver = Long.parseLong(request.getParameter("idReceiver"));
		String affair = request.getParameter("affair");
		String message = request.getParameter("message");
		PersistenceManager persistenceManager = PMF.get().getPersistenceManager();
		Date now = LocalDateTime.now(DateTimeZone.forID("America/Lima")).toDate();
		Message newMessage = new Message(idUser, idReceiver, affair, message  , now);
		try {
			persistenceManager.makePersistent(newMessage);
		}catch(Exception e) {
			response.sendRedirect("/index.html");
		}
		finally {
			persistenceManager.close();
		}
		response.sendRedirect("/messages");
		
	}

}
