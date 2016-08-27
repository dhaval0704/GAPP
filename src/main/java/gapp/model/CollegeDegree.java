package gapp.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "college_degrees")
public class CollegeDegree implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	@Column(name = "college_id")
	private Integer collegeId;

	@Column(name = "college_name")
	private String collegeName;

	@Column(name = "attended_time_period")
	private String attendedTimePeriod;

	@Column(name = "degree_earned")
	private String degreeEarned;

	@Column(name = "college_field")
	private String degreeField;

	public Integer getCollegeId() {
		return collegeId;
	}

	public void setCollegeId(Integer collegeId) {
		this.collegeId = collegeId;
	}

	public String getCollegeName() {
		return collegeName;
	}

	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

	public String getAttendedTimePeriod() {
		return attendedTimePeriod;
	}

	public void setAttendedTimePeriod(String attendedTimePeriod) {
		this.attendedTimePeriod = attendedTimePeriod;
	}

	public String getDegreeEarned() {
		return degreeEarned;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public void setDegreeEarned(String degreeEarned) {
		this.degreeEarned = degreeEarned;
	}

	public Application getApp() {
		return app;
	}

	public void setApp(Application app) {
		this.app = app;
	}

	public String getDegreeField() {
		return degreeField;
	}

	public void setDegreeField(String degreeField) {
		this.degreeField = degreeField;
	}

	@ManyToOne
	private Application app;

}
