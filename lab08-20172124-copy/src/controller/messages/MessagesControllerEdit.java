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

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.users.UserServiceFactory;
import com.google.appengine.repackaged.org.joda.time.DateTimeZone;
import com.google.appengine.repackaged.org.joda.time.LocalDateTime;

import controller.PMF.PMF;
import model.entity.User;
import model.entity.Access;
import model.entity.Message;
import model.entity.Resource;

public class MessagesControllerEdit extends HttpServlet {

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
						Key k =	KeyFactory.createKey(Message.class.getSimpleName(), new Long(request.getParameter("id")).longValue());
						Message m = persistenceManager.getObjectById(Message.class, k);
						request.setAttribute("message", m);
						
						Key kUser =	KeyFactory.createKey(User.class.getSimpleName(), m.getIdUser());
						User u = persistenceManager.getObjectById(User.class, kUser);
						request.setAttribute("user", u);
						
						Key kReceiver =	KeyFactory.createKey(User.class.getSimpleName(), m.getIdReceiver());
						User r = persistenceManager.getObjectById(User.class, kReceiver);
						request.setAttribute("receiver", r);
						
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/Views/Messages/edit.jsp");
						dispatcher.forward(request, response);
					}
				}
			}
		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String affair = request.getParameter("affair");
		String message = request.getParameter("message");
		String status = request.getParameter("status");
		PersistenceManager persistenceManager = PMF.get().getPersistenceManager();
		Key k =	KeyFactory.createKey(Message.class.getSimpleName(), new Long(request.getParameter("id")).longValue());
		Message m = persistenceManager.getObjectById(Message.class, k);
		boolean prueba = false;
		if(status.equalsIgnoreCase("true")){
			prueba = true;
		}
		if(m.isStatus() != prueba || !affair.equals("") || !message.equals("")){
			Date now = LocalDateTime.now(DateTimeZone.forID("America/Lima")).toDate();
			try {
				if(m.isStatus() != prueba){
					m.updateStatus(prueba);
				}
				if(!affair.equals("")){
					m.updateAffair(affair);
				}
				if(!message.equals("")){
					m.updateMessage(message);
				}
				m.newEdition(now);
			} finally {
				persistenceManager.close();
			}
		}
		response.sendRedirect("/messages/view?id="+m.getId());
		
	}
	
}
