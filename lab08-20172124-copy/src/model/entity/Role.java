package model.entity;
import java.util.*;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable(identityType = IdentityType.APPLICATION)

public class Role {
	
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY) private Long id;
	@Persistent private String name;
	@Persistent private Date created;
	@Persistent private boolean status;
	@Persistent private String editions;
	
	public Role(String name, Date created){
		this.name = name;
		this.created = created;
		this.status = true;
		this.editions = "";
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	public void updateName(String name) {
		this.name = name;
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
