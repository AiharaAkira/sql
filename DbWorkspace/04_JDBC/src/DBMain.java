import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;


public class DBMain {

	public static void main(String[] args) throws SQLException {

		//DB���� �۾� - ������
		//CRUD - C     rs- �ʿ���� - select
		
//		excuteQuery = select(R)
//		excuteUpdate = ������ (CUD)
		
//		����
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection con = DriverManager.getConnection(url, "cmw", "cmw");
		System.out.println("���Ἲ��");
		
		Statement st = con.createStatement();
		String sql = "insert into db_test values (db_test_seq.nextval, '��ȣ', 21)";
		
	
		if(st.executeUpdate(sql) == 1) {
			System.out.println("��� ����");
		}else {
			System.out.println("��� ����");
		}
		
		st.close();
		con.close();
		
	}

}