package gapp.web.controller;

import gapp.model.dao.ProgramDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProgramController {

	
	  @Autowired
	    private ProgramDao prgDao;

	    @RequestMapping("/programs.html")
	    public String programs( ModelMap models )
	    {
	        models.put( "programs", prgDao.getPrograms() );
	        return "programs";
	    }
	    
	
}
