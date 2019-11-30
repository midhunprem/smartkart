package com.mvc.smartkart.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mvc.smartkart.beans.ItemBean;
import com.mvc.smartkart.beans.UserBean;

public class UserDAO {
	
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
	public static int checkUser(UserBean obj) throws ClassNotFoundException,SQLException{
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: Check whether user Exist or not
		 * @param  	: UserBean object
		 * @return 	: integer
		 
		 */
		
		int status=999;
		con=getConnection();
		pst=con.prepareStatement("select usr_role from tbl_skuser where usr_username=? and usr_password=?");
		pst.setString(1, obj.getUserName());
		pst.setString(2, obj.getPassword());
		rs=pst.executeQuery();
		while(rs.next()){
			status=rs.getInt(1);
		}
		return status;
	}
	public static boolean signinNewUser(UserBean obj)throws ClassNotFoundException,SQLException{
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To insert a new User
		 * @param  	: UserBean object
		 * @return 	: boolean value
		 
		 */
		
		con=getConnection();
		pst=con.prepareStatement("insert into tbl_skuser (usr_name,usr_email,usr_number,usr_username,usr_password,usr_role,usr_availablelp)values(?,?,?,?,?,?,?)");
		pst.setString(1, obj.getName());
		pst.setString(2, obj.getEmail());
		pst.setDouble(3, obj.getNumber());
		pst.setString(4, obj.getUserName());
		pst.setString(5, obj.getPassword());
		pst.setInt(6, obj.getRole());
		pst.setDouble(7, obj.getAvailableLP());
		pst.executeUpdate();
		flag=true;
		return flag;
	}
	public static int getCustomerId(UserBean obj) throws ClassNotFoundException,SQLException{
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To get current Customer id
		 * @param  	: UserBean object
		 * @return 	: integer
		 
		 */
		
		int status=999;
		con=getConnection();
		pst=con.prepareStatement("select usr_id from tbl_skuser where usr_username=? and usr_password=?");
		pst.setString(1, obj.getUserName());
		pst.setString(2, obj.getPassword());
		rs=pst.executeQuery();
		while(rs.next()){
			status=rs.getInt(1);
		}
		return status;
	}
	public static int getUserId(UserBean obj) throws ClassNotFoundException,SQLException{
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: Check whether user Exist or not
		 * @param  	: UserBean object
		 * @return 	: integer
		 
		 */
		
		int id=0;
		con=getConnection();
		pst=con.prepareStatement("select usr_id from tbl_skuser where usr_username=? and usr_password=?");
		pst.setString(1, obj.getUserName());
		pst.setString(2, obj.getPassword());
		rs=pst.executeQuery();
		while(rs.next()){
			id=rs.getInt(1);
		}
		return id;
		
	}
	public static int getAvailableLoyaltyPoint(UserBean obj) throws ClassNotFoundException,SQLException{
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To get Available Loyalty Point of customer
		 * @param  	: UserBean object
		 * @return 	: integer
		 
		 */
		
		int status=999;
		con=getConnection();
		pst=con.prepareStatement("select usr_availablelp from tbl_skuser where usr_id=?");
		pst.setInt(1, obj.getId());
		rs=pst.executeQuery();
		while(rs.next()){
			status=rs.getInt(1);
		}
		return status;
	}
	public static boolean updateUserLoyaltyPoint(UserBean obj) throws ClassNotFoundException,SQLException {
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To Update User Loyaltypoint
		 * @param  	: UserBean object
		 * @return 	: boolean
		 
		 */
		
		con=getConnection();
		pst=con.prepareStatement("update tbl_skuser set usr_availablelp=?,usr_lastredeemdate=? where usr_id=?");
		pst.setDouble(1, obj.getAvailableLP());
		pst.setDate(2, obj.getLastRedeemDate());
		pst.setInt(3, obj.getId());
		pst.executeUpdate();
		flag=true;
		return flag;
	}
	public static Date getUpdatedRedeemDate(UserBean usr) throws ClassNotFoundException,SQLException {
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To get Last Redeemed Date
		 * @param  	: UserBean object
		 * @return 	: Date
		 
		 */
		
		con=getConnection();
		Date date=null;
		pst=con.prepareStatement("select usr_lastredeemdate from tbl_skuser where usr_id=?");
		pst.setInt(1, usr.getId());
		rs=pst.executeQuery();
		while(rs.next()){
			date=rs.getDate(1);
		}
		flag=true;
		return date;
	}
	public static String getCustomerNameById(int id) throws ClassNotFoundException,SQLException{
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To get Customer Name by Id
		 * @param  	: UserBean object
		 * @return 	: String
		 
		 */
		
		String name="";
		con=getConnection();
		pst=con.prepareStatement("select usr_name from tbl_skuser where usr_id="+id+"");
		rs=pst.executeQuery();
		while(rs.next()){
			name=rs.getString(1);
		}
		return name;
	}
	public static String getCustomerMailId(String name,String password) throws ClassNotFoundException,SQLException {
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To get Customer Email
		 * @param  	: UserBean object
		 * @return 	: integer
		 
		 */
		
		String mail="";
		con=getConnection();
		pst=con.prepareStatement("select usr_email from tbl_skuser where usr_username='"+name+"' and usr_password='"+password+"'");
		rs=pst.executeQuery();
		while(rs.next()){
			mail=rs.getString(1);
		}
		return mail;
	}
	public static String getCustomerMailIdByCusId(int id) throws ClassNotFoundException,SQLException {
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To get Customer Mail id using CusId
		 * @param  	: UserBean object
		 * @return 	: String
		 
		 */
		
		String mail="";
		con=getConnection();
		pst=con.prepareStatement("select usr_email from tbl_skuser where usr_id="+id+"");
		rs=pst.executeQuery();
		while(rs.next()){
			mail=rs.getString(1);
		}
		return mail;
	}
	public static String getCustomerNameByCusId(int id) throws ClassNotFoundException,SQLException {
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To get Available Loyalty Point of customer
		 * @param  	: UserBean object
		 * @return 	: integer
		 
		 */
		
		String name="";
		con=getConnection();
		pst=con.prepareStatement("select usr_name from tbl_skuser where usr_id="+id+"");
		rs=pst.executeQuery();
		while(rs.next()){
			name=rs.getString(1);
		}
		return name;
	}
	public static boolean ChangeUserPassword(UserBean obj) throws ClassNotFoundException, SQLException {
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To change Password
		 * @param  	: UserBean object
		 * @return 	: boolean
		 
		 */
		
		con=getConnection();
		pst=con.prepareStatement("update TBL_SKUSER set USR_PASSWORD=? where USR_USERNAME=?");
		pst.setString(1, obj.getPassword());
		pst.setString(2, obj.getUserName());
		pst.executeUpdate();
		flag=true;
		return flag;
	}
	public static int checkForgotPassword(UserBean usr) throws ClassNotFoundException,SQLException{
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To check for forget password
		 * @param  	: UserBean object
		 * @return 	: integer
		 
		 */
		
		con=getConnection();
		int count=0;
		pst=con.prepareStatement("select count(usr_username) as count from tbl_skuser where usr_username=? and usr_email=?");
		pst.setString(1, usr.getUserName());
		pst.setString(2, usr.getEmail());
		rs=pst.executeQuery();
	
		while(rs.next()){
			count=rs.getInt(1);
			
		System.out.println(count);
		}
		return count;
	}
	public static boolean updatePassword(UserBean usr) throws ClassNotFoundException,SQLException{
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To Update Password
		 * @param  	: UserBean object
		 * @return 	: integer
		 
		 */
		
		con=getConnection();
		String password=null;
		boolean flag=false;
		
		pst=con.prepareStatement("update tbl_skuser set usr_password=? where usr_username=? and usr_email=?");
		pst.setString(1, usr.getPassword());
		pst.setString(2, usr.getUserName());
		pst.setString(3, usr.getEmail());
		
		rs=pst.executeQuery();
	    flag=true;
		
		return flag;
	}
}
