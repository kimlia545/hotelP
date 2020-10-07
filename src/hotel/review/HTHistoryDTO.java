package hotel.review;

public class HTHistoryDTO {
	
	

	private int rvNum; //예약번호
	private int idx;			
	private int roomNum;		
	private String rvName;		
	private String rvID;			
	private String rvHotelName;
	private String rvroomType;	
	private int price; 	
	private String checkIn;		
	private String checkOut;
	private Boolean reviewWrite;	
	
	
	public int getRvNum() {
		return rvNum;
	}
	public void setRvNum(int rvNum) {
		this.rvNum = rvNum;
	}
	public Boolean getReviewWrite() {
		return reviewWrite;
	}
	public void setReviewWrite(Boolean reviewWrite) {
		this.reviewWrite = reviewWrite;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}
	public String getRvName() {
		return rvName;
	}
	public void setRvName(String rvName) {
		this.rvName = rvName;
	}
	public String getRvID() {
		return rvID;
	}
	public void setRvID(String rvID) {
		this.rvID = rvID;
	}
	public String getRvHotelName() {
		return rvHotelName;
	}
	public void setRvHotelName(String rvHotelName) {
		this.rvHotelName = rvHotelName;
	}
	public String getRvroomType() {
		return rvroomType;
	}
	public void setRvroomType(String rvroomType) {
		this.rvroomType = rvroomType;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}
	public String getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}	

}
