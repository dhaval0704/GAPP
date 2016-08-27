package gapp.model.dao.jpa;

import java.util.ArrayList;
import java.util.List;

import gapp.model.Program;
import gapp.model.dao.ProgramDao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class ProgramDaoImpl implements ProgramDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<Program> getPrograms() {
		// TODO Auto-generated method stub
		return entityManager.createQuery("from Program where isDeleted=false",
				Program.class).getResultList();
	}

	@Override
	public List<Object[]> getProgramsCountByDepartment() {
		// TODO Auto-generated method stub

		return entityManager
				.createQuery(
						"select d.departmentId,count(p.programId) as prg from Department d left join d.programs p with p.isDeleted=false group by d.departmentId order by d.departmentId",
						Object[].class).getResultList();

	}

	@Override
	public List<Program> programByDeptName(String deptName) {
		// TODO Auto-generated method stub
		return entityManager
				.createQuery(
						"from Program where dept.departmentName= :departmentName and isDeleted=false",
						Program.class).setParameter("departmentName", deptName)
				.getResultList();

	}

	@Override
	public List<Program> getProgramById(Integer id) {
		// TODO Auto-generated method stub
		return entityManager
				.createQuery(
						"from Program where dept.departmentId= :departmentId and isDeleted=false",
						Program.class).setParameter("departmentId", id)
				.getResultList();
	}

	@Override
	public Program getProgramByPrgId(Integer id) {
		return entityManager.find(Program.class, id);

	}

	@Transactional
	@Override
	public Program saveProgram(Program program) {
		// TODO Auto-generated method stub
		return entityManager.merge(program);
	}

	@Override
	public List<Program> getProgramListByDeptId(Integer id) {
		// TODO Auto-generated method stub
		return entityManager
				.createQuery(
						"from Program where dept.departmentId= :departmentId",
						Program.class).setParameter("departmentId", id)
				.getResultList();
	}

	@Transactional
	@Override
	public void removeProgram(Program program) {
		// TODO Auto-generated method stub
		program.setDeleted(true);
		entityManager.merge(program);
	}

}
