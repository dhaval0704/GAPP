package gapp.model.dao;

import gapp.model.ApplicationStatus;
import java.util.List;

public interface ApplicationStatusDao {

	/* Implemented ApplicationStatus Dao to get information about application status */
	List<ApplicationStatus> getAllApplicationStatuses();

	List<ApplicationStatus> getApplicationStatusByStudentEmail(String email);
}
