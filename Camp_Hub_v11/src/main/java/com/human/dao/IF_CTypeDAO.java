package com.human.dao;

import java.util.List;

import com.human.VO.CTypeVO;

public interface IF_CTypeDAO {

	public void camp_type_save(CTypeVO ctvo) throws Exception;
	public List<CTypeVO> camp_type_check(int c_num) throws Exception;
	public void camp_type_mod(int c_num) throws Exception;
}
