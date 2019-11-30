package com.mvc.smartkart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mvc.smartkart.beans.ItemBean;

public class ItemDAO {
	
	static Connection con=null;
	static PreparedStatement pst=null;
	static ResultSet rs=null;
	static boolean flag=false;
	
	public static Connection getConnection() throws ClassNotFoundException,SQLException{
		
		/**
		 *
		 * @author 	: Midhun Prem
		 * @date   	: 30/10/2019
		 * @version	: 1.0
		 * @see		: Nothong
		 * @purpose	: Etablish database connection
		 * @param  	: Nothing
		 * @return 	: Connection
		 
		 */
		
		DBDAO.Connect();
		con=DBDAO.getDbCon();
		return con;
	}
	public static ArrayList<ItemBean> displayItems() throws ClassNotFoundException,SQLException{
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To Display items
		 * @param  	: none
		 * @return 	: ArrayList
		 
		 */
		
		con=getConnection();
		ArrayList<ItemBean> lst=new ArrayList<ItemBean>();
		pst=con.prepareStatement("select * from tbl_skitem");
		rs=pst.executeQuery();
		while(rs.next()){
			ItemBean itm=new ItemBean();
			itm.setId(rs.getInt(1));
			itm.setCode(rs.getString(2));
			itm.setCategory(rs.getString(3));
			itm.setName(rs.getString(4));
			itm.setPrice(rs.getDouble(5));
			itm.setImage(rs.getString(6));
			lst.add(itm);
		}
		return lst;
	}
	 public static boolean insertadminitem(ItemBean itembean) throws ClassNotFoundException,SQLException{
		 
		 /**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To Insert admin items
		 * @param  	: itemBean objects
		 * @return 	: boolean
		 
		 */
	      
	      con=getConnection();
	      pst=con.prepareStatement("insert into TBL_SKITEM(itm_code,itm_category,itm_name,itm_price,itm_image)values(?,?,?,?,?)");
	      pst.setString(1,itembean.getCode()); 
	      pst.setString(2,itembean.getCategory());
	      pst.setString(3,itembean.getName());
	      pst.setDouble(4,itembean.getPrice());
	      pst.setString(5,itembean.getImage());
	      pst.executeUpdate();
	      flag=true;
	  
	  return flag;
	      
	  }
	 public static ArrayList<ItemBean> displayItemsForAdminEdit(ItemBean obj) throws ClassNotFoundException,SQLException{
		 
		 /**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To display items
		 * @param  	: itemBean objects
		 * @return 	: ArrayList
		 
		 */
		 
			con=getConnection();
			ArrayList<ItemBean> lst=new ArrayList<ItemBean>();
			pst=con.prepareStatement("select * from tbl_skitem where itm_id=?");
			pst.setInt(1, obj.getId());
			rs=pst.executeQuery();
			while(rs.next()){
				ItemBean itm=new ItemBean();
				itm.setId(rs.getInt(1));
				itm.setCode(rs.getString(2));
				itm.setCategory(rs.getString(3));
				itm.setName(rs.getString(4));
				itm.setPrice(rs.getDouble(5));
				lst.add(itm);
			}
			return lst;
		}
	 
	 public static boolean updateItemAdmin(ItemBean obj) throws ClassNotFoundException,SQLException{
		 
		 /**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To update item admin
		 * @param  	: itemBean objects
		 * @return 	: boolean
		 
		 */
		 
		 con=getConnection();
		 pst=con.prepareStatement("update tbl_skitem set itm_code=?,itm_category=?,itm_name=?,itm_price=? where itm_id=?");
		 pst.setString(1, obj.getCode());
		 pst.setString(2, obj.getCategory());
		 pst.setString(3, obj.getName());
		 pst.setDouble(4, obj.getPrice());
		 pst.setInt(5, obj.getId());
		 pst.executeUpdate();
		 flag=true;
		 return flag;
	 }
	 public static boolean deleteItemAdmin(ItemBean obj) throws ClassNotFoundException,SQLException{
		 
		 /**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To delete items
		 * @param  	: itemBean objects
		 * @return 	: boolean
		 
		 */
		 
		 con=getConnection();
		 pst=con.prepareStatement("delete tbl_skitem where itm_id=?");
		 pst.setInt(1, obj.getId());
		 pst.executeUpdate();
		 flag=true;
		 return flag;
	 }

}
