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
		// pk, �̸�, ü��, Ű, bmi(2�ڸ�), ���
		//try catch ��� �� finally���� .close�� �ݾ����� �� ��, Connection
//		, PreparedStatement �� �������� ���
		
		System.out.print("�̸� :");
		String name = sc.next();
		System.out.print("ü�� :");
		double weight = sc.nextDouble();
		System.out.print("Ű :");
		double height = sc.nextDouble();
		
		
		if (height > 10) {
			height /= 100;
		}

		// 2. ����
		double bmiCalculator = (weight / (height * height));
		
		
		System.out.printf("BMI ���� : %.2f", bmiCalculator);
		// 3. ����
		
		
		System.out.print("�����.");
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
			result = "��";
			System.out.println(name + "�� �����'��'�Դϴ�");
			System.out.println();
		} else if (bmiCalculator >= 23) {
			result = "��ü��";
			System.out.println(name + "�� �����'��ü��'�Դϴ�");
			System.out.println();
		} else if (bmiCalculator >= 18.5) {
			result = "����";
			System.out.println(name + "�� �����'����'�Դϴ�");
			System.out.println();
		} else {
			result = "��ü��";
			System.out.println(name + "�� �����'��ü��'�Դϴ�");
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

			System.out.println("---------------db ��� ---------------");
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

		// 4. ���: BMI ���� : 10.14
		// 000�� ����� '�Դϴ�' >> 5. Ȯ��

	}

}
