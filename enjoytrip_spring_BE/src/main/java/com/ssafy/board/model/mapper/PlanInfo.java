package com.ssafy.board.model.mapper;

public class PlanInfo {
	private String contentId;
	private String firstImage;
	private String title;
	private String contentDesc;
	private String contentTypeId;

	public String getContentId() {
		return contentId;
	}

	public void setContentId(String string) {
		this.contentId = string;
	}

	public String getFirstImage() {
		return firstImage;
	}

	public void setFirstImage(String firstImage) {
		this.firstImage = firstImage;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContentDesc() {
		return contentDesc;
	}

	public void setContentDesc(String contentDesc) {
		this.contentDesc = contentDesc;
	}
	
	public String getContentTypeId() {
		return contentTypeId;
	}

	public void setContentTypeId(String contentTypeId) {
		this.contentTypeId = contentTypeId;
	}

}
