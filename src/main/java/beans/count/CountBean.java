package beans.count;

//Java Beans
public class CountBean {
	
	private int count;//property => input name과 동일하게 주는 것이 편리함
	
	public CountBean() {
		System.out.println("CountBean()생성자...");
	}
	
	public void setCount(int val) {
		count+=val;//누적
		System.out.println("setCount()호출됨..."+val);
	}
	
	public int getCount() {
		return count;
	}

}
