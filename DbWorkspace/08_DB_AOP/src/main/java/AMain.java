//절차지향(if, for)
// 객체지향(나눠지기 시작 => 분업(정리, 유지보수))

//새로운 패러다임
//순서대로만 완성하던 시절 지나고
//실생활을 반영한 OOP(객체지향)

//사실OOP도 지났고
//AOP(Aspect Oriented P) : 관점지향 프로그래밍
// 객체지향을 조금 보완하는 정도

//ex... 사람이 학원, 학교, ...에 가는데 (객체지향)
//잠에서 깨고, 세수, 머리, 옷, 신발, 지하철, ... (관점지향)
//중복부분 빼자

public class AMain {

	public static void main(String[] args) {
		
		//function
		//함수? 기능을 반복할 때
		
		Human h = new Human();
		h.goAcademy();
		System.out.println("---------");
		h.goSchool();
	}
	
}
