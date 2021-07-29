package user.persistence;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.pool.ConnectionPoolBean;
import jdbc.util.DAOBase;
import jdbc.util.DBUtil;
import user.domain.UserVO;

public class UserDAO extends DAOBase{
	
	//private ConnectionPoolBean pool;//property
	
	public UserDAO() {
		super(); //ds룩업을 수행함
		System.out.println("UserDAO()생성됨...");
	}
		
//	public ConnectionPoolBean getPool() {
//		return pool;
//	}

//	public void setPool(ConnectionPoolBean pool) {
//		this.pool = pool;
//	}

	/**아이디 중복 체크 -SELECT문 수행
	 * WHERE절에 USERID로 PK(IDX)를 가져온다
	 * RS의 커서를 이동했을 때 TRUE반환하면 "해당 아이디는 이미 존재==>FALSE를 반환"
	 * 					  FALSE를 반환하면 "해당 아이디는 없음"==>TRUE를 반환
	 *  */
	public boolean idCheck(String userid) throws SQLException{
		try {
			//con=DBUtil.getCon();
			//con=pool.getConnection();//ConnectionPool로 부터 이미 준비된 커넥션을 받아오기
			con=ds.getConnection();
					
			String sql="select idx from member where userid=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			rs=ps.executeQuery();
			boolean b=rs.next(); //true를 반환하면 해당 아이디가 있음
			return !b;
		}finally {
			super.close();
		}
	}
	
//	public void close() {
//		try {
//			if(rs!=null) rs.close();
//			if(ps!=null) ps.close();
//			if(con!=null) pool.returnConnection(con);
//			//커넥션 풀에 반납을 한다.
//				
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
	
	/**회원가입-INSERT문 수행
	 * 회원번호: MEMBER_SEQ시퀀스를 이용
	 * 등록일: SYSDATE함수 사용
	 * */
	public int createUser(UserVO user) throws SQLException{
		try {
			//con=DBUtil.getCon();
			//con=pool.getConnection();//ConnectionPool로 부터 이미 준비된 커넥션을 받아오기
			con=ds.getConnection();//DBCP 커넥션 풀에서 커넥션 얻어오기
			String sql="insert into member values(member_seq.nextval,"
					+"?,?,?,?,?,?,?,?,?,sysdate,1000,0)";
			ps=con.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getUserid());
			ps.setString(3, user.getPwd());
			ps.setString(4, user.getHp1());
			ps.setString(5, user.getHp2());
			ps.setString(6, user.getHp3());
			ps.setString(7, user.getZipcode());
			ps.setString(8, user.getAddr1());
			ps.setString(9, user.getAddr2());
			return ps.executeUpdate();
		}finally {
			close();
		}
	}//-------------------------------------
	
	/**총 회원수 구하기*/
	public int getTotalUser() throws SQLException{
		try {
			//con=DBUtil.getCon();
			//con=pool.getConnection();//ConnectionPool로 부터 이미 준비된 커넥션을 받아오기
			con=ds.getConnection();
			String sql="select count(idx) from member";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			boolean b=rs.next();
			int cnt=0;
			if(b) {
				cnt=rs.getInt(1);
				
			}
			return cnt;
		}finally {
			close();
		}
	}//-------------------------------
	/**검색한 총 회원수 구하기*/
	public int getTotalUser(String type,String keyword) throws SQLException{
		try {
			String colName="";
			switch(type) {
			case "1": colName="name";
				break;
			case "2": colName="userid";
				break;
			case "3": colName="hp1||hp2||hp3";
				break;
			}
			
			
			//con=DBUtil.getCon();
			con=ds.getConnection();
			String sql="select count(idx) from member where "+colName+" like ?";
			ps=con.prepareStatement(sql);
			ps.setString(1, "%"+keyword+"%");
			rs=ps.executeQuery();
			boolean b=rs.next();
			int cnt=0;
			if(b) {
				cnt=rs.getInt(1);
				
			}
			return cnt;
		}finally {
			close();
		}
	}//-------------------------------
	public List<UserVO> listUser() throws SQLException{
		try {
			con=DBUtil.getCon();
			String sql="SELECT * FROM MEMBER ORDER BY IDX DESC";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			List<UserVO> arr=makeList(rs);
			return arr;
		}finally {
			close();
		}
	}//-------------------------------------

	public List<UserVO> listUser(int start, int end) throws SQLException{
		try {
			//con=DBUtil.getCon();
			//con=pool.getConnection();//ConnectionPool로 부터 이미 준비된 커넥션을 받아오기
			con=ds.getConnection();
			String sql="select * from(\r\n"
					+ " select rownum rn, a.* from(\r\n"
					+ " (select * from member order by idx desc) a\r\n"
					+ " )\r\n"
					+ " )\r\n"
					+ " where rn between ? and ?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs=ps.executeQuery();
			List<UserVO> arr=makeList(rs);
			return arr;
		}finally {
			close();
		}
	}//-------------------------------------

	private List<UserVO> makeList(ResultSet rs) throws SQLException{
		List<UserVO> arr=new ArrayList<>();
		while(rs.next()) {
			int idx=rs.getInt("idx");
			String name=rs.getString("name");
			String userid=rs.getString("userid");
			String pwd=rs.getString("pwd");
			String hp1=rs.getString("hp1");
			String hp2=rs.getString("hp2");
			String hp3=rs.getString("hp3");
			String zipcode=rs.getString("zipcode");
			String addr1=rs.getString("addr1");
			String addr2=rs.getString("addr2");
			java.sql.Date indate=rs.getDate("indate");
			int mileage=rs.getInt("mileage");
			int mstate=rs.getInt("mstate");
			UserVO user
			=new UserVO(idx,name,userid,pwd,hp1,hp2,hp3,
					zipcode,addr1, addr2,indate,mileage,mstate);
			arr.add(user);
		}//while-------------
		return arr;
	}//-------------------------------------
	/**회원번호(idx- pk)로 회원정보 가져오기*/
	public UserVO selectUser(String idx) throws SQLException{
		try {
			//con=DBUtil.getCon();
			con=ds.getConnection();
			String sql="select * from member where idx=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, idx);
			rs=ps.executeQuery();
			
			List<UserVO> arr=makeList(rs);
			if(arr!=null && arr.size()==1) {
				UserVO user=arr.get(0);
				return user;
			}
			return null;			
		} finally {
			close();
		}
	}//-------------------------------------
	
	public int updateUser(UserVO user) throws SQLException{
		try {
					con=DBUtil.getCon();
					con=ds.getConnection();
				//	String sql="update member set name=?, userid=?, pwd=?, hp1=?, hp2=?, hp3=?";
				//		   sql+=" , zipcode=?, addr1=?, addr2=?, mstate=? where idx=?";
			
					StringBuilder buf
					=new StringBuilder("update member set name=?, userid=?, pwd=?, hp1=?, hp2=?, hp3=?");
					buf.append(" , zipcode=?, addr1=?, addr2=?, mstate=? where idx=?");
					
					 	

					String sql=buf.toString();
				   //String은 원본을 변경하지 못함. immutable(불변성)
				   //문자열을 추가,삭제, 변경 등의 작업을 해야 할 때는
				   //StringBuffer/StringBuilder 클래스를 이용해서 문자열을 편집한 뒤에
				   //toString()메소드를 이용해서 String으로 최종적으로 만들어 사용한다.
					ps=con.prepareStatement(sql);
					ps.setString(1, user.getName());
					ps.setString(2, user.getUserid());
					ps.setString(3, user.getPwd());
					ps.setString(4, user.getHp1());
					ps.setString(5, user.getHp2());
					ps.setString(6, user.getHp3());
					ps.setString(7, user.getZipcode());
					ps.setString(8, user.getAddr1());
					ps.setString(9, user.getAddr2());
					ps.setInt(10, user.getMstate());
					ps.setInt(11, user.getIdx());
					
					int n=ps.executeUpdate();
					return n;
		}finally {
			close();
		}
	}//---------------------
	
	/**PK로 회원정보 삭제 처리*/
	public int deleteUser(String idx)  throws SQLException{
		try{
			//con=DBUtil.getCon();
			con=ds.getConnection();
			String sql="delete from member where idx=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, idx);
			int n=ps.executeUpdate();
			return n;
		}finally {
			close();
		}
	}//---------------------
	
	/**회원정보 검색 - where 절에 like절 사용*/
	
	public List<UserVO> findUser(String type, String keyword)
	throws SQLException{
		try {
			String colName="";
			switch(type) {
			case "1": colName="name";
				break;
			case "2": colName="userid";
				break;
			case "3": colName="hp1||hp2||hp3";
				break;
			}
			//con =DBUtil.getCon();
			con=ds.getConnection();
			String sql="select * from member where "+colName+" like ?";
			
			System.out.println(sql);
			ps=con.prepareStatement(sql);
			ps.setString(1, "%"+keyword+"%");
			rs=ps.executeQuery();
			return makeList(rs);
		}finally {
			close();
		}
	}//-----------------------
	
	/**회원정보 검색 - where 절에 like절 사용, 페이징 처리 추가*/
	
	public List<UserVO> findUser(String type, String keyword, int start, int end)
	throws SQLException{
		try {
			String colName="";
			switch(type) {
			case "1": colName="name";
				break;
			case "2": colName="userid";
				break;
			case "3": colName="hp1||hp2||hp3";
				break;
			}
			//con =DBUtil.getCon();
			con=ds.getConnection();
			String sql="select * from( "
					+ " select rownum rn, a.* from( "
					+ " (select * from member  "
					+ " where "+colName+" like ? "
					+ " order by idx desc) a "
					+ " ) "
					+ " ) "
					+ " where rn between ? and ?";
			
			System.out.println(sql);
			ps=con.prepareStatement(sql);
			ps.setString(1, "%"+keyword+"%");
			ps.setInt(2, start);
			ps.setInt(3, end);
			rs=ps.executeQuery();
			return makeList(rs);
		}finally {
			close();
		}
	}//-----------------------
	
	/**로그인 체크*/
	public UserVO loginCheck(String id, String pwd) throws SQLException,NotUserException{
		
		UserVO user=this.selectUserById(id);
		if(user==null) {  
			//아이디가 존재하지 않는 경우 ==>예외 발생 예정.
			throw new NotUserException(id+"란 아이디는 존재하지 않아요");
		}
		//비번 체크
		String dbPwd=user.getPwd();
		if(!pwd.equals(dbPwd)) {
			//비번 불일치
			throw new NotUserException("비밀번호가 일치하지 않아요");
		}
		
		//회원이 맞다면
		return user;
		
	}
	
	/*탈퇴회원(-1)을 제외한 일반회원, 정지회원들의 데이터만 가지고 있는 member_view를 통해 로그인체크를 하자
	 * 
	 * create or replace view member_view
	 * as
	 * select*from member where mstate>-1;
	 * */

	public UserVO selectUserById(String id) throws SQLException {
		try {
			//con=DBUtil.getCon();
			con=ds.getConnection();
			String sql="select * from member_view where userid=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
			List<UserVO> arr=this.makeList(rs);
			
			if(arr!=null && arr.size()==1) {
				UserVO user=arr.get(0);
				return user;
			}
			return null;
		} finally {
			close();
		}
		
	}
	
	public List<UserVO> zipCheck(String zipcode) throws SQLException {
		try {
			//con=DBUtil.getCon();
			con=ds.getConnection();
			String sql="select * from zipcode where doro_kor||bld_origin_num like ?";
			ps=con.prepareStatement(sql);
			ps.setString(1, "%"+zipcode+"%");			
			rs=ps.executeQuery();
			List<UserVO> arr=this.makeZiplist(rs);						
			return arr;
		} finally {
			close();
		}
	}


	private List<UserVO> makeZiplist(ResultSet rs) throws SQLException {
		List<UserVO> arr=new ArrayList<>();
		while(rs.next()) {
			String zipcode=rs.getString("new_post_code");
			String addr1=rs.getString("sido_kor");
			String addr2=rs.getString("sigungu_kor");
			String addr3=rs.getString("doro_kor");
			String addr4=rs.getString("bld_origin_num");
			if(addr2==null) {
				addr2="";
			}
			
			UserVO user=new UserVO();
			user.setZipcode(zipcode);
			user.setAddr1(addr1+" "+addr2+" "+addr3+" "+addr4);
			System.out.println(user.getAddr1());
			arr.add(user);
		}//while-------------
		return arr;
	}
}//////////////////////////////////












