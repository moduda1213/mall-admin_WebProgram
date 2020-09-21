package vo;

public class Orders {
	public int ordersId; //주문 번호(기본키)
	public int productId; // 물건 고유 번호(외래키)
	public int ordersAmount; //물건 수량
	public int ordersPrice; // 주문한 상품 가격
	public String memberEmail; // 회원 이메일
	public String ordersAddr; // 주문한 회원 주소
	public String ordersState; // 주문 상태
	public String ordersDate; // 상품 주문한 날짜
}
