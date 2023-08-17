package com.human.dao;

import java.util.HashMap;
import java.util.List;

import com.human.VO.RoomSelectVO;

public interface IF_RoomDAO {

	public void camp_room_save(HashMap<Object,Object> hmap) throws Exception;
	public int camp_room_seq() throws Exception;
	public List<RoomSelectVO> roomSelectList(int num);
	public void camp_room_mod(int c_num) throws Exception;
}
