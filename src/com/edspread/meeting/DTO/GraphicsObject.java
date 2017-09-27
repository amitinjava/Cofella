package com.edspread.meeting.DTO;

import java.io.Serializable;
import java.util.List;

public class GraphicsObject implements Serializable {


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private int id;
	private int type; 
	private List<Float>	pointsList;
	private int lineWidth;
	private String color;
	private String src;
	private boolean isFilled;
	private String fillColor;
	private String opacity;
	private boolean imageLoaded;
	private Text text;
	private String ref;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	public int getLineWidth() {
		return lineWidth;
	}
	public void setLineWidth(int lineWidth) {
		this.lineWidth = lineWidth;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	public boolean isFilled() {
		return isFilled;
	}
	public void setFilled(boolean isFilled) {
		this.isFilled = isFilled;
	}
	public String getFillColor() {
		return fillColor;
	}
	public void setFillColor(String fillColor) {
		this.fillColor = fillColor;
	}
	public String getOpacity() {
		return opacity;
	}
	public void setOpacity(String opacity) {
		this.opacity = opacity;
	}
	public boolean isImageLoaded() {
		return imageLoaded;
	}
	public void setImageLoaded(boolean imageLoaded) {
		this.imageLoaded = imageLoaded;
	}
	public Text getText() {
		return text;
	}
	public void setText(Text text) {
		this.text = text;
	}
	public String getRef() {
		return ref;
	}
	public void setRef(String ref) {
		this.ref = ref;
	}
	public List<Float> getPointsList() {
		return pointsList;
	}
	public void setPointsList(List<Float> pointsList) {
		this.pointsList = pointsList;
	}
	

}
