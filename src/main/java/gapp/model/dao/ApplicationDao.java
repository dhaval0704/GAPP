package gapp.model.dao;

import gapp.model.Application;

import java.util.List;

public interface ApplicationDao {
	
	/* Implemented Application Dao to get information about application */
	List<Application> getApplications();
	
	List<Application> getApplication(String department, String term);
	
	List<Application> getApplicationByStudentEmail(String email);
	
	List<Application> getApplicationByStudentId(Integer id);
	
	Application getApplicationDetailByAppId(Integer id);
	
	Application saveApplication(Application app);
	
	Application getApplicationByApplicationId(Integer id);
}
