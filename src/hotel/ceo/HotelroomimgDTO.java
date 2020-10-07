package hotel.ceo;

public class HotelroomimgDTO {
	private int guestroomnumber; // 방 번호
	private int idx; // ceo 번호
	private String roomType;
	private int roomAmount; // 몇개 방이 있는지 
	private int roomprice;
	private int minGuest;
	private int maxGuest;
	
	private int hotelnumber; //ceo 번호
	private int roomnumber;  // 방 번호 guestroomnumber 이랑 같음;
	private String filname;
	private String roomimg;
	
	
	public int getGuestroomnumber() {
		return guestroomnumber;
	}
	public void setGuestroomnumber(int guestroomnumber) {
		this.guestroomnumber = guestroomnumber;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public int getRoomAmount() {
		return roomAmount;
	}
	public void setRoomAmount(int roomAmount) {
		this.roomAmount = roomAmount;
	}
	public int getRoomprice() {
		return roomprice;
	}
	public void setRoomprice(int roomprice) {
		this.roomprice = roomprice;
	}
	public int getMinGuest() {
		return minGuest;
	}
	public void setMinGuest(int minGuest) {
		this.minGuest = minGuest;
	}
	public int getMaxGuest() {
		return maxGuest;
	}
	public void setMaxGuest(int maxGuest) {
		this.maxGuest = maxGuest;
	}
	
	
	
	public int getHotelnumber() {
		return hotelnumber;
	}
	public void setHotelnumber(int hotelnumber) {
		this.hotelnumber = hotelnumber;
	}
	public int getRoomnumber() {
		return roomnumber;
	}
	public void setRoomnumber(int roomnumber) {
		this.roomnumber = roomnumber;
	}
	public String getFilname() {
		return filname;
	}
	public void setFilname(String filname) {
		this.filname = filname;
	}
	public String getRoomimg() {
		return roomimg;
	}
	public void setRoomimg(String roomimg) {
		this.roomimg = roomimg;
	}
	
	
	
}

