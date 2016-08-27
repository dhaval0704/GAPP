package gapp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.Department;
import gapp.model.dao.DepartmentDao;

@Repository
public class DepartmentDaoImpl implements DepartmentDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<Department> getDepartments() {
		return entityManager.createQuery("from Department order by departmentId", Department.class)
				.getResultList();
	}

	@Override
	public Department getDepartmentById(Integer id) {
		// TODO Auto-generated method stub
		return entityManager.find(Department.class, id);
	}

	@Transactional
	@Override
	public Department saveDepartment(Department department) {
		// TODO Auto-generated method stub
		return entityManager.merge(department);
	}

}
