package com.edspread.meeting.DTO;

import java.io.Serializable;

public class Text implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String textData;
	private String fontType;
	private String fontSize;
	private String isBold;
	private String isUnderLine;
	private String isItalic;
	
	public String getTextData() {
		return textData;
	}
	public void setTextData(String textData) {
		this.textData = textData;
	}
	public String getFontType() {
		return fontType;
	}
	public void setFontType(String fontType) {
		this.fontType = fontType;
	}
	public String getFontSize() {
		return fontSize;
	}
	public void setFontSize(String fontSize) {
		this.fontSize = fontSize;
	}
	public String getIsBold() {
		return isBold;
	}
	public void setIsBold(String isBold) {
		this.isBold = isBold;
	}
	public String getIsUnderLine() {
		return isUnderLine;
	}
	public void setIsUnderLine(String isUnderLine) {
		this.isUnderLine = isUnderLine;
	}
	public String getIsItalic() {
		return isItalic;
	}
	public void setIsItalic(String isItalic) {
		this.isItalic = isItalic;
	}

}
