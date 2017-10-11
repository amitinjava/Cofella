package com.edspread.meeting.json;

import java.util.List;

public class Page {
	private Integer pagenumber;
	private List<Object> graphicsObject;
	public Integer getPagenumber() {
		return pagenumber;
	}
	public void setPagenumber(Integer pagenumber) {
		this.pagenumber = pagenumber;
	}
	public List<Object> getGraphicsObject() {
		return graphicsObject;
	}
	public void setGraphicsObject(List<Object> graphicsObject) {
		this.graphicsObject = graphicsObject;
	}
	

}
