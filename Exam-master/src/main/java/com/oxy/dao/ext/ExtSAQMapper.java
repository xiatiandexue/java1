package com.oxy.dao.ext;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.oxy.dto.itemBank.PageSaqDTO;
import com.oxy.model.SAQ;
import com.oxy.vo.itemBank.PageSaqVO;

@Mapper
public interface ExtSAQMapper {
	List<PageSaqDTO> listPage(@Param("param") PageSaqVO vo);

	void addSaqList(@Param("lists")List<SAQ> saqList, @Param("user")String user);
}
