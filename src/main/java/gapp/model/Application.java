package gapp.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "applications")
public class Application implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "application_id")
	private Integer applicationId;

	@Column(name = "first_name")
	private String firstName;

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	@Column(name = "last_name")
	private String lastName;

	@Column(name = "current_application_status")
	private String currentApplicationStatus;

	@Column(name = "term")
	private String term;

	@Column(name = "cin")
	private String cin;

	@Column(name = "phone_number")
	private String phoneNumber;
	
	@Column(name = "email")
	private String email;


	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "gender")
	private String gender;

	@Column(name = "date_of_birth")
	private Date dateOfBirth;

	@Column(name = "submitted_datetime")
	private Date submittedDateTime;

	
	@Column(name = "citizenship")
	private String citizenship;

	public Date getSubmittedDateTime() {
		return submittedDateTime;
	}

	public void setSubmittedDateTime(Date submittedDateTime) {
		this.submittedDateTime = submittedDateTime;
	}

	@Column(name = "is_international_student")
	private String isInternationalStudent;

	@ManyToOne
	private User user;
	
	@OneToMany(mappedBy = "app")
	private List<CollegeDegree> clgDegrees;

	public String getCurrentApplicationStatus() {
		return currentApplicationStatus;
	}

	public void setCurrentApplicationStatus(String currentApplicationStatus) {
		this.currentApplicationStatus = currentApplicationStatus;
	}

	@OneToOne
	private Program prg;

	public Integer getApplicationId() {
		return applicationId;
	}

	public void setApplicationId(Integer applicationId) {
		this.applicationId = applicationId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

		public String getCin() {
		return cin;
	}

	public void setCin(String cin) {
		this.cin = cin;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public List<CollegeDegree> getClgDegrees() {
		return clgDegrees;
	}

	public void setClgDegrees(List<CollegeDegree> clgDegrees) {
		this.clgDegrees = clgDegrees;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getCitizenship() {
		return citizenship;
	}

	public void setCitizenship(String citizenship) {
		this.citizenship = citizenship;
	}

	
	public String getIsInternationalStudent() {
		return isInternationalStudent;
	}

	public void setIsInternationalStudent(String isInternationalStudent) {
		this.isInternationalStudent = isInternationalStudent;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Program getPrg() {
		return prg;
	}

	public void setPrg(Program prg) {
		this.prg = prg;
	}

	
	@Column(name = "toefl_score")
	private Integer toeflScore;

	public Integer getToeflScore() {
		return toeflScore;
	}

	public void setToeflScore(Integer toeflScore) {
		this.toeflScore = toeflScore;
	}

	public double getGpa() {
		return gpa;
	}

	public void setGpa(double gpa) {
		this.gpa = gpa;
	}

	public String getTranscript() {
		return transcript;
	}

	public void setTranscript(String transcript) {
		this.transcript = transcript;
	}

	@Column(name = "gpa")
	private double gpa;

	@Column(name = "transcript")
	private String transcript;

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

}
