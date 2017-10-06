package sef.domain;

import java.util.Date;

public class TimeSheet {

	private long ID;
	private int projectID;
	private int userInfoID;
	private Date timeDate;
	private int timeType;
	private int timeCostHours;
	private int timeWeekDay;
	private String timeDescription;
	private int timeStatus;
	private String timeRejectComment;
	private int timeCreateBy;
	private Date timeCreateTime;
	private int timeUpdateBy;
	private Date timeUpdateTime;

	public long getID() {
		return ID;
	}

	public void setID(long id) {
		ID = id;
	}

	public int getProjectID() {
		return projectID;
	}

	public void setProjectID(int projectID) {
		this.projectID = projectID;
	}

	public int getUserInfoID() {
		return userInfoID;
	}

	public void setUserInfoID(int userInfoID) {
		this.userInfoID = userInfoID;
	}

	public Date getTimeDate() {
		return timeDate;
	}

	public void setTimeDate(Date timeDate) {
		this.timeDate = timeDate;
	}

	public int getTimeType() {
		return timeType;
	}

	public void setTimeType(int timeType) {
		this.timeType = timeType;
	}

	public int getTimeCostHours() {
		return timeCostHours;
	}

	public void setTimeCostHours(int timeCostHours) {
		this.timeCostHours = timeCostHours;
	}

	public int getTimeWeekDay() {
		return timeWeekDay;
	}

	public void setTimeWeekDay(int timeWeekDay) {
		this.timeWeekDay = timeWeekDay;
	}

	public String getTimeDescription() {
		return timeDescription;
	}

	public void setTimeDescription(String timeDescription) {
		this.timeDescription = timeDescription;
	}

	public int getTimeStatus() {
		return timeStatus;
	}

	public void setTimeStatus(int timeStatus) {
		this.timeStatus = timeStatus;
	}

	public String getTimeRejectComment() {
		return timeRejectComment;
	}

	public void setTimeRejectComment(String timeRejectComment) {
		this.timeRejectComment = timeRejectComment;
	}

	public int getTimeCreateBy() {
		return timeCreateBy;
	}

	public void setTimeCreateBy(int timeCreateBy) {
		this.timeCreateBy = timeCreateBy;
	}

	public Date getTimeCreateTime() {
		return timeCreateTime;
	}

	public void setTimeCreateTime(Date timeCreateTime) {
		this.timeCreateTime = timeCreateTime;
	}

	public int getTimeUpdateBy() {
		return timeUpdateBy;
	}

	public void setTimeUpdateBy(int timeUpdateBy) {
		this.timeUpdateBy = timeUpdateBy;
	}

	public Date getTimeUpdateTime() {
		return timeUpdateTime;
	}

	public void setTimeUpdateTime(Date timeUpdateTime) {
		this.timeUpdateTime = timeUpdateTime;
	}

}
