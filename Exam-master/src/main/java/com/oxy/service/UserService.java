package com.oxy.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.oxy.dto.user.PageUserDTO;
import com.oxy.model.User;
import com.oxy.vo.user.AddUserVO;
import com.oxy.vo.user.PageUserVO;
import com.oxy.vo.user.UpdateUserVO;



public interface UserService {
	User getUser(String usercode);
	List<User> getUserList(String role);
	User login(String usercode, String password, String role);
	
	PageInfo<PageUserDTO> page( PageUserVO dto);
	
	void insert(AddUserVO vo);
	
	void update(UpdateUserVO vo);
	
	void delete(String usercode);

}
