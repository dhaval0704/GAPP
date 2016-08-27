package gapp.model.dao;

import java.util.List;

import gapp.model.AdditionalField;


public interface AdditionalFieldDao {
	
	List<AdditionalField> getAdditionalFields();
	
	List<AdditionalField> getAdditionalFieldsByDepartmentName(String DeptName);
	
	List<AdditionalField> getAdditionalFieldsByDepartmentId(Integer id);

	AdditionalField savefield(AdditionalField addfield);

	List<AdditionalField> getReqListByDeptId(Integer id);

	void removeAdditionalField(AdditionalField additionalfield);
	
	AdditionalField getadditionalfieldById(Integer id);

}
