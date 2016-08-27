package gapp.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name = "application_status_records")
public class ApplicationStatus implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	@Column(name="application_status_id")
	private Integer applicationStatusId;
	
	@Column(name="application_status")
	private String applicationStatus;
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Column(name="changed_status_timestamp")
	private Date  changedStatusTime;
	
	@Column(name="comment")
	private String comment;
	
	@Column(name="is_current_status")
	private boolean isCurrentStatus;
	
	@ManyToOne
	private Application app;

	@OneToOne
	private User user;

	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getApplicationStatusId() {
		return applicationStatusId;
	}

	public void setApplicationStatusId(Integer applicationStatusId) {
		this.applicationStatusId = applicationStatusId;
	}

	public String getApplicationStatus() {
		return applicationStatus;
	}

	public void setApplicationStatus(String applicationStatus) {
		this.applicationStatus = applicationStatus;
	}

	public Date getChangedStatusTime() {
		return changedStatusTime;
	}

	public void setChangedStatusTime(Date changedStatusTime) {
		this.changedStatusTime = changedStatusTime;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public boolean isCurrentStatus() {
		return isCurrentStatus;
	}

	public void setCurrentStatus(boolean isCurrentStatus) {
		this.isCurrentStatus = isCurrentStatus;
	}

	public Application getApp() {
		return app;
	}

	public void setApp(Application app) {
		this.app = app;
	}
}
