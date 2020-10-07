package hotel.review;

import java.util.Date;

public class HTReviewDTO {
	
	private int reviewNum; //댓글 번호 
	private int reviewNum_re; //답글 번호
	private String title; 
	private String content;
	private String wdate;
	private float grade;
	private String id;
	private int rvNum;
	
	

	public int getRvNum() {
		return rvNum;
	}
	public void setRvNum(int rvNum) {
		this.rvNum = rvNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	public int getReviewNum_re() {
		return reviewNum_re;
	}
	public void setReviewNum_re(int reviewNum_re) {
		this.reviewNum_re = reviewNum_re;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public float getGrade() {
		return grade;
	}
	public void setGrade(float grade) {
		this.grade = grade;
	} 
	
	

}
