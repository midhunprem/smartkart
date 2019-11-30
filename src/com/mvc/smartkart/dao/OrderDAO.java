package com.mvc.smartkart.dao;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mvc.smartkart.beans.AdminOrderDetailsBean;
import com.mvc.smartkart.beans.AdminReportBean;
import com.mvc.smartkart.beans.ItemBean;
import com.mvc.smartkart.beans.OrderBean;
import com.mvc.smartkart.beans.UserBean;
import com.mvc.smartkart.beans.UserOrderBean;

public class OrderDAO {

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
	public static boolean insertOrderDetails(OrderBean obj) throws ClassNotFoundException,SQLException {
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To Insert order details
		 * @param  	: OrderBean object
		 * @return 	: boolean
		 
		 */
		
		boolean result=false;
		con=getConnection();
		pst=con.prepareStatement("insert into tbl_skorders(ord_date,ord_itemid,ord_usrid,ord_quantity,ord_price,ord_status,ord_lpredeemdate,ord_redeemedamount) values(?,?,?,?,?,?,?,?)");
		pst.setDate(1, obj.getOrderDate());
		pst.setInt(2, obj.getItemId());
		pst.setInt(3, obj.getCustomerId());
		pst.setInt(4, obj.getQuantity());
		pst.setDouble(5, obj.getPrice());
		pst.setString(6, obj.getStatus());;
		pst.setDate(7, obj.getUpdateDate());
		pst.setDouble(8, obj.getRedeemedAmount());
		pst.executeUpdate();
		result=true;
		if(result){
			PreparedStatement pst2=con.prepareStatement("update tbl_skuser set usr_availablelp=? where usr_id=?");
			pst2.setDouble(1, obj.getAvailLp());
			pst2.setInt(2, obj.getCustomerId());
			pst2.executeUpdate();
			flag=true;
		}
		return flag;
	}
	public static ArrayList<AdminOrderDetailsBean> displayOrders() throws ClassNotFoundException,SQLException {
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: Display Order details
		 * @param  	: none
		 * @return 	: ArrayList of AdminOrderDetailsBEan
		 
		 */
		
		ArrayList<AdminOrderDetailsBean> lst=new ArrayList<AdminOrderDetailsBean>();
		con=getConnection();
		pst=con.prepareStatement("select * from tbl_skorders o inner join tbl_skuser u on o.ord_usrid=u.usr_id inner join tbl_skitem i on o.ord_itemid=i.itm_id");
		rs=pst.executeQuery();
		while(rs.next()){
			AdminOrderDetailsBean obj=new AdminOrderDetailsBean();
			obj.setId(rs.getInt(1));
			obj.setDate(rs.getDate(2));
			obj.setCustId(rs.getInt(4));
			obj.setQuantity(rs.getInt(5));
			obj.setPrice(rs.getDouble(6));
			obj.setStatus(rs.getString(7));
			obj.setCusName(rs.getString(11));
			obj.setItmCode(rs.getString(20));
			obj.setItmCategory(rs.getString(21));
			obj.setItmName(rs.getString(22));
			obj.setRedeemedAmount(rs.getDouble(9));
			lst.add(obj);
		}
		return lst;
	}
	public static String getCusromerNameBuId(UserBean usr) throws ClassNotFoundException,SQLException{
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To get Customer name by id
		 * @param  	: UserBean object
		 * @return 	: String
		 
		 */
		
		String name="";
		con=getConnection();
		pst=con.prepareStatement("select usr_name from tbl_skuser where usr_id=?");
		pst.setInt(1, usr.getId());
		rs=pst.executeQuery();
		while(rs.next()){
			name=rs.getString(1);
		}
		return name;
	}
	public static String getItemNameBuId(ItemBean itm) throws ClassNotFoundException,SQLException{
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To get Item name bu id
		 * @param  	: ItemBean object
		 * @return 	: string
		 
		 */
		
		String name="";
		con=getConnection();
		pst=con.prepareStatement("select itm_name from tbl_skitem where itm_id=?");
		pst.setInt(1, itm.getId());
		rs=pst.executeQuery();
		while(rs.next()){
			name=rs.getString(1);
		}
		return name;
	}
	public static boolean updateOrderStatus(OrderBean obj) throws ClassNotFoundException,SQLException{
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To update order status
		 * @param  	: OrderBean object
		 * @return 	: booelan
		 
		 */
		
		con=getConnection();
		pst=con.prepareStatement("update tbl_skorders set ord_status=?,ord_lpredeemdate=? where ord_id=?");
		pst.setString(1, obj.getStatus());
		pst.setDate(2, obj.getUpdateDate());
		pst.setInt(3, obj.getId());
		pst.executeUpdate();
		flag=true;
		return flag;
	}
	public static ArrayList<AdminReportBean> getAdminSalesReport(AdminReportBean adm)throws ClassNotFoundException,SQLException {
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To get AdminSalesReport
		 * @param  	: AdminBean object
		 * @return 	: ArrayList
		 
		 */
		
		con=getConnection();
		ArrayList<AdminReportBean> adr=new ArrayList<AdminReportBean>();
		pst=con.prepareStatement("select o.ord_date,i.itm_category,i.itm_name,itm_price,o.ord_status from tbl_skorders o inner join tbl_skitem i on o.ord_itemid=i.itm_id where o.ord_date between to_date('"+adm.getFromDate()+"', 'yyyy/mm/dd') and to_date('"+adm.getToDate()+"', 'yyyy/mm/dd')");
		rs=pst.executeQuery();
		while(rs.next()){
			AdminReportBean obj=new AdminReportBean();
			obj.setDate(rs.getDate(1));
			obj.setCategory(rs.getString(2));
			obj.setItemName(rs.getString(3));
			obj.setPrice(rs.getDouble(4));
			obj.setStatus(rs.getString(5));
			adr.add(obj);
			
		}
		return adr;
	
	}

	public static ArrayList<UserOrderBean> displayNewOrder(int id) throws ClassNotFoundException,SQLException {
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To display new orders
		 * @param  	: integer
		 * @return 	: ArrayList
		 
		 */
		
		System.out.print(id);
		ArrayList<UserOrderBean> lst=new ArrayList<UserOrderBean>();
		con=getConnection();
		pst=con.prepareStatement("select * from tbl_skorders o inner join tbl_skitem i on o.ord_itemid=i.itm_id and o.ord_usrid=? where o.ord_status='ordered'");
		pst.setInt(1, id);
		rs=pst.executeQuery();
		while(rs.next()){
			UserOrderBean obj=new UserOrderBean();
			obj.setId(rs.getInt(1));
			obj.setOrderDate(rs.getDate(2));
			obj.setItemName(rs.getString(13));
			obj.setPrice(rs.getInt(6));
			obj.setStatus(rs.getString(7));
			lst.add(obj);
		}
		return lst;
	}
	
	
	
	public static ArrayList<UserOrderBean> displayShippedOrder(int id) throws ClassNotFoundException,SQLException {
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To get Shipped orders
		 * @param  	: integer
		 * @return 	: ArrayList
		 
		 */
		
		System.out.print(id);
		ArrayList<UserOrderBean> lst=new ArrayList<UserOrderBean>();
		con=getConnection();
		pst=con.prepareStatement("select * from tbl_skorders o inner join tbl_skitem i on o.ord_itemid=i.itm_id and o.ord_usrid=? where o.ord_status='shipped'");
		pst.setInt(1, id);
		rs=pst.executeQuery();
		while(rs.next()){
			UserOrderBean obj=new UserOrderBean();
			obj.setId(rs.getInt(1));
			obj.setOrderDate(rs.getDate(2));
			obj.setItemName(rs.getString(13));
			obj.setPrice(rs.getInt(6));
			obj.setStatus(rs.getString(7));
			lst.add(obj);
		}
		return lst;
	}
	
	public static ArrayList<UserOrderBean> displayPastOrder(int id) throws ClassNotFoundException,SQLException {
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To get display past order
		 * @param  	: integer
		 * @return 	: array List
		 
		 */
		
		System.out.print(id);
		ArrayList<UserOrderBean> lst=new ArrayList<UserOrderBean>();
		con=getConnection();
		pst=con.prepareStatement("select * from tbl_skorders o inner join tbl_skitem i on o.ord_itemid=i.itm_id and o.ord_usrid=? and o.ord_status='closed'");
		pst.setInt(1, id);
		rs=pst.executeQuery();
		while(rs.next()){
			UserOrderBean obj=new UserOrderBean();
			obj.setId(rs.getInt(1));
			obj.setOrderDate(rs.getDate(2));
			obj.setItemName(rs.getString(13));
			obj.setPrice(rs.getInt(6));
			lst.add(obj);
		}
		return lst;
	}
	public static boolean deleteOrderByCustomer(int id) throws ClassNotFoundException,SQLException{
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To get Delete order by Customer
		 * @param  	: intger
		 * @return 	: boolean
		 
		 */
		
		con=getConnection();
		pst=con.prepareStatement("delete from tbl_skorders where ord_id=?");
		pst.setInt(1, id);
		pst.executeUpdate();
		flag=true;
		return flag;
	}
	public static String getItemNameForAdmin(int id) throws ClassNotFoundException,SQLException {
		
		/**
		 *
		 * @author 	: SmartKart
		 * @date   	: 19/11/2019
		 * @version	: 1.0
		 * @see		: Nothing
		 * @purpose	: To get Available Loyalty Point of customer
		 * @param  	: integer
		 * @return 	: String
		 
		 */
		
		String itemName="";
		con=getConnection();
		pst=con.prepareStatement("select * from tbl_skorders o inner join tbl_skuser u on o.ord_usrid=u.usr_id inner join tbl_skitem i on o.ord_itemid=i.itm_id where o.ord_id="+id+"");
		rs=pst.executeQuery();
		while(rs.next()){
			itemName=rs.getString(22);
		}
		return itemName;
	}
}