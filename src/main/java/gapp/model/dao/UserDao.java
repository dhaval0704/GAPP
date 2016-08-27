package gapp.model.dao;

import java.util.List;

import gapp.model.User;

public interface UserDao {

    User getUser( Integer id );

    List<User> getUsers();
    List<User> getUserByRoleType(String roleType);
    User saveUser( User user );
    
    User login(User user);
    
   
}
