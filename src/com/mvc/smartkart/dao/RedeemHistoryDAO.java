package com.mvc.smartkart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mvc.smartkart.beans.RedeemHistoryBean;

public class RedeemHistoryDAO {

	static Connection con=null;
	static PreparedStatement pst=null;
	static ResultSet rs=null;
	static boolean flag=false;
	
	public static Connection getConnection() throws ClassNotFoundException,SQLException{
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
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
	public static boolean insertRedeemHistory(RedeemHistoryBean obj) throws ClassNotFoundException,SQLException{
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To insert redeem history
		 * @param  	: UserBean object
		 * @return 	: boolean
		 
		 */
		
		con=getConnection();
		pst=con.prepareStatement("insert into tbl_skredeemhistory (rdh_date,rdh_name,rdh_points,rdh_pointrate) values(?,?,?,?)");
		pst.setDate(1, obj.getDate());
		pst.setString(2, obj.getName());
		pst.setDouble(3, obj.getPoint());
		pst.setDouble(4, obj.getPointRate());
		pst.executeUpdate();
		flag=true;
		return flag;		
	}
	public static ArrayList<RedeemHistoryBean> displayRedeemHistory() throws ClassNotFoundException,SQLException {
		
		con=getConnection();
		ArrayList<RedeemHistoryBean> lst=new ArrayList<RedeemHistoryBean>();
		pst=con.prepareStatement("select * from tbl_skredeemhistory");
		rs=pst.executeQuery();
		while(rs.next()){
			RedeemHistoryBean rdm=new RedeemHistoryBean();
			rdm.setId(rs.getInt(1));
			rdm.setDate(rs.getDate(2));
			rdm.setName(rs.getString(3));
			rdm.setPoint(rs.getDouble(4));
			rdm.setPointRate(rs.getDouble(5));
			lst.add(rdm);
			
		}
		return lst;
	}
}
