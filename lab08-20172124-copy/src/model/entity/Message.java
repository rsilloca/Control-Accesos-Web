package model.entity;

import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable(identityType = IdentityType.APPLICATION)

public class Message {

	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY) private Long id;
	@Persistent private Long idUser;
	@Persistent private Long idReceiver;
	@Persistent private String affair;
	@Persistent private String message;
	@Persistent private Date created;
	@Persistent private boolean status;
	@Persistent private String editions;
	
	public Message(Long idUser, Long idReceiver, String affair, String message, Date created){
		this.idUser = idUser;
		this.idReceiver = idReceiver;
		this.affair = affair;
		this.message = message;
		this.created = created;
		this.status = true;
		this.editions = "";
	}

	public Long getId() {
		return id;
	}

	public Long getIdUser() {
		return idUser;
	}

	public void setIdUser(Long idUser) {
		this.idUser = idUser;
	}

	public Long getIdReceiver() {
		return idReceiver;
	}

	public void setIdReceiver(Long idReceiver) {
		this.idReceiver = idReceiver;
	}

	public String getAffair() {
		return affair;
	}

	public void updateAffair(String affair) {
		this.affair = affair;
	}

	public String getMessage() {
		return message;
	}

	public void updateMessage(String message) {
		this.message = message;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public boolean isStatus() {
		return status;
	}

	public void updateStatus(boolean status) {
		this.status = status;
	}

	public String getEditions(){
		if(editions.equals("")){
			return "No hay ediciones";
		}
		return editions;
	}

	public void newEdition(Date edition) {
		this.editions = editions +"<br>Editado: " + edition.toString();
	}
	
}
