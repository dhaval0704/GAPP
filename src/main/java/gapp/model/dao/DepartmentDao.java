package gapp.model.dao;

import java.util.List;
import gapp.model.Department;

public interface DepartmentDao {
	
	/* Implemented Department Dao to get information about departments */
	List<Department> getDepartments();
	Department getDepartmentById(Integer id);
	Department saveDepartment(Department department);
	
}
