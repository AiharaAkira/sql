import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Test {

	public static void main(String[] args) throws SQLException {

		// �������̺� �ִ°� ��ü ���
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		//1.����
		Connection con = DriverManager.getConnection(url, "cmw", "cmw");
		System.out.println("���Ἲ��");
		
		//2.���� ���� ����
		Statement st = con.createStatement();
		
		//3. ��� �ޱ�
		String sql = "select * from SNACK";
		ResultSet rs = st.executeQuery(sql);
		
		while(rs.next()) {
			String name = rs.getString("s_name");
			
			System.out.println(name);
		}
		
		
		rs.close();
		st.close();
		con.close();
		
		

	}

}
