import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;


public class DBMain3 {

	public static void main(String[] args) throws SQLException {

		//과자 테이블에 과자 하나 넣기
		
		Scanner k = new Scanner(System.in);
		
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection con = DriverManager.getConnection(url, "cmw", "cmw");
		System.out.println("연결성공");
		
		//입력 폼
		System.out.println("이름 : ");
		String name = k.next();
		System.out.println("메이커 : ");
		String maker = k.next();
		System.out.println("무게 : ");
		int weight = k.nextInt();
		System.out.println("가격 : ");
		int price = k.nextInt();
		
		Statement st = con.createStatement();
		String sql = "insert into SNACK values(SNACK_seq.nextval, '"+name +"', '"+maker+"', "+ weight+", " +price+", "+ "sysdate)";
		
	
		if(st.executeUpdate(sql) == 1) {
			System.out.println("등록 성공");
		}else {
			System.out.println("등록 실패");
		}
		
		
		st.close();
		con.close();
	}

}
