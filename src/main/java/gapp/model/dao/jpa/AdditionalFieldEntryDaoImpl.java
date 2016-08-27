package gapp.model.dao.jpa;

import java.util.List;

import gapp.model.AdditionalField;
import gapp.model.AdditionalFieldEntry;
import gapp.model.CollegeDegree;
import gapp.model.dao.AdditionalFieldEntryDao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class AdditionalFieldEntryDaoImpl implements AdditionalFieldEntryDao {

	@PersistenceContext
	private EntityManager entityManager;

	
	@Transactional
	@Override
	public AdditionalFieldEntry saveFieldEntry(AdditionalFieldEntry addfield) {
		// TODO Auto-generated method stub
		return entityManager.merge(addfield);
	}

	@Override
	public List<AdditionalFieldEntry> getAdditionalFieldValuesByAppId(Integer id) {
		// To get all additional fields
		return entityManager.createQuery( "from AdditionalFieldEntry where app.applicationId= :id",AdditionalFieldEntry.class).setParameter("id",id ).getResultList();
	}
	
	@Override
	@Transactional
	public void removeAdditionalFieldEntry(AdditionalFieldEntry c) {
		 entityManager.remove(c);
	}

}
