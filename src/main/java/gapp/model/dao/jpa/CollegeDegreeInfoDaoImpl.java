package gapp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.Application;
import gapp.model.CollegeDegree;
import gapp.model.dao.CollegeDegreeInfoDao;

@Repository
public class CollegeDegreeInfoDaoImpl implements CollegeDegreeInfoDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<CollegeDegree> getCollegeDegreeInfoByApplication(Application app) {
		// TODO Auto-generated method stub
		return entityManager
				.createQuery("from CollegeDegree where app.applicationId= :id",
						CollegeDegree.class).setParameter("id", app.getApplicationId())
				.getResultList();
	}

	
	@Override
	@Transactional
	public CollegeDegree saveCollegeDegree(CollegeDegree c) {
		return entityManager.merge(c);
	}

	@Override
	@Transactional
	public void removeCollegeDegree(CollegeDegree c) {
		 entityManager.remove(c);
	}

	@Override
	public List<CollegeDegree> getCollegeDegreeInfoByApplicationId(Integer appId) {
		// TODO Auto-generated method stub
		return entityManager
				.createQuery("from CollegeDegree where app.applicationId= :id",
						CollegeDegree.class).setParameter("id", appId)
				.getResultList();

	}

}
