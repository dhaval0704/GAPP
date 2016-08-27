package gapp.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import gapp.model.User;
import gapp.model.dao.UserDao;
import gapp.web.validator.UserValidator;

@Controller
@SessionAttributes("user")
public class UserController {

	@Autowired
	private UserDao userDao;

	@Autowired
	UserValidator userValidator;

	@RequestMapping("/users.html")
	public String users(ModelMap models) {
		models.put("users", userDao.getUsers());
		return "users";
	}

	@RequestMapping(value = "/user/registration.html", method = RequestMethod.GET)
	public String add(ModelMap models, HttpServletRequest request) {
		request.getSession().removeAttribute("error");
		models.put("user", new User());
		return "user/registration";
	}

	@RequestMapping(value = "/user/login.html", method = RequestMethod.GET)
	public String login(ModelMap models, HttpServletRequest request) {
		request.getSession().removeAttribute("error");
		models.put("user", new User());
		return "user/login";
	}


	@RequestMapping(value = "/user/admin/adminhome.html", method = RequestMethod.GET)
	public String admin(ModelMap models, HttpServletRequest request) {
		request.getSession().removeAttribute("error");
		models.put("user", new User());
		return "user/admin/adminhome";
	}

	
	@RequestMapping(value = "/user/staff/staffhome.html", method = RequestMethod.GET)
	public String staff(ModelMap models, HttpServletRequest request) {
		request.getSession().removeAttribute("error");
		models.put("user", new User());
		return "user/staff/staffhome";
	}

	@RequestMapping(value = "/user/login.html", method = RequestMethod.POST)
	public String login(@ModelAttribute User user, BindingResult bindingResult,
			HttpServletRequest request) {
		List<User> users = userDao.getUsers();
		int counter = 0;
		for (User u : users) {
			if (u.getEmail().equalsIgnoreCase(user.getEmail())) {
				counter = 1;
			}
		}
		if (counter == 1) {
			User returnuser = userDao.login(user);
			if (returnuser == null) {
				request.getSession().setAttribute("error",
						"Invalid email id or password.");
				return "user/login";
			} else {
				String fullname = returnuser.getUserfirstName() + " "
						+ returnuser.getUserlastName();
				request.getSession().setAttribute("userName", fullname);
				request.getSession().setAttribute("userId", returnuser.getUserId());

				if (returnuser.getUserType().equals("admin"))
					return "redirect:/user/admin/adminhome.html";
				else if (returnuser.getUserType().equals("student"))
					return "redirect:/user/student/studenthome.html";
				else if (returnuser.getUserType().equals("staff"))
					return "redirect:/user/staff/staffhome.html";
				else
					return null;
			}
		} else {
			request.getSession().setAttribute("error",
					"User Name does not exists. Please register to log in");
			return "user/login";
		}

	}

	@RequestMapping(value = "/user/registration.html", method = RequestMethod.POST)
	public String add(@ModelAttribute User user, BindingResult bindingResult,
			HttpServletRequest request) {
		// userValidator.validate( user, bindingResult );
		// if( bindingResult.hasErrors() ) return "user/registration";
		List<User> users = userDao.getUsers();
		for (User u : users) {
			if (u.getEmail().equalsIgnoreCase(user.getEmail())) {
				request.getSession().setAttribute("error",
						"Email ID already exists. Enter Unique Email ID");
				return "user/registration";
			}
		}
		user.setUserType("student");
		userDao.saveUser(user);
		return "redirect:/user/login.html";
	}

}