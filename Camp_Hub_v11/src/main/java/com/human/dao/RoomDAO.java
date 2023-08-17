package com.human.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.human.VO.RoomSelectVO;

@Repository
public class RoomDAO implements IF_RoomDAO{
	private static String mapperQuery="com.human.dao.IF_RoomDAO";
	@Inject 
	private SqlSession sqlSession;
	
	@Override
	public int camp_room_seq() throws Exception {
		return sqlSession.selectOne(mapperQuery+".camp_room_seq");
	}
	@Override
	public void camp_room_save(HashMap<Object, Object> hmap) throws Exception {
		sqlSession.insert(mapperQuery+".camp_room_save",hmap);
	}
	@Override
	public List<RoomSelectVO> roomSelectList(int num) {
		return sqlSession.selectList(mapperQuery+".roomSelectList", num);
	} 
	@Override
	public void camp_room_mod(int c_num) throws Exception {
		sqlSession.delete(mapperQuery+".camp_room_mod",c_num);
	} 
}
