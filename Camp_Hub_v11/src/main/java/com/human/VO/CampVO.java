package com.human.VO;

public class CampVO {
	private int num;
	private String m_id;
	private String c_name;
	private String addr_do;
	private String addr_si;
	private String addr_detail;
	private String phone;
	private double star;
	private int c_price;
	private String[] camp_filename;
	private String filename;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getAddr_do() {
		return addr_do;
	}
	public void setAddr_do(String addr_do) {
		this.addr_do = addr_do;
	}
	public String getAddr_si() {
		return addr_si;
	}
	public void setAddr_si(String addr_si) {
		this.addr_si = addr_si;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public double getStar() {
		return star;
	}
	public void setStar(double star) {
		this.star = star;
	}
	public int getC_price() {
		return c_price;
	}
	public void setC_price(int c_price) {
		this.c_price = c_price;
	}
	public String[] getCamp_filename() {
		return camp_filename;
	}
	public void setCamp_filename(String[] camp_filename) {
		this.camp_filename = camp_filename;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getAddr_detail() {
		return addr_detail;
	}
	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}
}
