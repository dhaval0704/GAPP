package gapp.web.controller;

import gapp.model.dao.DisplayStatusDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DisplayStatusController {

	@Autowired
    private DisplayStatusDao displaystatusDao;

    @RequestMapping("/DisplayStatusList.html")
    public String programs( ModelMap models )
    {
        models.put( "DisplayStatusList", displaystatusDao.getStatusList() );
        return "DisplayStatusList";
    }

}
