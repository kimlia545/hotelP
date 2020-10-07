package hotel.search;

import java.util.Vector;

public class HTDataDTO {

	private int idx;
	private String id;
	private String name;
	private String address;
	private int grade;
	//예약할 수 없는 ROOM
	private Vector<Integer> exceptRoom;

	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public Vector<Integer> getExceptRoom() {
		return exceptRoom;
	}
	public void setExceptRoom(Vector<Integer> exceptRoom) {
		this.exceptRoom = exceptRoom;
	}	
}
