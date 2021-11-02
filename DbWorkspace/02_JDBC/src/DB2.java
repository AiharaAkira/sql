import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DB2 {

	public static void main(String[] args) throws SQLException {
		//������ con, st, rs
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = "select*from db_test";
		//����
		Connection con = DriverManager.getConnection(url, "cmw", "cmw");
		//���൵��
		Statement st = con.createStatement();
		//��� ���
		ResultSet rs = st.executeQuery(sql);
		
		
		rs.next();
		
		if(rs.next()) {
			String name = rs.getString("d_name");
			int age = rs.getInt("d_age");
			System.out.println(name);
			System.out.println(age);
		}
		
		rs.close();
		st.close();
		con.close();
		
		
	}

}