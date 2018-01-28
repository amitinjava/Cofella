package com.edspread.meeting.action;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FileUtils;

import com.edspread.meeting.DTO.TreeChildDTO;
import com.edspread.meeting.DTO.UserDTO;
import com.edspread.meeting.constants.MeetingConstant;
import com.edspread.meeting.util.JDBCUtill;
import com.edspread.meeting.util.SessionUtil;
import com.opensymphony.xwork2.ActionSupport;




public class TreeAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	
	private TreeChildDTO childDTO ;
	
	private List<TreeChildDTO> childList = new ArrayList<TreeChildDTO>();
	
	private List<UserDTO> userList =  new ArrayList<UserDTO>();
	
	private int parentId = MeetingConstant.ROOT_ID; 
	private String  nodeName;
	private int nodeType;
	private float order;
	
	private int userId;
	private int nodeId;
	
	private String query;
	
	private String queryType;
	
	private String status;
	
	private String dirName;
	
	private String type;

	
	public TreeAction() {
			
	}


public String retrieveRootNode() throws Exception  {
try {
	Connection con = JDBCUtill.getConnection();
    PreparedStatement ps;
    ps = con.prepareStatement("Select * from tree where parent_id = ? and id = ? order by display_order");
    ps.setInt(1, Integer.valueOf(parentId));
    ps.setInt(2, Integer.valueOf(parentId));
    ResultSet rs = ps.executeQuery();
    System.out.println("ResultSet::::::"+rs);
              
    if (rs.next()) {
    	TreeChildDTO treeChildDTO = new TreeChildDTO();
    	treeChildDTO.setId(rs.getInt("id"));
    	treeChildDTO.setParentId(rs.getInt("parent_id"));
    	treeChildDTO.setNodeName(rs.getString("node_name")); 
    	treeChildDTO.setDisplayOrder(rs.getFloat("display_order"));
    	treeChildDTO.setNodeType(""+rs.getInt("node_type"));
    	childDTO = treeChildDTO;
    }
   
	}catch (Exception e) {
		addActionError("Error occured");
		e.printStackTrace();
		}
	retieveAllUser();
	 return SUCCESS;
}

public String retrieveAllChild() throws Exception  {
try {
	Connection con = JDBCUtill.getConnection();
    PreparedStatement ps;
    ps = con.prepareStatement("Select * from tree where parent_id = ? and id != ? order by display_order");
    ps.setInt(1, Integer.valueOf(parentId));
    ps.setInt(2, Integer.valueOf(parentId));
    ResultSet rs = ps.executeQuery();
    System.out.println("ResultSet::::::"+rs);
              
    while (rs.next()) {
    	TreeChildDTO treeChildDTO = new TreeChildDTO();
    	treeChildDTO.setId(rs.getInt("id"));
    	treeChildDTO.setParentId(rs.getInt("parent_id"));
    	treeChildDTO.setNodeName(rs.getString("node_name")); 
    	treeChildDTO.setDisplayOrder(rs.getFloat("display_order"));
    	treeChildDTO.setNodeType(""+rs.getInt("node_type"));
    
    	childList.add(treeChildDTO);
    }
   
	}catch (Exception e) {
		addActionError("Error occured");
		e.printStackTrace();
		}
retieveAllUser();
	 return SUCCESS;
}


public String saveChild() throws Exception  {
	Connection con = JDBCUtill.getConnection();
try {
	
	con.setAutoCommit(false);
	con.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);
	
	    PreparedStatement ps;
	   
	    	 // Insert into tree
    	 ps = con.prepareStatement("insert into tree " +
            		"(parent_id,node_name,display_order,node_type) " +
            		"values" +
            		"(?,?,?,?)");
	    ps.setInt(1, Integer.valueOf(parentId));
	    ps.setString(2, nodeName);
	    ps.setFloat(3, Float.valueOf(order));
	    ps.setInt(4, nodeType);
	    
	    ps.executeUpdate();
	   
	    
        con.commit();
	    retrieveAllChild();
	    	
	    /*
	    else if(node_type == 1 && parentNodeType == 1){
	    	// Insert into ivr_menu_tree
	    	ps = con.prepareStatement("insert into ivr_menu_tree " +
            		"(parent_id,node_name,display_order,option) " +
            		"values" +
            		"(?,?,?,?)");
		    ps.setInt(1, Integer.valueOf(parentId));
		    ps.setString(2, nodeName);
		    ps.setFloat(3, Float.valueOf(order));
		    ps.setInt(4, Integer.valueOf(ivrOption));
		    ps.executeUpdate();
	    }*/
	   
	    
	}catch (Exception e) {
		addActionError("Error occured");
		e.printStackTrace();
		 try {
			con.rollback();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		}
	 return SUCCESS;
}


public String updateNodeName(){
	Connection con = JDBCUtill.getConnection();
try {
	  
	  	con.setAutoCommit(false);
	  	con.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);
	    PreparedStatement ps;
	    ps = con.prepareStatement("Update tree set node_name = ?  , display_order = ? , node_type = ?  " +
	            					"where id = ?");
	    ps.setString(1, nodeName);
	    ps.setFloat(2, Float.valueOf(order));
	    ps.setInt(3, nodeType);
	     ps.setInt(5, Integer.valueOf(parentId));
	    ps.executeUpdate();
	    
	   
	   
	    
	    ps = con.prepareStatement("Select parent_id from tree where id = ?");
	    ps.setInt(1, Integer.valueOf(parentId));
	    ResultSet rs = ps.executeQuery();
	   
	              
	    if (rs.next()) {
	    	parentId = rs.getInt("parent_id");
	    }
	    con.commit();
	    
	}catch (Exception e) {
		addActionError("Error occured");
		e.printStackTrace();
		 try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}

	 return SUCCESS;
}
public String attachNode(){
	Connection con = JDBCUtill.getConnection();
/*try {
	  
	  	con.setAutoCommit(false);
	  	con.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);
	    PreparedStatement ps;
	    ps = con.prepareStatement("insert into node_user (user_id,node_id) values (?,?)");
	    ps.setString(1, nodeName);
	    ps.setFloat(2, Float.valueOf(order));
	    ps.setInt(3, nodeType);
	     ps.setInt(5, Integer.valueOf(parentId));
	    ps.executeUpdate();
	    
	   
	   
	    
	    ps = con.prepareStatement("Select parent_id from tree where id = ?");
	    ps.setInt(1, Integer.valueOf(parentId));
	    ResultSet rs = ps.executeQuery();
	   
	              
	    if (rs.next()) {
	    	parentId = rs.getInt("parent_id");
	    }
	    con.commit();
	    
	}catch (Exception e) {
		addActionError("Error occured");
		e.printStackTrace();
		 try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}*/

	 return SUCCESS;
}

public String showQueryPage() {

	return SUCCESS;
}

public String executeQuery() {

	try {
		Connection con = JDBCUtill.getConnection();
		if(queryType.equalsIgnoreCase("select")){
			PreparedStatement ps;
			ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				UserDTO user =  new UserDTO();
				user.setUserId(rs.getInt("id"));
				user.setName(rs.getString("first_name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				userList.add(user);
			}
			status = SUCCESS;
			
		}else if(queryType.equalsIgnoreCase("update") || queryType.equalsIgnoreCase("delete")){
			PreparedStatement ps;
			ps = con.prepareStatement(query);
			if(ps.execute()){
				status = SUCCESS;
			}else{
				status = ERROR;
				addActionError("Execute failed");
			}
		}
	} catch (Exception e) {
		addActionError("Error occured");
		e.printStackTrace();
	}

	return SUCCESS;
}

public String delDir(){
	String CONTEXT_PATH = SessionUtil.getServerDeploymentPath();
	String lecturePath;
	if(type.equals("all")){
		 lecturePath = CONTEXT_PATH + File.separator
				+ MeetingConstant.ENOTEBOOK ;
	}else{
		 lecturePath = CONTEXT_PATH + File.separator
				+ MeetingConstant.ENOTEBOOK + File.separator
				+ dirName;
	}
	
	File fl = new File(lecturePath);
	try {
		FileUtils.deleteDirectory(fl);
		status = SUCCESS;
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		status = ERROR;
	}
	return SUCCESS;
}

public String delServerDir(){
	String CONTEXT_PATH = SessionUtil.getServerDeploymentPath();
	String lecturePath;
	if(type.equals("all")){
		 lecturePath = CONTEXT_PATH + File.separator
				+ MeetingConstant.ENOTEBOOK ;
	}else{
		 lecturePath = CONTEXT_PATH + File.separator
				+ "mt" + File.separator
				+ dirName;
	}
	
	File fl = new File(lecturePath);
	try {
		FileUtils.deleteDirectory(fl);
		status = SUCCESS;
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		status = ERROR;
	}
	return SUCCESS;
}

	public String retieveAllUser()  {
		
		try {
			Connection con = JDBCUtill.getConnection();
			PreparedStatement ps;
			ps = con.prepareStatement("Select id,name from user where type =2 and active_status = 1");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				UserDTO user =  new UserDTO();
				user.setUserId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				userList.add(user);

			}
		} catch (Exception e) {
			addActionError("Error occured");
			e.printStackTrace();
		}

		return SUCCESS;
	}

public TreeChildDTO getChildDTO() {
	return childDTO;
}


public void setChildDTO(TreeChildDTO childDTO) {
	this.childDTO = childDTO;
}


public int getParentId() {
	return parentId;
}


public void setParentId(int parentId) {
	this.parentId = parentId;
}


public List<TreeChildDTO> getChildList() {
	return childList;
}


public void setChildList(List<TreeChildDTO> childList) {
	this.childList = childList;
}


public String getNodeName() {
	return nodeName;
}


public void setNodeName(String nodeName) {
	this.nodeName = nodeName;
}


public int getNodeType() {
	return nodeType;
}


public void setNodeType(int nodeType) {
	this.nodeType = nodeType;
}


public float getOrder() {
	return order;
}


public void setOrder(float order) {
	this.order = order;
}


public List<UserDTO> getUserList() {
	return userList;
}


public void setUserList(List<UserDTO> userList) {
	this.userList = userList;
}


public int getUserId() {
	return userId;
}


public void setUserId(int userId) {
	this.userId = userId;
}


public int getNodeId() {
	return nodeId;
}


public void setNodeId(int nodeId) {
	this.nodeId = nodeId;
}


public String getQuery() {
	return query;
}


public void setQuery(String query) {
	this.query = query;
}


public String getQueryType() {
	return queryType;
}


public void setQueryType(String queryType) {
	this.queryType = queryType;
}


public String getStatus() {
	return status;
}


public void setStatus(String status) {
	this.status = status;
}


public String getDirName() {
	return dirName;
}


public void setDirName(String dirName) {
	this.dirName = dirName;
}


public String getType() {
	return type;
}


public void setType(String type) {
	this.type = type;
}





}
