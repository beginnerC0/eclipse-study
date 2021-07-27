package my.com;
import java.sql.*;
//VO: Value Object 
//화면단이나 DB쪽에서 가져온 값을 담아주는 객체
//Domain계층  : 로직에 따라 화면계층과 영속성 계층에서 데이터를 주고받을 때 사용한다
public class MemoVO implements java.io.Serializable{
	private int idx;
	private String name;
	private String msg;
	private Date wdate;
	
	public MemoVO() {
		
	}
	public MemoVO(int idx, String name, String msg, Date wdate) {
		super();
		this.idx = idx;
		this.name = name;
		this.msg = msg;
		this.wdate = wdate;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Date getWdate() {
		return wdate;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	
	
	
	
}////////////////////////////////
