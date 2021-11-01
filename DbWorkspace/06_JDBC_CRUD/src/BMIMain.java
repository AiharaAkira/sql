import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class BMIMain {

	public static void main(String[] args) throws SQLException, InterruptedException {
		Scanner sc = new Scanner(System.in);
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = "insert into db values(db_seq.nextval, ?, ?, ?, ?, ?)";

		Connection con = DriverManager.getConnection(url, "cmw", "cmw");

		PreparedStatement pstmt = con.prepareStatement(sql);
		// pk, 이름, 체중, 키, bmi(2자리), 결과
		//try catch 사용 시 finally에서 .close로 닫아주자 이 때, Connection
//		, PreparedStatement 는 전역변수 사용
		
		System.out.print("이름 :");
		String name = sc.next();
		System.out.print("체중 :");
		double weight = sc.nextDouble();
		System.out.print("키 :");
		double height = sc.nextDouble();
		
		
		if (height > 10) {
			height /= 100;
		}

		// 2. 계산식
		double bmiCalculator = (weight / (height * height));
		
		
		System.out.printf("BMI 지수 : %.2f", bmiCalculator);
		// 3. 판정
		
		
		System.out.print("계산중.");
		Thread.sleep(300);
		System.out.print(".");
		Thread.sleep(300);
		System.out.print(".");
		Thread.sleep(300);
		System.out.print(".");
		Thread.sleep(300);
		System.out.print(".\n");
		String result = "";
		if (bmiCalculator >= 25) {
			result = "비만";
			System.out.println(name + "님 당신은'비만'입니다");
			System.out.println();
		} else if (bmiCalculator >= 23) {
			result = "과체중";
			System.out.println(name + "님 당신은'과체중'입니다");
			System.out.println();
		} else if (bmiCalculator >= 18.5) {
			result = "정상";
			System.out.println(name + "님 당신은'정상'입니다");
			System.out.println();
		} else {
			result = "저체중";
			System.out.println(name + "님 당신은'저체중'입니다");
			System.out.println();
		}
		
		System.out.println(height);

		pstmt.setString(1, name);
		pstmt.setDouble(2, weight);
		pstmt.setDouble(3, height * 100);
		pstmt.setDouble(4, bmiCalculator);
		pstmt.setString(5, result);
		pstmt.executeUpdate();
		
		
		String sql2 = "select * from db";
		pstmt = con.prepareStatement(sql2);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {

			System.out.println("---------------db 결과 ---------------");
			System.out.println(rs.getInt("d_no"));
			System.out.println(rs.getString("d_name"));
			System.out.println(rs.getDouble("d_weight") + "kg");
			System.out.println(rs.getDouble("d_height") + "cm");
			System.out.println(rs.getDouble("d_bmi"));
			System.out.println(rs.getString("d_result"));
			System.out.println("------------");
			System.out.println();
		}
		
		
		rs.close();
		pstmt.close();
		con.close();

		// 4. 결과: BMI 지수 : 10.14
		// 000님 당신은 '입니다' >> 5. 확인

	}

}
