package gapp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.Application;
import gapp.model.User;
import gapp.model.dao.ApplicationDao;

@Repository
public class ApplicationDaoImpl implements ApplicationDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<Application> getApplication(String dept, String term) {
		return entityManager
				.createQuery(
						"from Application where prg.dept.departmentName= :dept and term = :term",
						Application.class).setParameter("dept", dept)
				.setParameter("term", term).getResultList();
	}

	@Override
	public List<Application> getApplications() {
		return entityManager.createQuery("from Application order by applicationId",
				Application.class).getResultList();
	}

	@Override
	public List<Application> getApplicationByStudentEmail(String email) {
		return entityManager
				.createQuery("from Application where user.email= :email",
						Application.class).setParameter("email", email)
				.getResultList();
	}

	@Override
	public List<Application> getApplicationByStudentId(Integer id) {
		System.out.println(id);
		// TODO Auto-generated method stub
		return entityManager
				.createQuery("from Application where user.userId= :userId",
						Application.class).setParameter("userId", id)
				.getResultList();
	}
	
	@Override
	public Application getApplicationByApplicationId(Integer id)
	{
		return entityManager.find(Application.class, id);
		
	}

	@Override
	public Application getApplicationDetailByAppId(Integer id) {
		// TODO Auto-generated method stub
		return entityManager.find(Application.class, id);
	}

	@Override
	@Transactional
	public Application saveApplication(Application app) {
		return entityManager.merge(app);
	}

}
