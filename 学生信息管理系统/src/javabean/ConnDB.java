package javabean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class ConnDB {
	private static String URL = "jdbc:mysql://localhost:3306/";	//数据库连接  "student"是数据库名
	private static String USER = "root";//数据库账号
	private static String PASSWORD = "root";//数据库密码
	private  Connection conn = null;
	
	
	/**
	 * 无参构造函数默认的数据库为student
	 */
	public ConnDB() {
		try {
			URL="jdbc:mysql://localhost:3306/student?characterEncoding=utf-8";
			Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
			e.printStackTrace();
			}
	}
	
	public ConnDB(String databaseName) {
		try {
		Class.forName("com.mysql.jdbc.Driver");
		URL=URL+databaseName+"?characterEncoding=utf-8";
		} catch (ClassNotFoundException e) {
		e.printStackTrace();
		}
	}
	
	//获取数据库连接
	public Connection getConnction() {
	try {
	conn = DriverManager.getConnection(URL, USER, PASSWORD);
	} catch (SQLException e) {
	e.printStackTrace();
	}
	return conn;
	}
	
	
	//关闭数据库连接
	public void closeCon(Connection con) throws Exception{
	if(con!=null){
	con.close();
	}
	}
	
	 /** 
     * 根据传入的SQL语句返回一个结果集 
     *  
     * @param sql 
     * @return 
     * @throws Exception 
     */  
	public ResultSet select(String sql) throws Exception {  
        Statement stmt = null;  
        ResultSet rs = null;  
        try {  
            stmt = conn.createStatement();  
            rs = stmt.executeQuery(sql);  
            return rs;  
        } catch (SQLException sqle) {  
            throw new SQLException("select data exception: "  
                    + sqle.getMessage());  
        } catch (Exception e) {  
            throw new Exception("System e exception: " + e.getMessage());  
        }  
  
    }  
  
    /** 
     * 根据传入的SQL语句向数据库增加一条记录 
     *  
     * @param sql 
     * @throws Exception 
     */  
	public void insert(String sql) throws Exception {  
        PreparedStatement ps = null;  
        try {   
             ps = conn.prepareStatement(sql);  
             ps.executeUpdate();   
        } catch (SQLException sqle) {  
            throw new Exception("insert data exception: " + sqle.getMessage());  
        } finally {  
            try {  
                if (ps != null) {  
                    ps.close();  
                }  
            } catch (Exception e) {  
                throw new Exception("ps close exception: " + e.getMessage());  
            }  
        }  
        try {  
            if (conn != null) {  
                conn.close();  
            }  
        } catch (Exception e) {  
            throw new Exception("connection close exception: " + e.getMessage());  
        }  
    }  
  
    /** 
     * 根据传入的SQL语句更新数据库记录 
     *  
     * @param sql 
     * @throws Exception 
     */  
	public void update(String sql) throws Exception {  
        PreparedStatement ps = null;  
        try {  
            ps = conn.prepareStatement(sql);  
            ps.executeUpdate();  
        } catch (SQLException sqle) {  
            throw new Exception("update exception: " + sqle.getMessage());  
        } finally {  
            try {  
                if (ps != null) {  
                    ps.close();  
                }  
            } catch (Exception e) {  
                throw new Exception("ps close exception: " + e.getMessage());  
            }  
        }  
        try {  
            if (conn != null) {  
                conn.close();  
            }  
        } catch (Exception e) {  
            throw new Exception("connection close exception: " + e.getMessage());  
        }  
    }  
  
    /** 
     * 根据传入的SQL语句删除一条数据库记录 
     *  
     * @param sql 
     * @throws Exception 
     */  
	public void delete(String sql) throws Exception {   
        PreparedStatement ps = null;  
        try {  

            ps = conn.prepareStatement(sql);  
            ps.executeUpdate();  
        } catch (SQLException sqle) {  
            throw new Exception("delete data exception: " + sqle.getMessage());  
        } finally {  
            try {  
                if (ps != null) {  
                    ps.close();  
                }  
            } catch (Exception e) {  
                throw new Exception("ps close exception: " + e.getMessage());  
            }  
        }  
        try {  
            if (conn != null) {  
                conn.close();  
            }  
        } catch (Exception e) {  
            throw new Exception("connection close exception: " + e.getMessage());  
        }  
    }  
	
	
	public static void main(String[] args) {
		ConnDB connDB=new ConnDB();
		try {
			Connection connection=connDB.getConnction();
			System.out.println("连接成功");
			Statement stmt=connection.createStatement();
			ResultSet rs=stmt.executeQuery("select * from studentdata");
			while(rs.next()){
				System.out.println(rs.getString(1));
			}
			connDB.closeCon(connection);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}

