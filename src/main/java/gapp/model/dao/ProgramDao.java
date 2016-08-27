package gapp.model.dao;

import gapp.model.Program;

import java.util.List;

public interface ProgramDao {

	List<Program> getPrograms();

	List<Program> programByDeptName(String DeptName);

	List<Object[]> getProgramsCountByDepartment();
	
	List<Program> getProgramById(Integer id);
	
	Program saveProgram(Program program);

	List<Program> getProgramListByDeptId(Integer id);

	void removeProgram(Program program);
	
	Program getProgramByPrgId(Integer id);
	
	
}
