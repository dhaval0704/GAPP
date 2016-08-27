package gapp.model;
import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class User implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue
    @Column(name="user_id")
    private Integer userId;
   
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Column(name="user_last_name")
    private String userlastName;
	
	@Column(name="user_first_name")
    private String userfirstName;
	
	@Column(name="email")
    private String email;
	
	@Column(name="password")
    private String password;
	
	@Column(name="user_type")
    private String userType;

	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getUserId() {
		return userId;
	}

	public User() {
		super();
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserlastName() {
		return userlastName;
	}

	public void setUserlastName(String userlastName) {
		this.userlastName = userlastName;
	}

	public String getUserfirstName() {
		return userfirstName;
	}

	public void setUserfirstName(String userfirstName) {
		this.userfirstName = userfirstName;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
    
    

}
