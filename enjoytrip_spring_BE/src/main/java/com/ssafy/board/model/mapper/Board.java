package com.ssafy.board.model.mapper;

import java.util.ArrayList;
import java.util.List;

public class Board {
	private int planId;
	private String title;
	private int hit;
	private String registerDate;
	private String thumbNail;
	private String userId;
	private String userName;
	private List<PlanInfo> planInfos = new ArrayList<>();
//	private List<String> contentImages = new ArrayList<>();
//	private List<String> contentTitles = new ArrayList<>();
//	private List<String> contentDescs = new ArrayList<>();

	public int getPlanId() {
		return planId;
	}

	public void setPlanId(int planId) {
		this.planId = planId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

//	public List<String> getContentImages() {
//		return contentImages;
//	}
//
//	public void setContentImages(List<String> contentImages) {
//		this.contentImages = contentImages;
//	}
//
//	public List<String> getContentTitles() {
//		return contentTitles;
//	}
//
//	public void setContentTitles(List<String> contentTitles) {
//		this.contentTitles = contentTitles;
//	}
//
//	public List<String> getContentDescs() {
//		return contentDescs;
//	}
//
//	public void setContentDescs(List<String> contentDescs) {
//		this.contentDescs = contentDescs;
//	}

	public String getThumbNail() {
		return thumbNail;
	}

	public List<PlanInfo> getPlanInfos() {
		return planInfos;
	}

	public void setPlanInfos(List<PlanInfo> planInfos) {
		this.planInfos = planInfos;
	}

	public void setThumbNail(String thumbNail) {
		this.thumbNail = thumbNail;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "Board [planId=" + planId + ", title=" + title + ", hit=" + hit + ", registerDate=" + registerDate
				+ ", thumbNail=" + thumbNail + ", userId=" + userId + ", userName=" + userName + ", planInfos="
				+ planInfos + "]";
	}
	
}
