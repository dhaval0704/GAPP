package gapp.model.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
import org.testng.annotations.Test;

@Test(groups="ApplicationDaoTest")
@ContextConfiguration(locations="classpath:applicationContext.xml")
public class DepartmentDaoTest extends AbstractTransactionalTestNGSpringContextTests{

	@Autowired
	DepartmentDao departmentDao;
	
	@Test
	public void getDepartments()
	{
		assert departmentDao.getDepartments().size()==2;
	}
	
	
}
