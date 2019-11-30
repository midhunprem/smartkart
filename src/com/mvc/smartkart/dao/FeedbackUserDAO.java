package com.mvc.smartkart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mvc.smartkart.beans.FeedbackUserBean;

public class FeedbackUserDAO {
	static Connection con = null;
	static PreparedStatement pst = null;
	static ResultSet rs = null;
	static boolean flag = false;

	public static Connection getConnection() throws ClassNotFoundException, SQLException {



		DBDAO.Connect();
		con = DBDAO.getDbCon();
		return con;
	}

	public static boolean insertFeedback(FeedbackUserBean feedbackbean) throws SQLException {
		

		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 16/11/2019
		 * @version	: 1.0
		 * @see		: Nothong
		 * @purpose	: To insert Feedback
		 * @param  	: FeedbackUserBean object
		 * @return 	: boolean
		 
		 */

		try {

			con = getConnection();
			pst = con.prepareStatement("insert into TBL_SKFEEDBACK(fdb_name,fdb_date,fdb_comment,FDB_CUdID)values(?,?,?,?)");
			pst.setString(1, feedbackbean.getName());
			pst.setString(2, feedbackbean.getDate());
			pst.setString(3, feedbackbean.getComment());
			pst.setInt(4, feedbackbean.getCid());
			pst.executeUpdate();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;

	}

	public static ArrayList<FeedbackUserBean> viewFeed(String name) throws SQLException {
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 16/11/2019
		 * @version	: 1.0
		 * @see		: Nothong
		 * @purpose	: To View FeedBack
		 * @param  	: String
		 * @return 	: ArrayList
		 
		 */
		
		ArrayList<FeedbackUserBean> ub = new ArrayList<FeedbackUserBean>();
		try {
			con = getConnection();
			pst = con.prepareStatement("select * from TBL_SKFEEDBACK where fdb_name=?");
			pst.setString(1, name);
			rs = pst.executeQuery();
			while (rs.next()) {
				FeedbackUserBean feedbackuser = new FeedbackUserBean();
				feedbackuser.setId(rs.getInt(1));
				feedbackuser.setDate(rs.getString(3));
				feedbackuser.setComment(rs.getString(4));
				ub.add(feedbackuser);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return ub;

	}


	public static boolean updateFeedback(FeedbackUserBean feedbackuser) throws SQLException {
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 16/11/2019
		 * @version	: 1.0
		 * @see		: Nothong
		 * @purpose	: To update Feedback
		 * @param  	: FeedbackUserBean object
		 * @return 	: boolean
		 
		 */
		
		try {
			con=getConnection();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pst=con.prepareStatement("update TBL_SKFEEDBACK set fdb_date='"+feedbackuser.getDate()+"',fdb_comment='"+feedbackuser.getComment()+"' where fdb_name='"+feedbackuser.getName()+"'");
		pst.executeUpdate();
		flag=true;
		return flag;
	}

	public static boolean deleteFeed(FeedbackUserBean feedbackuser) throws SQLException {
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 16/11/2019
		 * @version	: 1.0
		 * @see		: Nothong
		 * @purpose	: To delete Feedback
		 * @param  	: FeedbackUserBean object
		 * @return 	: boolean
		 
		 */
		
		try {
			con = getConnection();
			pst = con.prepareStatement("delete from TBL_SKFEEDBACK where fdb_id=?");
			pst.setInt(1, feedbackuser.getId());
			pst.executeUpdate();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public static ArrayList<FeedbackUserBean> viewAdminFeed() throws SQLException {
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 16/11/2019
		 * @version	: 1.0
		 * @see		: Nothong
		 * @purpose	: To display Feddback 
		 * @param  	: Nothing
		 * @return 	: ArrayList
		 
		 */
		
		ArrayList<FeedbackUserBean> lb = new ArrayList<FeedbackUserBean>();
		try {
			con = getConnection();
			pst = con.prepareStatement("select * from TBL_SKFEEDBACK");
			rs = pst.executeQuery();
			while (rs.next()) {
				FeedbackUserBean feedbackuserbean = new FeedbackUserBean();
				feedbackuserbean.setId(rs.getInt(1));
				feedbackuserbean.setName(rs.getString(2));
				feedbackuserbean.setDate(rs.getString(3));
				feedbackuserbean.setComment(rs.getString(4));
				lb.add(feedbackuserbean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return lb;
	}

}
