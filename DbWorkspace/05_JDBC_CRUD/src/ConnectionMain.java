import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionMain {

	public static void main(String[] args) throws SQLException {
		
		//���� �õ� -> �ּ� -> ������ db����Ŀ �Ǵ�
		// �ڵ����� ����Ŀ �´� driver ã����
		
		// ���� 
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection con = DriverManager.getConnection(url, "cmw", "cmw");
		System.out.println("���Ἲ��");
		con.close();
		
		
		
		
	}

}
