package tennivis;
import java.sql.*;

public class DatabaseTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String url="jdbc:sqlserver://sql2k5h.appliedi.net:1433;databaseName=tennivis;user=tpolk;password=costello;";
				try
				{
				//Loading the driver...
				Class.forName( "com.microsoft.sqlserver.jdbc.SQLServerDriver" );
				System.out.println("Found the driver class!");
				}
				catch( java.lang.ClassNotFoundException e )
				{
					System.out.println(e);
				}

				try
				{
				 Connection m_Conn = DriverManager.getConnection(url);
				 if (m_Conn !=null){
					 System.out.println("Successfully connected to the database!");
				 }
				}catch( java.sql.SQLException e ){
					System.out.println(e);
				}
		}

}
