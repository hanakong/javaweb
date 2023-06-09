package guest;

public class GuestVO {
	private int idx;
	private String name;
	private String content;
	private String email;
	private String homePage;
	private String visitDate;
	private String hostIP;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHomePage() {
		return homePage;
	}
	public void setHomePage(String homePage) {
		this.homePage = homePage;
	}
	public String getVisitDate() {
		return visitDate;
	}
	public void setVisitDate(String visitDate) {
		this.visitDate = visitDate;
	}
	public String getHostIP() {
		return hostIP;
	}
	public void setHostIP(String hostIP) {
		this.hostIP = hostIP;
	}
	@Override
	public String toString() {
		return "GuestVO [content=" + content + ", email=" + email + ", homePage=" + homePage + ", hostIP=" + hostIP
				+ ", idx=" + idx + ", name=" + name + ", visitDate=" + visitDate + "]";
	}
}
