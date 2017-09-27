package com.edspread.meeting.DTO;

import java.io.Serializable;

public class TreeChildDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	
	private Integer parentId;
	
	private String nodeName;
	
	private Float displayOrder;
	
	private String nodeType;
	
	


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getNodeName() {
		return nodeName;
	}

	public void setNodeName(String nodeName) {
		this.nodeName = nodeName;
	}

	public Float getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(Float displayOrder) {
		this.displayOrder = displayOrder;
	}

	public String getNodeType() {
		return nodeType;
	}

	public void setNodeType(String nodeType) {
		this.nodeType = nodeType;
	}


	
}
