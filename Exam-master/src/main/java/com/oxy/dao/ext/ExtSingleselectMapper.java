package com.oxy.dao.ext;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.oxy.dto.itemBank.PageSelectDTO;
import com.oxy.model.Singleselect;
import com.oxy.vo.itemBank.PageSelectVO;
@Mapper
public interface ExtSingleselectMapper {
	List<PageSelectDTO> listPage(@Param("param") PageSelectVO vo);

	void addSingleList(@Param("lists")List<Singleselect> singleList, @Param("user")String userCode);
}
