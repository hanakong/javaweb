package board;

public class BoardVO {
	
	private int idx;
	private String mid;
	private String nickName;
	private String title;
	private String email;
	private String homePage;
	private String content;
	private int readNum;
	private String hostIP;
	private String openSw;
	private String wDate;
	private int good;
	
	private int hour_diff; // 위의 필드들은 sql에 등록되있는 것 hour_diff는 아님... 따라서 구분을 위해 띄어쓰기~
	private int day_diff;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadNum() {
		return readNum;
	}
	public void setReadNum(int readNum) {
		this.readNum = readNum;
	}
	public String getHostIP() {
		return hostIP;
	}
	public void setHostIP(String hostIP) {
		this.hostIP = hostIP;
	}
	public String getOpenSw() {
		return openSw;
	}
	public void setOpenSw(String openSw) {
		this.openSw = openSw;
	}
	public String getwDate() {
		return wDate;
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	
	public int getHour_diff() {
		return hour_diff;
	}
	public void setHour_diff(int hour_diff) {
		this.hour_diff = hour_diff;
	}
	public int getDay_diff() {
		return day_diff;
	}
	public void setDay_diff(int day_diff) {
		this.day_diff = day_diff;
	}
	@Override
	public String toString() {
		return "BoardVO [idx=" + idx + ", mid=" + mid + ", nickName=" + nickName + ", title=" + title + ", email=" + email
				+ ", homePage=" + homePage + ", content=" + content + ", readNum=" + readNum + ", hostIP=" + hostIP
				+ ", openSw=" + openSw + ", wDate=" + wDate + ", good=" + good + ", hour_diff=" + hour_diff + ", day_diff="
				+ day_diff + "]";
	}
}