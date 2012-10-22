package application;

public class Degree {
	String location, university, disipline, title;
	double gpa;
	int year, month;
	
	public Degree(String location) {
		this.location=location;
		this.university= "";
		this.disipline="";
		this.title="";
		this.gpa= 0;
		this.year= 0;
		this.month=1;
		
	}
	

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getUniversity() {
		return university;
	}

	public void setUniversity(String university) {
		this.university = university;
	}

	public String getDisipline() {
		return disipline;
	}

	public void setDisipline(String disipline) {
		this.disipline = disipline;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public double getGpa() {
		return gpa;
	}

	public void setGpa(double gpa) {
		this.gpa = gpa;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}



}
