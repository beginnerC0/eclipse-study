package jdbc.util;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class DAOBase {
	
	protected DataSource ds;
	
	protected Connection con;
	protected PreparedStatement ps;
	protected ResultSet rs;
	
	public DAOBase() {
		try {
			Context ctx=new InitialContext(); //JNDI (Java Naming and Directory Interface)
			Context wasCtx=(Context)ctx.lookup("java:comp/env");
			ds=(DataSource)wasCtx.lookup("myoracle/tis_shop");
			System.out.println("ds·è¾÷ ¼º°ø: "+ds);
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
				
	}
	
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(ps!=null) ps.close();
			if(con!=null) con.close();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	

}
