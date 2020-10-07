package hotel.ceo;

import java.util.Vector;

public class CeoDTO {
	private String ceoid;
	private String hotelname;
	private String hoteladdress;
	private String roomtype;
	private int roomamount;
	private int roomprice;
	private int minguest;
	private int maxguest;
	private String oriname;
	private String sysname;
	private int guestroomamount;
	
	public int getGuestroomamount() {
		return guestroomamount;
	}
	public void setGuestroomamount(int guestroomamount) {
		this.guestroomamount = guestroomamount;
	}
	public String getOriname() {
		return oriname;
	}
	public void setOriname(String oriname) {
		this.oriname = oriname;
	}
	public String getSysname() {
		return sysname;
	}
	public void setSysname(String sysname) {
		this.sysname = sysname;
	}
	public String getCeoid() {
		return ceoid;
	}
	public void setCeoid(String ceoid) {
		this.ceoid = ceoid;
	}
	public String getHotelname() {
		return hotelname;
	}
	public void setHotelname(String hotelname) {
		this.hotelname = hotelname;
	}
	public String getHoteladdress() {
		return hoteladdress;
	}
	public void setHoteladdress(String hoteladdress) {
		this.hoteladdress = hoteladdress;
	}
	public String getRoomtype() {
		return roomtype;
	}
	public void setRoomtype(String roomtype) {
		this.roomtype = roomtype;
	}
	public int getRoomamount() {
		return roomamount;
	}
	public void setRoomamount(int roomamount) {
		this.roomamount = roomamount;
	}
	public int getRoomprice() {
		return roomprice;
	}
	public void setRoomprice(int roomprice) {
		this.roomprice = roomprice;
	}
	public int getMinguest() {
		return minguest;
	}
	public void setMinguest(int minguest) {
		this.minguest = minguest;
	}
	public int getMaxguest() {
		return maxguest;
	}
	public void setMaxguest(int maxguest) {
		this.maxguest = maxguest;
	}

}
