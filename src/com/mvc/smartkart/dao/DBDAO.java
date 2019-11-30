package com.mvc.smartkart.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBDAO {
	
	private static Connection dbCon=null;
	private static String driver;
	private static String dbUrl;
	private static String userName;
	private static String password;
	
	//------------------Init method Starts-------------------------------
	
	private static void init(){
		
		/**
		 *
		 * @author 	: Midhun Prem
		 * @date   	: 30/10/2019
		 * @version	: 1.0
		 * @see		: Nothong
		 * @purpose	: Initialize database connection variables
		 * @param  	: Nothing
		 * @return 	: Nothing
		 
		 */
		driver = "oracle.jdbc.driver.OracleDriver";
		dbUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		userName = "midhun";
		password="midhun";
	}
	
	//------------------Init method Ends---------------------------------
	
	//--------------Connection--------------------------------------
	
	public static void Connect() throws ClassNotFoundException,SQLException{
		
		/**
		 *
		 * @author 	: Midhun Prem
		 * @date   	: 30/10/2019
		 * @version	: 1.0
		 * @see		: Nothong
		 * @purpose	: Establish a new connection
		 * @param  	: Nothing
		 * @return 	: Connection
		 
		 */
		init();
		Class.forName(driver);
		Connection con = DriverManager.getConnection(dbUrl,userName,password);
		setDbCon(con);
	}
	
	//---------------------------------------------------
	
	//---------------------------------------------------
	
	public static void setDbCon(Connection con){
		
		/**
		 *
		 * @author 	: Midhun Prem
		 * @date   	: 30/10/2019
		 * @version	: 1.0
		 * @see		: Nothong
		 * @purpose	: Setting Connection
		 * @param  	: Connection
		 * @return 	: Nothing
		 
		 */
		
		dbCon=con;
	}
	
	//---------------------------------------------------
	
	//-------------------------------------------------
	
	public static Connection getDbCon(){
		
		/**
		 *
		 * @author 	: Midhun Prem
		 * @date   	: 30/10/2019
		 * @version	: 1.0
		 * @see		: Nothong
		 * @purpose	: Getting Connection
		 * @param  	: Nothing
		 * @return 	: Connection
		 
		 */
		
		return dbCon;
	}
	
	//-------------------------------------------------------
	
	public static void closeConnection() throws SQLException{
		
		/**
		 *
		 * @author 	: Midhun Prem
		 * @date   	: 30/10/2019
		 * @version	: 1.0
		 * @see		: Nothong
		 * @purpose	: Setting Connection
		 * @param  	: Nothing
		 * @return 	: Nothing
		 
		 */
		
		dbCon.close();
	}
	
	//---------------------------------------------------------------
}
