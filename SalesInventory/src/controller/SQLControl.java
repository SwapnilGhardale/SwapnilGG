
package controller;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Product;
import data.DB;

public class SQLControl {

    Connection con;
    Statement st;
    ResultSet rs;

    public SQLControl() {
    }

    public void loadDB() {
        try {
            con = DB.getConnection();
            st = con.createStatement();
        } catch (Exception ex) {
            System.out.println("Cant load DB");
        }

    }

    public ArrayList<Product> selectAllProduct() throws SQLException {
        ArrayList<Product> pArrList = new ArrayList<>();
        loadDB();
        String sql = "select * from stock";
        try {
            rs = st.executeQuery(sql);
            while (rs.next()) {
                String pId = rs.getString(1);
                String pName = rs.getString(2);
              //int pPrice = Integer.parseInt(rs.getString(3));
                int pPrice=(int) rs.getFloat(3);
                int ptQuant=rs.getInt(4);
                pArrList.add(new Product(pId, pName, pPrice,ptQuant));
            }

        } catch (SQLException ex) {
            System.out.println("SQL Error");
        } finally {
            //disconnect db
            rs.close();
            st.close();
            con.close();
        }
        return pArrList;
    }

    public ArrayList<Product> selectProduct(String id) throws SQLException {
        ArrayList<Product> arrCart = new ArrayList<>();
        loadDB();
        String xSQL = "select * from stock where p_id = " + id + " ";
        try {
            rs = st.executeQuery(xSQL);
            if (rs.next()) {
                String pId = rs.getString(1);
                String pName = rs.getString(2);
                //int pPrice = Integer.parseInt(rs.getString(3));
                int pPrice=(int)rs.getFloat(3);
                int ptQuant=(int)rs.getInt(4);
                arrCart.add(new Product(pId, pName, pPrice,ptQuant));
            }

        } catch (SQLException ex) {
            System.out.println("SQL Error");
        } finally {
            //disconnect db
       //    rs.close();
           st.close();
            con.close();
        }
        return arrCart;
    }


    public void insertOrder(String date, String payment,String CustomerName,int TransPrice,String Transtype,String addr,String mob,String mob1) throws SQLException {
        loadDB();

        try {
            //Assume a valid connection object conn
            con.setAutoCommit(false);
            String sql;
            //transaction insert order to database
            if(Transtype.equals("Offline")) {
            sql= "insert into OrderTBL(OrderDate,PaymentMethod,CustomerName,Transtotal,Transtype,MobileNumber) values ('" + date + "','" + payment + "','" + CustomerName + "'," + TransPrice + ",'" + Transtype +"','"+mob+ "')";
            }
            else {
            sql= "insert into OrderTBL(OrderDate,PaymentMethod,CustomerName,Transtotal,Transtype,CustomerAddress,MobileNumber,AltMobileNumber) values ('" + date + "','" + payment + "','" + CustomerName + "'," + TransPrice + ",'" + Transtype + "','" + addr + "','" + mob + "','" + mob1 + "')";	
            }
            st.executeUpdate(sql);
            // If there is no error.
            con.commit();

        } catch (SQLException ex) {
            System.out.println("SQL Errorc");
            //if have any error
            con.rollback();
        } finally {
            st.close();
            con.close();
        }

    }



    public int getlastedOrID() throws SQLException {
        loadDB();
        int orID = -1;
        try {
            String sql = "select OrderID from OrderTBL order by OrderID DESC ";
            rs = st.executeQuery(sql);
            if(rs.next()) {
                orID = rs.getInt("OrderID");
            }
            
        } catch (SQLException ex) {
            System.out.println("SQL Errora");
        } finally {
       //     rs.close();
            st.close();
            con.close();
        }

        return orID;
    }

    public void insertOrderLine(int orderID, String pID, int quantity, int price) throws SQLException {
        loadDB();
        //Assume a valid connection object conn

        try {
            con.setAutoCommit(false);

            //transaction insert order line to database
            String sql = "insert into OrderLineTBL values (" + orderID + "," + pID + "," + quantity + "," + price + ")";
            st.executeUpdate(sql);
            // If there is no error.
            con.commit();
        } catch (SQLException ex) {
            System.out.println("SQL Errorb");
            //if have any error
            con.rollback();
        } finally {
            st.close();
            con.close();
        }
    }

    public void decreasestock(String pID,int quantity) throws SQLException
    {
    	loadDB();
    	try {
    		con.setAutoCommit(false);
    		int pquant=0;
    		String sql="select stk from stock where p_id='"+pID+"'";
    		rs=st.executeQuery(sql);
    		if(rs.next())
    		{
    			pquant=rs.getInt(1);
    		}
    		sql="update stock set stk="+ (pquant-quantity) +" where p_id='"+pID+"'";
    	st.executeUpdate(sql);
    	con.commit();
    	
    	}
    	catch(SQLException e)
    	{
    		System.out.println("Stock decrease failed");
    		con.rollback();
    	}
    	finally {
    		st.close();
    		con.close();
    	}
    }
    
    public int addProduct(Product p) throws SQLException
    {
    	loadDB();
    	int s=0;
    	try {
    	con.setAutoCommit(false);
    	st.clearBatch();
    	String sql="insert into stock(p_id,name,price,stk) values('"+p.getpId()+"',"+"\""+p.getpName()+"\""+","+p.getpPrice()+","+p.getptQuant()+")";
    
    	s= st.executeUpdate(sql);
    	con.commit();	
    	}
    	catch(SQLException e)
    	{
    		System.out.println("Add Product Failed...");
    		con.rollback();
    	}
    	
    	finally { 		
    		st.close();
    		con.close();		
    	}
    return s;
	}
 
    
    public int chkstatus(int oid) throws SQLException {
    	loadDB();
    	int c=0;
    	try {
    		String sql="select status from ordertbl where orderid="+oid;
    		rs=st.executeQuery(sql);
    		if(rs.next()) {
        		String sts=rs.getString(1);
    			if(sts==null)
    				c=1;
    			else if(sts.contentEquals("Processing"))
						c=2;
    		}
    	}catch(SQLException e)
    	{
    		System.out.println("Check Status Failed");
    		
    		con.rollback();
    		return 0;
    	}
    	finally {
    		st.close();
    		con.close();
    	}
    	return c;
    }
    
    public void delivery(int oid,String status1) throws SQLException {
    	loadDB();
    	try {
    		con.setAutoCommit(false);
    		st.clearBatch();
    		String sql="update ordertbl set status="+status1+" where orderID="+oid+"";
    		st.executeUpdate(sql);
    		con.commit();
    	}catch(Exception e)
    	{
    		System.out.println("Status changing failed");
    		con.rollback();
    	}
    	finally {
    		st.close();
    		con.close();
    	}
    }
    
}
