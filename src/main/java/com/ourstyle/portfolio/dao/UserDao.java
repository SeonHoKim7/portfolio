package com.ourstyle.portfolio.dao;

import com.ourstyle.portfolio.domain.*;
import com.ourstyle.portfolio.domain.User;

public interface UserDao {
    User selectUser(String id) throws Exception;
    int deleteUser(String id) throws Exception;
    int insertUser(User user) throws Exception;
    int updateUser(User user) throws Exception;
    int count() throws Exception;
    void deleteAll() throws Exception;
}