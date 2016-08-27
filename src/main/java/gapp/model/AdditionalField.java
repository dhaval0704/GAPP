package gapp.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Required;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "additional_fields")
public class AdditionalField implements Serializable {

	/**
	 * Created Class for Additional Fields
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "additional_field_id")
	private Integer additionalFieldId;

	@Column(name = "field_name")
	@JsonManagedReference 
	private String fieldName;

	@Column(name = "field_type")
	@JsonManagedReference 
	private String fieldType;

	private boolean isDeleted;

	public boolean isDeleted() {
		return isDeleted;
	}

	public void setDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	@Column(name = "field_isrequired")
	private boolean isRequired;

	@ManyToOne
	@JsonManagedReference
	private Department dept;

	@ManyToOne
	@JsonManagedReference
	private User user;

	public Integer getAdditionalFieldId() {
		return additionalFieldId;
	}

	public void setAdditionalFieldId(Integer additionalFieldId) {
		this.additionalFieldId = additionalFieldId;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getFieldType() {
		return fieldType;
	}

	public void setFieldType(String fieldType) {
		this.fieldType = fieldType;
	}

	public boolean isRequired() {
		return isRequired;
	}

	public void setRequired(boolean isRequired) {
		this.isRequired = isRequired;
	}

	public Department getDept() {
		return dept;
	}

	public void setDept(Department dept) {
		this.dept = dept;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
