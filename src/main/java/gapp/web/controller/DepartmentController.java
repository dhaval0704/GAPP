package gapp.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import gapp.model.AdditionalField;
import gapp.model.Department;
import gapp.model.Program;
import gapp.model.ProgramCount;
import gapp.model.User;
import gapp.model.dao.DepartmentDao;
import gapp.model.dao.ProgramDao;
import gapp.model.dao.AdditionalFieldDao;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@Controller
@SessionAttributes("department")
public class DepartmentController {

	@Autowired
	DepartmentDao deptDao;

	@Autowired
	ProgramDao prgDao;

	@Autowired
	AdditionalFieldDao additionalDao;

	@RequestMapping(value = "/user/admin/managedepartments.html", method = RequestMethod.GET)
	public String managedepartments(ModelMap models) {

		List<ProgramCount> lstprgcount = new ArrayList<ProgramCount>();
		List<Object[]> prgCount = prgDao.getProgramsCountByDepartment();
		for (Object[] p : prgCount) {
			lstprgcount.add(new ProgramCount(Integer.parseInt(p[0].toString()),
					Integer.parseInt(p[1].toString())));
		}
		models.put("departments", deptDao.getDepartments());

		models.put("prgcountbydepartment", lstprgcount);
		return "user/admin/managedepartments";
	}

	@RequestMapping(value = "/user/admin/addnewdepartment.html", method = RequestMethod.GET)
	public String addnewdepartment(ModelMap models) {

		models.put("department", new Department());
		models.put("departments", deptDao.getDepartments());
		models.put("program", new Program());
		models.put("additionalfield", new AdditionalField());
		return "user/admin/addnewdepartment";
	}

	@RequestMapping(value = "/user/admin/addnewdepartment.html", method = RequestMethod.POST)
	public String adddepartment(@ModelAttribute Department department,
			BindingResult bindingResult) {
		deptDao.saveDepartment(department);
		return "redirect:/user/admin/managedepartments.html";
	}

	@RequestMapping(value = "/user/admin/addnewprogram.html", method = RequestMethod.POST)
	public String addnewprogram(@ModelAttribute Program program,
			BindingResult bindingResult1, HttpServletRequest req) {
		Department dep = new Department();
		dep.setDepartmentId(Integer.parseInt(req.getParameter("ddldepartment")));
		program.setDept(dep);
		program.setDeleted(false);
		prgDao.saveProgram(program);
		return "redirect:/user/admin/managedepartments.html";
	}

	@RequestMapping(value = "/user/admin/editprogram.html", method = RequestMethod.POST)
	public String addprogram(@ModelAttribute Program program,
			BindingResult bindingResult1, HttpServletRequest req,
			SessionStatus sessionStatus) {
		Department dep = deptDao.getDepartmentById(Integer.parseInt(req
				.getParameter("ddldepartment")));
		System.out.println("test" + dep.getDepartmentName());
		program.setProgramName(req.getParameter("programName"));
		program.setDept(dep);
		program.setDeleted(false);
		prgDao.saveProgram(program);
		sessionStatus.setComplete();
		return "redirect:/user/admin/editprogram.html?id="
				+ req.getParameter("ddldepartment");
	}

	@RequestMapping(value = "/user/admin/addnewprogram.html", method = RequestMethod.GET)
	public String addnewprogram(ModelMap models) {
		models.put("departments", deptDao.getDepartments());
		models.put("program", new Program());
		return "user/admin/addnewprogram";
	}

	@RequestMapping(value = "/user/admin/addnewadditionaldetail.html", method = RequestMethod.POST)
	public String addnewadditionaldetail(
			@ModelAttribute AdditionalField addfield,
			BindingResult bindingResult1, HttpServletRequest req) {
		Department dep = new Department();
		dep.setDepartmentId(Integer.parseInt(req.getParameter("ddldepartment")));
		addfield.setDept(dep);
		if (req.getParameter("ddlRequired").equals("Mandatory")) {
			addfield.setRequired(true);
		} else {
			addfield.setRequired(false);
		}
		addfield.setFieldType(req.getParameter("ddlTypeName"));
		addfield.setDeleted(false);
		additionalDao.savefield(addfield);
		return "redirect:/user/admin/managedepartments.html";
	}

	@RequestMapping(value = "/user/admin/editadditionaldetail.html", method = RequestMethod.POST)
	public String addadditionaldetail(@ModelAttribute AdditionalField addfield,
			BindingResult bindingResult, HttpServletRequest req) {

		
		addfield.setDept(deptDao.getDepartmentById(Integer.parseInt(req
				.getParameter("ddldepartment"))));
		addfield.setFieldName(req.getParameter("fieldName"));
		addfield.setFieldType(req.getParameter("ddlTypeName"));

		if (req.getParameter("ddlRequired").equals("Mandatory")) {
			addfield.setRequired(true);
		} else {
			addfield.setRequired(false);
		}

		addfield.setDeleted(false);
		additionalDao.savefield(addfield);
		return "redirect:/user/admin/editadditionaldetail.html?id="
				+ req.getParameter("ddldepartment");
	}

	@RequestMapping(value = "/user/admin/editadditionaldetail.html", method = RequestMethod.GET)
	public String editadditionaldetail(@RequestParam Integer id, ModelMap models) {
		models.put("department", deptDao.getDepartmentById(id));
		models.put("reqlist",
				additionalDao.getAdditionalFieldsByDepartmentId(id));
		return "user/admin/editadditionaldetail";
	}

	@RequestMapping(value = "/user/admin/addnewadditionaldetail.html", method = RequestMethod.GET)
	public String addnewadditionaldetail(ModelMap models) {
		models.put("departments", deptDao.getDepartments());
		models.put("additionalfield", new AdditionalField());
		return "user/admin/addnewadditionaldetail";
	}

	@RequestMapping(value = "/user/admin/viewdetails.html")
	public String viewdetails(@RequestParam Integer id, ModelMap models) {
		models.put("departmentdetails", deptDao.getDepartmentById(id));
		models.put("programdetails", prgDao.getProgramById(id));
		models.put("additionaldetails",
				additionalDao.getAdditionalFieldsByDepartmentId(id));
		return "user/admin/viewdetails";
	}

	@RequestMapping(value = "/user/admin/editdepartment.html", method = RequestMethod.GET)
	public String editdepartment(@RequestParam Integer id, ModelMap models) {
		models.put("department", deptDao.getDepartmentById(id));
		return "user/admin/editdepartment";
	}

	@RequestMapping(value = "/user/admin/editdepartment.html", method = RequestMethod.POST)
	public String editdepartment(@ModelAttribute Department department,
			SessionStatus sessionStatus) {

		deptDao.saveDepartment(department);
		sessionStatus.setComplete();
		return "redirect:/user/admin/managedepartments.html";
	}

	@RequestMapping(value = "/user/admin/editprogram.html", method = RequestMethod.GET)
	public String editprogram(@RequestParam Integer id, ModelMap models) {
		models.put("department", deptDao.getDepartmentById(id));
		models.put("programlist", prgDao.getProgramListByDeptId(id));
		return "user/admin/editprogram";
	}

	@RequestMapping(value = "/user/admin/removeprogram.html", method = RequestMethod.GET)
	public String removeprogram(@ModelAttribute Program program,
			BindingResult bindingResult, @RequestParam Integer id,
			@RequestParam Integer deptId) {
		prgDao.removeProgram(prgDao.getProgramByPrgId(id));
		return "redirect:/user/admin/editprogram.html?id=" + deptId;
	}

	@RequestMapping(value = "/user/admin/removeadditionaldetail.html", method = RequestMethod.GET)
	public String removeadditionaldetail(
			@ModelAttribute AdditionalField additionalfield,
			BindingResult bindingResult, @RequestParam Integer id,
			@RequestParam Integer deptId) {

		additionalDao.removeAdditionalField(additionalDao
				.getadditionalfieldById(id));
		return "redirect:/user/admin/editadditionaldetail.html?id=" + deptId;
	}

}
