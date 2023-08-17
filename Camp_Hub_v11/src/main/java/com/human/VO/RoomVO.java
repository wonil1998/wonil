package com.human.VO;

public class RoomVO {
	private int num;
	private int c_num;
	private String[] r_name;
	private int[] max_cnt;
	private int[] basic_cnt;
	private int[] r_price;
	private String[] room_filename;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public String[] getR_name() {
		return r_name;
	}
	public void setR_name(String[] r_name) {
		this.r_name = r_name;
	}
	public int[] getMax_cnt() {
		return max_cnt;
	}
	public void setMax_cnt(int[] max_cnt) {
		this.max_cnt = max_cnt;
	}
	public int[] getBasic_cnt() {
		return basic_cnt;
	}
	public void setBasic_cnt(int[] basic_cnt) {
		this.basic_cnt = basic_cnt;
	}
	public int[] getR_price() {
		return r_price;
	}
	public void setR_price(int[] r_price) {
		this.r_price = r_price;
	}
	public String[] getRoom_filename() {
		return room_filename;
	}
	public void setRoom_filename(String[] room_filename) {
		this.room_filename = room_filename;
	}
}
