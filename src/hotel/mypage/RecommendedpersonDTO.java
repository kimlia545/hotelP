package hotel.mypage;

public class RecommendedpersonDTO {
	private String Recommendedin;
	private String Recommendedout;
	private String time;
	private String codes;
	
	public String getRecommendedin() {
		return Recommendedin;
	}
	public void setRecommendedin(String recommendedin) {
		Recommendedin = recommendedin;
	}
	public String getRecommendedout() {
		return Recommendedout;
	}
	public void setRecommendedout(String recommendedout) {
		Recommendedout = recommendedout;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getCodes() {
		return codes;
	}
	public void setCodes(String codes) {
		this.codes = codes;
	}
	
}
