package gapp.model.dao.jpa;

import gapp.model.DisplayStatus;
import gapp.model.dao.DisplayStatusDao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

@Repository
public class DisplayStatusDaoImpl implements DisplayStatusDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<DisplayStatus> getStatusList()
	{
		 return entityManager.createQuery( "from DisplayStatus",DisplayStatus.class).getResultList();		
	}
}
