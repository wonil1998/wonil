package com.human.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.human.VO.FiledataVO;

@Repository
public class FiledataDAO implements IF_FiledataDAO{
	private static String mapperQuery="com.human.dao.IF_FiledataDAO";
	@Inject 
	private SqlSession sqlSession;
	@Override
	public void fileInsert(HashMap<Object, Object> hmap) throws Exception {
		sqlSession.insert(mapperQuery+".fileInsert",hmap);
	}
	@Override
	public List<FiledataVO> fileSelectList(HashMap<String, Integer> hmap) throws Exception{
		return sqlSession.selectList(mapperQuery+".fileSelectList", hmap);
	}
	@Override
	public void filedataDelete(int num) throws Exception {
		sqlSession.delete(mapperQuery+".filedataDelete",num);
	}
	@Override
	public List<FiledataVO> fileList() throws Exception {
		return sqlSession.selectList(mapperQuery+".fileList");
	} 
	
	@Override
	public List<FiledataVO> campFileList(int c_num) throws Exception {
		return sqlSession.selectList(mapperQuery+".campFileList",c_num);
	}
	@Override
	public void camp_file_mod(int c_num) throws Exception {
		sqlSession.delete(mapperQuery+".camp_file_mod",c_num);
	}
	@Override
	public void camp_roomfile_mod(int c_num) throws Exception {
		sqlSession.delete(mapperQuery+".camp_roomfile_mod",c_num);
	}
}
