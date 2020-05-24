package po;

public class New {
	private String text;
	private String time;
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "New [text=" + text + ", time=" + time + "]";
	}
	
	

}
