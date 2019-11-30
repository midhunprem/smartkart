package com.mvc.smartkart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mvc.smartkart.beans.LoyaltyPointBean;

public class LoyaltyPointDAO {

	static Connection con=null;
	static PreparedStatement pst=null;
	static ResultSet rs=null;
	static boolean flag=false;
	
	public static Connection getConnection() throws ClassNotFoundException,SQLException{
		
		/**
		 *
		 * @author 	: SmartKart
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
	public static ArrayList<LoyaltyPointBean> getLoyaltyPointForAdmin() throws ClassNotFoundException,SQLException{
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To get Loyalty point
		 * @param  	: none
		 * @return 	: ArrayList
		 
		 */
		
		ArrayList<LoyaltyPointBean> lst=new ArrayList<LoyaltyPointBean>();	
	
		con=getConnection();
		pst=con.prepareStatement("select * from tbl_skloyaltypoint");
		rs=pst.executeQuery();
		while(rs.next()){
			LoyaltyPointBean lp=new LoyaltyPointBean();
			lp.setId(rs.getInt(1));
			lp.setRatePerPoint(rs.getDouble(2));
			lp.setExpiryDays(rs.getInt(3));
			lp.setPayable(rs.getInt(4));
			lst.add(lp);
		}
		return lst;
	}
	public static boolean updateLoyaltyPoint(LoyaltyPointBean obj) throws ClassNotFoundException,SQLException {
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To Update LoyaltyPoint
		 * @param  	: LoyaltypointBean
		 * @return 	: boolean
		 
		 */
		
		con=getConnection();
		pst=con.prepareStatement("update tbl_skloyaltypoint set lpt_rateperpoint=?,lpt_expiry=?,lpt_payable=? where lpt_id=?");
		pst.setDouble(1, obj.getRatePerPoint());
		pst.setInt(2,obj.getExpiryDays());
		pst.setInt(3, obj.getPayable());
		pst.setInt(4, obj.getId());
		
		pst.executeUpdate();
		flag=true;
		return flag;
	}
	public static ArrayList<LoyaltyPointBean> getLoyaltyPointForUser() throws ClassNotFoundException,SQLException{
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To get Loyalty point
		 * @param  	: none
		 * @return 	: ArrayList
		 
		 */
		
		ArrayList<LoyaltyPointBean> lst=new ArrayList<LoyaltyPointBean>();	
	
		con=getConnection();
		pst=con.prepareStatement("select * from tbl_skloyaltypoint");
		rs=pst.executeQuery();
		while(rs.next()){
			LoyaltyPointBean lp=new LoyaltyPointBean();
			lp.setId(rs.getInt(1));
			lp.setRatePerPoint(rs.getDouble(2));
			lp.setExpiryDays(rs.getInt(3));
			lp.setPayable(rs.getInt(4));
			lst.add(lp);
		}
		return lst;
	}
}
