package gapp.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "additional_field_entries")
public class AdditionalFieldEntry implements Serializable {

	/**
	 * Created class for the records of Additional Field
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "additional_field_entry_id")
	private Integer additionalFieldEntryId;

	@Column(name = "additional_field_value")
	private String additionalFieldValue;
	
	@Column(name = "additional_field_name")
	private String additionalFieldName;

	@Column(name = "additional_field_type")
	private String additionalFieldType;

	@ManyToOne
	@JsonBackReference
	private Application app;

	public Application getApp() {
		return app;
	}

	public String getAdditionalFieldName() {
		return additionalFieldName;
	}

	public void setAdditionalFieldName(String additionalFieldName) {
		this.additionalFieldName = additionalFieldName;
	}

	public String getAdditionalFieldType() {
		return additionalFieldType;
	}

	public void setAdditionalFieldType(String additionalFieldType) {
		this.additionalFieldType = additionalFieldType;
	}

	public void setApp(Application app) {
		this.app = app;
	}

	public Integer getAdditionalFieldEntryId() {
		return additionalFieldEntryId;
	}

	public void setAdditionalFieldEntryId(Integer additionalFieldEntryId) {
		this.additionalFieldEntryId = additionalFieldEntryId;
	}

	public String getAdditionalFieldValue() {
		return additionalFieldValue;
	}

	public void setAdditionalFieldValue(String additionalFieldValue) {
		this.additionalFieldValue = additionalFieldValue;
	}

	
	public AdditionalField getAddField() {
		return addField;
	}

	public void setAddField(AdditionalField addField) {
		this.addField = addField;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@ManyToOne
	@JsonBackReference
	private AdditionalField addField;

}
