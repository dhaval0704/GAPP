package gapp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.User;
import gapp.model.dao.UserDao;

@Repository
public class UserDaoImpl implements UserDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public User getUser(Integer id) {
		return entityManager.find(User.class, id);
	}

	@Override
	public List<User> getUsers() {
		return entityManager.createQuery("from User", User.class)
				.getResultList();
	}

	@Override
	@Transactional
	public User saveUser(User user) {
		return entityManager.merge(user);
	}

	@Override
	public List<User> getUserByRoleType(String roleType) {
		// TODO Auto-generated method stub
		return entityManager
				.createQuery("from User where userType= :userType ", User.class)
				.setParameter("userType", roleType).getResultList();
	}

	@Override
	public User login(User user) {
		// TODO Auto-generated method stub


		Query q1 = entityManager
				.createQuery(
						"from User where email= :email and password= :password ",
						User.class).setParameter("email", user.getEmail())
				.setParameter("password", user.getPassword());

		if (q1.getResultList().size() == 0) {
			return null;
		} else {
			return (User) q1.getSingleResult();
		}

	}

}
