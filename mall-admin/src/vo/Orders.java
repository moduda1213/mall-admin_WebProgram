package vo;

public class Orders {
	private int ordersId; //주문 번호(기본키)
	private int productId; // 물건 고유 번호(외래키)
	private int ordersAmount; //물건 수량
	private int ordersPrice; // 주문한 상품 가격
	private String memberEmail; // 회원 이메일
	private String ordersAddr; // 주문한 회원 주소
	private String ordersState; // 주문 상태
	private String ordersDate; // 상품 주문한 날짜
	
	public int getOrdersId() {
		return ordersId;
	}
	public void setOrdersId(int ordersId) {
		this.ordersId = ordersId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getOrdersAmount() {
		return ordersAmount;
	}
	public void setOrdersAmount(int ordersAmount) {
		this.ordersAmount = ordersAmount;
	}
	public int getOrdersPrice() {
		return ordersPrice;
	}
	public void setOrdersPrice(int ordersPrice) {
		this.ordersPrice = ordersPrice;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getOrdersAddr() {
		return ordersAddr;
	}
	public void setOrdersAddr(String ordersAddr) {
		this.ordersAddr = ordersAddr;
	}
	public String getOrdersState() {
		return ordersState;
	}
	public void setOrdersState(String ordersState) {
		this.ordersState = ordersState;
	}
	public String getOrdersDate() {
		return ordersDate;
	}
	public void setOrdersDate(String ordersDate) {
		this.ordersDate = ordersDate;
	}
}
