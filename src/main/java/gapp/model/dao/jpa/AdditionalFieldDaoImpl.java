package gapp.model.dao.jpa;

import gapp.model.AdditionalField;
import gapp.model.Program;
import gapp.model.dao.AdditionalFieldDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class AdditionalFieldDaoImpl implements AdditionalFieldDao{

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<AdditionalField> getAdditionalFields() {
		// To get all additional fields
		return entityManager.createQuery("from AdditionalField where isDeleted=false",AdditionalField.class).getResultList();
	}

	@Override
	public List<AdditionalField> getAdditionalFieldsByDepartmentName(
			String DeptName) {
		// To get Additional field by department name
		return entityManager.createQuery( "from AdditionalField where dept.departmentName= :departmentname and isDeleted=false",AdditionalField.class).setParameter("departmentname",DeptName ).getResultList();
	}

	@Override
	public List<AdditionalField> getAdditionalFieldsByDepartmentId(Integer id) {
		// TODO Auto-generated method stub
		return entityManager.createQuery( "from AdditionalField where dept.departmentId= :departmentId and isDeleted=false",AdditionalField.class).setParameter("departmentId",id ).getResultList();
	}
	
	@Transactional
	@Override
	public AdditionalField savefield(AdditionalField addfield) {
		// TODO Auto-generated method stub
		return entityManager.merge(addfield);
	}

	@Override
	public List<AdditionalField> getReqListByDeptId(Integer id) {
		// TODO Auto-generated method stub
		return entityManager.createQuery( "from AdditionalField where dept.departmentId= :departmentId and isDeleted=false",AdditionalField.class).setParameter("departmentId",id ).getResultList();
	}
	

	@Transactional
	@Override
	public void removeAdditionalField(AdditionalField additionalfield) {
		// TODO Auto-generated method stub
		
		additionalfield.setDeleted(true);
		entityManager.merge(additionalfield);
	}

	@Override
	public AdditionalField getadditionalfieldById(Integer id) {
		// TODO Auto-generated method stub
		return entityManager.find(AdditionalField.class, id);
	}
}