import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;


public class DBMain3 {

	public static void main(String[] args) throws SQLException {

		//���� ���̺��� ���� �ϳ� �ֱ�
		
		Scanner k = new Scanner(System.in);
		
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection con = DriverManager.getConnection(url, "cmw", "cmw");
		System.out.println("���Ἲ��");
		
		//�Է� ��
		System.out.println("�̸� : ");
		String name = k.next();
		System.out.println("����Ŀ : ");
		String maker = k.next();
		System.out.println("���� : ");
		int weight = k.nextInt();
		System.out.println("���� : ");
		int price = k.nextInt();
		
		Statement st = con.createStatement();
		String sql = "insert into SNACK values(SNACK_seq.nextval, '"+name +"', '"+maker+"', "+ weight+", " +price+", "+ "sysdate)";
		
	
		if(st.executeUpdate(sql) == 1) {
			System.out.println("��� ����");
		}else {
			System.out.println("��� ����");
		}
		
		
		st.close();
		con.close();
	}

}