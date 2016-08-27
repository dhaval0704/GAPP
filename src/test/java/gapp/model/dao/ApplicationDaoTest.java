package gapp.model.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
import org.testng.annotations.Test;

public class ApplicationDaoTest {
	
	@Test(groups="ApplicationDaoTest")
	@ContextConfiguration(locations="classpath:applicationContext.xml")
	public class ApplicationDaoTests extends AbstractTransactionalTestNGSpringContextTests{
		
		@Autowired
		ApplicationDao applicationDao;
		
		@Test
		public void getApplication()
		{
			assert applicationDao.getApplication("Accounting Department", "Fall 2016").size()==1;
		}
		
		@Test
		public void getApplicationByStudent()
		{
			assert applicationDao.getApplicationByStudentEmail("student1@localhost.localdomain").size()==1;
		}
	}


}
