package com.edspread.meeting.DTO;

import java.io.Serializable;
import java.util.List;

public class Page implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int pagenumber;
	private List<GraphicsObject> graphicsObject;
	
	
	public List<GraphicsObject> getGraphicsObject() {
		return graphicsObject;
	}
	public void setGraphicsObject(List<GraphicsObject> graphicsObject) {
		this.graphicsObject = graphicsObject;
	}
	public int getPagenumber() {
		return pagenumber;
	}
	public void setPagenumber(int pagenumber) {
		this.pagenumber = pagenumber;
	}

}
