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
		return nextPage; // set���� ���� ��� �־��ش�.
	}
	public void setNextPage(String nextPage) {
		this.nextPage = nextPage;
	}
	
}
