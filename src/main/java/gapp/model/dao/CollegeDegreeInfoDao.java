package gapp.model.dao;

import gapp.model.Application;
import gapp.model.CollegeDegree;

import java.util.List;

public interface CollegeDegreeInfoDao {
	
	List<CollegeDegree> getCollegeDegreeInfoByApplication(Application app);
    CollegeDegree saveCollegeDegree(CollegeDegree c);
    List<CollegeDegree> getCollegeDegreeInfoByApplicationId(Integer appId);
    void removeCollegeDegree(CollegeDegree c);
}
