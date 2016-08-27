package gapp.model.dao.jpa;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import gapp.model.ApplicationStatus;
import gapp.model.dao.ApplicationStatusDao;

@Repository
public class ApplicationStatusDaoImpl implements ApplicationStatusDao{

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<ApplicationStatus> getAllApplicationStatuses() {
		// TODO Auto-generated method stub
		 return entityManager
				.createQuery(
						"from ApplicationStatus",
						ApplicationStatus.class).getResultList();	
		 }

	@Override
	public List<ApplicationStatus> getApplicationStatusByStudentEmail(String email) {
		// TODO Auto-generated method stub
		return entityManager.createQuery( "from ApplicationStatus where app.stu.user.email= :email ",ApplicationStatus.class).setParameter("email",email ).getResultList();
	}

}
