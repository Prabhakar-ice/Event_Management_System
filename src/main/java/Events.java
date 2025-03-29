import java.time.LocalDateTime;
import java.time.LocalTime;

public class Events {

	private int eventid;
	private String title;
	private String description;
	private String location;
	private LocalDateTime date;
	private LocalTime time;
	private int participants;
	private String imagename;
	private String createdby;
	public Events() {
		super();
	}
	public Events( String title, String description, String location, LocalDateTime date, LocalTime time,
			int participants, String imagename,String createdby) {
		super();
		this.title = title;
		this.description = description;
		this.location = location;
		this.date = date;
		this.time = time;
		this.participants = participants;
		this.imagename = imagename;
		this.createdby = createdby;
	}
	public int getEventid() {
		return eventid;
	}
	public void setEventid(int eventid) {
		this.eventid = eventid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public LocalDateTime getDate() {
		return date;
	}
	public void setDate(LocalDateTime date) {
		this.date = date;
	}
	public LocalTime getTime() {
		return time;
	}
	public void setTime(LocalTime time) {
		this.time = time;
	}
	public int getParticipants() {
		return participants;
	}
	public void setParticipants(int participants) {
		this.participants = participants;
	}
	public String getImagename() {
		return imagename;
	}
	public void setImagename(String imagename) {
		this.imagename = imagename;
	}
	public String getCreatedby() {
		return createdby;
	}
	public void setCreatedby(String createdby) {
		this.createdby = createdby;
	}
	@Override
	public String toString() {
		return "Events [eventid=" + eventid + ", title=" + title + ", description=" + description + ", location="
				+ location + ", date=" + date + ", time=" + time + ", participants=" + participants + ", imagename="
				+ imagename + "]";
	}
	
}
