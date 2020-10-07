package hotel;

public class HotelActionF {
	private boolean isRedirect = false;
	private String nextPage = null;
	
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getNextPage() {
		return nextPage; // set으로 값을 계속 넣어준다.
	}
	public void setNextPage(String nextPage) {
		this.nextPage = nextPage;
	}
	
}
