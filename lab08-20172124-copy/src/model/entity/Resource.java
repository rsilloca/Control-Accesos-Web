package model.entity;

import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable(identityType = IdentityType.APPLICATION)

public class Resource {

	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY) private Long id;
	@Persistent private String url;
	@Persistent private boolean status;
	@Persistent private Date created;
	@Persistent private String editions;
	
	public Resource(String url, Date created){
		this.url = url;
		this.status = true;
		this.created = created;
		this.editions = "";
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getUrl() {
		return url;
	}
	public void updateUrl(String url) {
		this.url = url;
	}
	
	public boolean isStatus() {
		return status;
	}
	public void updateStatus(boolean status) {
		this.status = status;
	}
	
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	
	public void newEdition(Date edition){
		this.editions = editions +"<br>Editado: " + edition.toString();
	}
	
	public String getEditions(){
		if(editions.equals("")){
			return "No hay ediciones";
		}
		return editions;
	}

}
