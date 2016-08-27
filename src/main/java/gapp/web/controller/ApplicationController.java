package gapp.web.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gapp.model.AdditionalField;
import gapp.model.AdditionalFieldEntry;
import gapp.model.Application;
import gapp.model.CollegeDegree;
import gapp.model.Department;
import gapp.model.Program;
import gapp.model.User;
import gapp.model.dao.AdditionalFieldDao;
import gapp.model.dao.AdditionalFieldEntryDao;
import gapp.model.dao.ApplicationDao;
import gapp.model.dao.CollegeDegreeInfoDao;
import gapp.model.dao.DepartmentDao;
import gapp.model.dao.ProgramDao;
import gapp.model.dao.UserDao;
import gapp.model.MultipleFileUpload;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

@Controller
@SessionAttributes("application")
public class ApplicationController {

	private static final ObjectMapper objectMapper = new ObjectMapper();
	@Autowired
	private ApplicationDao applicationDao;

	@Autowired
	private AdditionalFieldDao additionalFieldDao;

	@Autowired
	private AdditionalFieldEntryDao additionalFieldEntryDao;

	@Autowired
	private CollegeDegreeInfoDao clgDegreeDao;

	@Autowired
	DepartmentDao deptDao;

	@Autowired
	ProgramDao prgDao;

	@Autowired
	UserDao userDao;

	@Autowired
	private WebApplicationContext context;

	List<Program> prgobj;

	@RequestMapping(value = "/user/student/studenthome.html", method = RequestMethod.GET)
	public String DisplayApplicationsByStudentId(ModelMap models,
			HttpServletRequest req) {

		Integer userId = (Integer) req.getSession().getAttribute("userId");
		models.put("applications",
				applicationDao.getApplicationByStudentId(userId));

		return "user/student/studenthome";
	}

	@RequestMapping(value = "/user/student/viewapplicationdetails.html", method = RequestMethod.GET)
	public String ViewApplicationDetails(ModelMap models,
			@RequestParam Integer id) {

		models.put("applicationdetails",
				applicationDao.getApplicationDetailByAppId(id));
		models.put("collegedegreeinfo", clgDegreeDao
				.getCollegeDegreeInfoByApplication(applicationDao
						.getApplicationDetailByAppId(id)));
		models.put(
				"additionalfield",
				additionalFieldDao.getReqListByDeptId(applicationDao
						.getApplicationDetailByAppId(id).getPrg().getDept()
						.getDepartmentId()));
		models.put("additionalfieldvalueinfo",
				additionalFieldEntryDao.getAdditionalFieldValuesByAppId(id));

		return "user/student/viewapplicationdetails";
	}

	@RequestMapping(value = "/user/student/createapplication.html", method = RequestMethod.GET)
	public String CreateNewApplication(ModelMap models) {

		models.put("application", new Application());
		models.put("departments", deptDao.getDepartments());

		return "user/student/createapplication";
	}

	@RequestMapping(value = "/user/student/getprograms.html", method = RequestMethod.GET)
	@ResponseBody
	public String getprograms(@RequestParam("deptId") int deptId,
			HttpServletResponse response) throws JsonGenerationException,
			JsonMappingException, IOException {
		List<Program> lstprg = new ArrayList<Program>();
		lstprg = prgDao.getProgramListByDeptId(deptId);
		response.setContentType("application/json");
		objectMapper.writeValue(response.getWriter(), lstprg);
		return null;
	}

	@RequestMapping(value = "/user/student/getadditionalfields.html", method = RequestMethod.GET)
	public String getadditionalfields(@RequestParam("deptId") int deptId,
			HttpServletResponse response) throws JsonGenerationException,
			JsonMappingException, IOException {
		List<AdditionalField> lstadditionalfield = new ArrayList<AdditionalField>();
		lstadditionalfield = additionalFieldDao
				.getAdditionalFieldsByDepartmentId(deptId);
		response.setContentType("application/json");
		objectMapper.writeValue(response.getWriter(), lstadditionalfield);
		return null;
	}

	@RequestMapping(value = "/user/student/getadditionalfieldvalues.html", method = RequestMethod.GET)
	@ResponseBody
	public String getadditionalfieldvalues(@RequestParam("appId") int id,
			HttpServletResponse response) throws JsonGenerationException,
			JsonMappingException, IOException {
		List<AdditionalFieldEntry> lstadditionalfieldvalues = new ArrayList<AdditionalFieldEntry>();
		lstadditionalfieldvalues = additionalFieldEntryDao
				.getAdditionalFieldValuesByAppId(id);
		System.out.println(lstadditionalfieldvalues.size());
		response.setContentType("application/json");
		ObjectMapper mapper = new ObjectMapper();
		String jsonInString = mapper.writerWithDefaultPrettyPrinter()
				.writeValueAsString(lstadditionalfieldvalues);
		// mapper.writeValue(response.getWriter(), lstadditionalfieldvalues);
		objectMapper.writeValue(response.getWriter(), lstadditionalfieldvalues);
		// jsonInString =
		// mapper.writerWithDefaultPrettyPrinter().writeValueAsString(user);
		System.out.println(jsonInString);

		return null;
	}

	@RequestMapping(value = "/user/student/createapplication.html", method = RequestMethod.POST)
	public String add(@ModelAttribute Application app,
			BindingResult bindingResult, HttpServletRequest request,
			@RequestParam("file") MultipartFile file,
			@ModelAttribute("uploadForm") MultipleFileUpload uploadForm)
			throws IllegalStateException, IOException {

		String btnName = request.getParameter("add");
		String strCollegeName1 = request.getParameter("txtCollegeName1");
		String strCollegeName2 = request.getParameter("txtCollegeName2");
		String strCollegeName3 = request.getParameter("txtCollegeName3");
		String strCollegeName4 = request.getParameter("txtCollegeName4");
		String strCollegeName5 = request.getParameter("txtCollegeName5");

		String strTimeperiodAttended1 = request
				.getParameter("txtTimeperiodAttended1");
		String strTimeperiodAttended2 = request
				.getParameter("txtTimeperiodAttended2");
		String strTimeperiodAttended3 = request
				.getParameter("txtTimeperiodAttended3");
		String strTimeperiodAttended4 = request
				.getParameter("txtTimeperiodAttended4");
		String strTimeperiodAttended5 = request
				.getParameter("txtTimeperiodAttended5");

		String strDegreeEarned1 = request.getParameter("txtDegreeEarned1");
		String strDegreeEarned2 = request.getParameter("txtDegreeEarned2");
		String strDegreeEarned3 = request.getParameter("txtDegreeEarned3");
		String strDegreeEarned4 = request.getParameter("txtDegreeEarned4");
		String strDegreeEarned5 = request.getParameter("txtDegreeEarned5");

		String strMajorField1 = request.getParameter("txtMajorField1");
		String strMajorField2 = request.getParameter("txtMajorField2");
		String strMajorField3 = request.getParameter("txtMajorField3");
		String strMajorField4 = request.getParameter("txtMajorField4");
		String strMajorField5 = request.getParameter("txtMajorField5");

		if (btnName.equals("Save")) {
			app.setCurrentApplicationStatus("Not Submitted");
		} else {
			Date currentDate = new Date();
			app.setSubmittedDateTime(currentDate);
			app.setCurrentApplicationStatus("Submitted");
		}
		String programId = request.getParameter("ddlProgram");
		Program prg = prgDao.getProgramByPrgId(Integer.parseInt(programId));
		app.setPrg(prg);
		int userId = (Integer) request.getSession().getAttribute("userId");
		
		app.setUser(userDao.getUser(userId));
		if (!file.isEmpty()) {
			Date TodayDate = new Date();
			Random rand = new Random();

			int n = rand.nextInt(111000) + 1;

			file.transferTo(new File(context.getServletContext().getRealPath(
					"/WEB-INF/files"), n + file.getOriginalFilename()));

			System.out.println(file.getOriginalFilename());
			app.setTranscript(file.getOriginalFilename());
		}

		Application returnApp = applicationDao.saveApplication(app);

		if (!(strCollegeName1 == null) && !strCollegeName1.isEmpty()) {
			CollegeDegree c = new CollegeDegree();

			c.setCollegeName(strCollegeName1);
			c.setAttendedTimePeriod(strTimeperiodAttended1);
			c.setDegreeEarned(strDegreeEarned1);
			c.setDegreeField(strMajorField1);
			c.setApp(returnApp);
			clgDegreeDao.saveCollegeDegree(c);
		}
		if (!(strCollegeName2 == null) && !strCollegeName2.isEmpty()) {
			CollegeDegree c = new CollegeDegree();

			c.setCollegeName(strCollegeName2);
			c.setAttendedTimePeriod(strTimeperiodAttended2);
			c.setDegreeEarned(strDegreeEarned2);
			c.setDegreeField(strMajorField2);
			c.setApp(returnApp);
			clgDegreeDao.saveCollegeDegree(c);
		}

		if (!(strCollegeName3 == null) && !strCollegeName3.isEmpty()) {
			CollegeDegree c = new CollegeDegree();

			c.setCollegeName(strCollegeName3);
			c.setAttendedTimePeriod(strTimeperiodAttended3);
			c.setDegreeEarned(strDegreeEarned3);
			c.setDegreeField(strMajorField3);
			c.setApp(returnApp);
			clgDegreeDao.saveCollegeDegree(c);
		}
		if (!(strCollegeName4 == null) && !strCollegeName4.isEmpty()) {
			CollegeDegree c = new CollegeDegree();

			c.setCollegeName(strCollegeName4);
			c.setAttendedTimePeriod(strTimeperiodAttended4);
			c.setDegreeEarned(strDegreeEarned4);
			c.setDegreeField(strMajorField4);
			c.setApp(returnApp);
			clgDegreeDao.saveCollegeDegree(c);
		}

		if (!(strCollegeName5 == null) && !strCollegeName5.isEmpty()) {
			CollegeDegree c = new CollegeDegree();

			c.setCollegeName(strCollegeName5);
			c.setAttendedTimePeriod(strTimeperiodAttended5);
			c.setDegreeEarned(strDegreeEarned5);
			c.setDegreeField(strMajorField5);
			c.setApp(returnApp);
			clgDegreeDao.saveCollegeDegree(c);
		}
		List<String> fileNames = new ArrayList<String>();
		String deptId = request.getParameter("ddldepartment");
		List<AdditionalField> additionalField = additionalFieldDao
				.getAdditionalFieldsByDepartmentId(Integer.parseInt(deptId));
		int counter = 0;
		int filecountervalue = 0;
		for (AdditionalField e : additionalField) {

			String fieldType = e.getFieldType();
			System.out.println(fieldType);
			if (fieldType.equals("NUMBER") || fieldType.equals("TEXT")) {
				String additionalfieldvalue = request.getParameter("textbox"
						+ counter);

				AdditionalFieldEntry entry = new AdditionalFieldEntry();
				entry.setAdditionalFieldValue(additionalfieldvalue);
				entry.setApp(returnApp);
				entry.setAddField(e);
				entry.setAdditionalFieldName(e.getFieldName());
				entry.setAdditionalFieldType(fieldType);
				additionalFieldEntryDao.saveFieldEntry(entry);

				counter++;

			} else if (fieldType.equals("FILE")) {

				filecountervalue++;
			}
		}
		if (filecountervalue > 0) {

			List<MultipartFile> crunchifyFiles = uploadForm.getFiles();

			

			if (null != crunchifyFiles && crunchifyFiles.size() > 0) {
				for (MultipartFile multipartFile : crunchifyFiles) {

					Date TodayDate = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
					String date = sdf.format(TodayDate);
					Random rand = new Random();

					int n = rand.nextInt(111000) + 1;
					String fileName = n + multipartFile.getOriginalFilename();
					if (!"".equalsIgnoreCase(fileName)) {
						// Handle file content -
						// multipartFile.getInputStream()
						multipartFile.transferTo(new File(context
								.getServletContext().getRealPath(
										"/WEB-INF/files/"), fileName));

						fileNames.add(fileName);
						System.out.println(fileName);
					}
				}
			}
		}
		int mcount=0;
		for (AdditionalField e : additionalField) {

			String fieldType = e.getFieldType();
			System.out.println(fieldType);
			if (fieldType.equals("FILE")) {
				AdditionalFieldEntry entry = new AdditionalFieldEntry();
				entry.setAdditionalFieldValue(fileNames.get(mcount));
				entry.setApp(returnApp);
			    entry.setAddField(e);
				entry.setAdditionalFieldName(e.getFieldName());
				entry.setAdditionalFieldType("FILE");
				additionalFieldEntryDao.saveFieldEntry(entry);
				mcount++;
			}
		}

		return "redirect:/user/student/studenthome.html";
	}

	@RequestMapping(value = "/user/student/editapplication.html", method = RequestMethod.GET)
	public String editapplication(@RequestParam Integer id, ModelMap models) {

		Application app = applicationDao.getApplicationByApplicationId(id);

		Program prg = app.getPrg();
		Department selectedDept = prg.getDept();
		models.put("selectedProgram", prg);
		models.put("Programs", selectedDept.getPrograms());
		models.put("selectedDepartment", selectedDept);
		models.put("clgdegrees",
				clgDegreeDao.getCollegeDegreeInfoByApplicationId(id));
		models.put("additionalfieldentries",
				additionalFieldEntryDao.getAdditionalFieldValuesByAppId(id));

		models.put("application",
				applicationDao.getApplicationByApplicationId(id));
		return "user/student/editapplication";
	}

	@RequestMapping(value = "/user/student/editapplication.html", method = RequestMethod.POST)
	public String editapplication(@ModelAttribute Application app,
			BindingResult bindingResult, HttpServletRequest request,
			SessionStatus sessionStatus,
			@RequestParam("file") MultipartFile file)
			throws IllegalStateException, IOException {

		Application objPreApp = applicationDao
				.getApplicationByApplicationId(app.getApplicationId());
		String btnName = request.getParameter("add");
		List<CollegeDegree> lstclgdegree = objPreApp.getClgDegrees();

		for (CollegeDegree e : lstclgdegree) {

			clgDegreeDao.removeCollegeDegree(e);
		}

		List<AdditionalFieldEntry> lstadditional = additionalFieldEntryDao
				.getAdditionalFieldValuesByAppId(objPreApp.getApplicationId());

		for (AdditionalFieldEntry e : lstadditional) {

			additionalFieldEntryDao.removeAdditionalFieldEntry(e);
		}

		String strCollegeName1 = request.getParameter("txtCollegeName1");
		String strCollegeName2 = request.getParameter("txtCollegeName2");
		String strCollegeName3 = request.getParameter("txtCollegeName3");
		String strCollegeName4 = request.getParameter("txtCollegeName4");
		String strCollegeName5 = request.getParameter("txtCollegeName5");

		String strTimeperiodAttended1 = request
				.getParameter("txtTimeperiodAttended1");
		String strTimeperiodAttended2 = request
				.getParameter("txtTimeperiodAttended2");
		String strTimeperiodAttended3 = request
				.getParameter("txtTimeperiodAttended3");
		String strTimeperiodAttended4 = request
				.getParameter("txtTimeperiodAttended4");
		String strTimeperiodAttended5 = request
				.getParameter("txtTimeperiodAttended5");

		String strDegreeEarned1 = request.getParameter("txtDegreeEarned1");
		String strDegreeEarned2 = request.getParameter("txtDegreeEarned2");
		String strDegreeEarned3 = request.getParameter("txtDegreeEarned3");
		String strDegreeEarned4 = request.getParameter("txtDegreeEarned4");
		String strDegreeEarned5 = request.getParameter("txtDegreeEarned5");

		String strMajorField1 = request.getParameter("txtMajorField1");
		String strMajorField2 = request.getParameter("txtMajorField2");
		String strMajorField3 = request.getParameter("txtMajorField3");
		String strMajorField4 = request.getParameter("txtMajorField4");
		String strMajorField5 = request.getParameter("txtMajorField5");

		if (btnName.equals("Save")) {
			app.setCurrentApplicationStatus("Not Submitted");
		} else {
			Date currentDate = new Date();
			app.setSubmittedDateTime(currentDate);
			app.setCurrentApplicationStatus("Submitted");
		}
		String programId = request.getParameter("ddlProgram");
		Program prg = prgDao.getProgramByPrgId(Integer.parseInt(programId));
		app.setPrg(prg);
		int userId = (Integer) request.getSession().getAttribute("userId");
		app.setUser(userDao.getUser(userId));

		if (!file.isEmpty()) {

			file.transferTo(new File(context.getServletContext().getRealPath(
					"/WEB-INF/files"), file.getOriginalFilename()));

			System.out.println(file.getOriginalFilename());
			app.setTranscript(file.getOriginalFilename());
		}

		Application returnApp = applicationDao.saveApplication(app);

		if (!(strCollegeName1 == null) && !strCollegeName1.isEmpty()) {
			CollegeDegree c = new CollegeDegree();

			c.setCollegeName(strCollegeName1);
			c.setAttendedTimePeriod(strTimeperiodAttended1);
			c.setDegreeEarned(strDegreeEarned1);
			c.setDegreeField(strMajorField1);
			c.setApp(returnApp);
			clgDegreeDao.saveCollegeDegree(c);
		}
		if (!(strCollegeName2 == null) && !strCollegeName2.isEmpty()) {
			CollegeDegree c = new CollegeDegree();

			c.setCollegeName(strCollegeName2);
			c.setAttendedTimePeriod(strTimeperiodAttended2);
			c.setDegreeEarned(strDegreeEarned2);
			c.setDegreeField(strMajorField2);
			c.setApp(returnApp);
			clgDegreeDao.saveCollegeDegree(c);
		}

		if (!(strCollegeName3 == null) && !strCollegeName3.isEmpty()) {
			CollegeDegree c = new CollegeDegree();

			c.setCollegeName(strCollegeName3);
			c.setAttendedTimePeriod(strTimeperiodAttended3);
			c.setDegreeEarned(strDegreeEarned3);
			c.setDegreeField(strMajorField3);
			c.setApp(returnApp);
			clgDegreeDao.saveCollegeDegree(c);
		}
		if (!(strCollegeName4 == null) && !strCollegeName4.isEmpty()) {
			CollegeDegree c = new CollegeDegree();

			c.setCollegeName(strCollegeName4);
			c.setAttendedTimePeriod(strTimeperiodAttended4);
			c.setDegreeEarned(strDegreeEarned4);
			c.setDegreeField(strMajorField4);
			c.setApp(returnApp);
			clgDegreeDao.saveCollegeDegree(c);
		}

		if (!(strCollegeName5 == null) && !strCollegeName5.isEmpty()) {
			CollegeDegree c = new CollegeDegree();

			c.setCollegeName(strCollegeName5);
			c.setAttendedTimePeriod(strTimeperiodAttended5);
			c.setDegreeEarned(strDegreeEarned5);
			c.setDegreeField(strMajorField5);
			c.setApp(returnApp);
			clgDegreeDao.saveCollegeDegree(c);
		}
		sessionStatus.setComplete();

		String deptId = request.getParameter("ddldepartment");
		List<AdditionalField> additionalField = additionalFieldDao
				.getAdditionalFieldsByDepartmentId(Integer.parseInt(deptId));
		int counter = 0;
		for (AdditionalField e : additionalField) {

			String fieldType = e.getFieldType();
			System.out.println(fieldType);
			if (fieldType.equals("NUMBER") || fieldType.equals("TEXT")) {
				String additionalfieldvalue = request.getParameter("textbox"
						+ counter);

				AdditionalFieldEntry entry = new AdditionalFieldEntry();
				entry.setAdditionalFieldValue(additionalfieldvalue);
				entry.setApp(returnApp);
				entry.setAddField(e);
				entry.setAdditionalFieldName(e.getFieldName());
				entry.setAdditionalFieldType(fieldType);
				additionalFieldEntryDao.saveFieldEntry(entry);
				sessionStatus.setComplete();
				counter++;

			} else if (fieldType == "FILE") {

				// code for file
				/*
				 * MultipartFile strfile = request.getParameter("textbox" +
				 * counter); MultipartFile file;
				 * 
				 * if (!Additionalfile.isEmpty()) {
				 * 
				 * Additionalfile.transferTo(new File(context
				 * .getServletContext().getRealPath("/WEB-INF/files"),
				 * Additionalfile.getOriginalFilename()));
				 * 
				 * System.out.println(Additionalfile.getOriginalFilename());
				 * app.setTranscript(Additionalfile.getOriginalFilename()); }
				 */
			}
		}

		sessionStatus.setComplete();
		return "redirect:/user/student/studenthome.html";

	}

	@RequestMapping(value = "/user/student/download.html")
	public String downloadFile(HttpServletResponse response,
			@RequestParam String fileName) throws IOException {

		response.setContentType("text/plain");
		response.setHeader("Content-Disposition", "attachment; filename="
				+ fileName + "");

		InputStream in = context.getServletContext().getResourceAsStream(
				"/WEB-INF/files/" + fileName);

		int read = 0;
		byte[] bytes = new byte[2048];
		OutputStream os = response.getOutputStream();
		while ((read = in.read(bytes)) > 0) {
			os.write(bytes, 0, read);
		}

		os.flush();
		os.close();
		return null;
	}

}
