package application;

import java.rmi.server.UID;

public class Degree {
	private UID id; 
	private String location, university, discipline, title, gpa, year, month;
	public Degree() {
		this.id = new UID();
		this.location = "";
		this.university = "";
		this.discipline = "";
		this.title = "";
		this.gpa = "";
		this.year = "";
		this.month = "";
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

	public String getDiscipline() {
		return discipline;
	}

	public void setDiscipline(String disipline) {
		this.discipline = disipline;
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

	public String getGpa() {
		return gpa;
	}

	public void setGpa(String gpa) {
		this.gpa = gpa;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public UID getId() {
		return id;
	}

}
