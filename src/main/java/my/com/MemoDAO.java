package my.com;
import java.sql.*;
import java.util.*;
import jdbc.util.DBUtil;

//영속성계층(Persistence Layer)
//DAO : Data Access Object
//데이터베이스에 접근해서 CRUD 기능을 수행하는 객체
public class MemoDAO {
	public Connection con;
	public PreparedStatement ps;
	public ResultSet rs;
	
	public boolean insertMemo(MemoVO memo) {
		try {			
			con=DBUtil.getCon();
			String sql="insert into memo(name,msg,idx,wdate)"
					+" values(?,?,memo_seq.nextval,sysdate)";
			ps=con.prepareStatement(sql);
			ps.setString(1, memo.getName());
			ps.setString(2, memo.getMsg());
			int cnt=ps.executeUpdate();
			return (cnt>0)? true:false;
		}catch(SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			closeAll();
		}
	}
	
	private void closeAll() {
		try {
			if(rs!=null) rs.close();
			if(ps!=null) ps.close();
			if(con!=null) con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}//----------------------------------

	/**글번호(PK)로 delete문을 수행하는 메소드*/
	public boolean deleteMemo(int idx) {
		 try {
			 con=DBUtil.getCon();
			 String sql="delete from memo where idx=?";
			 ps=con.prepareStatement(sql);
			 ps.setInt(1, idx);
			 int cnt=ps.executeUpdate();
			 return (cnt>0)? true: false;
		 }catch(SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			closeAll();
		}
	}//----------------------------------
	/**update문을 수행하는 메소드*/
	public boolean updateMemo(MemoVO memo) {
		try {
			con=DBUtil.getCon();
			String sql="update memo set name=?, msg=? where idx=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, memo.getName());
			ps.setString(2, memo.getMsg());
			ps.setInt(3, memo.getIdx());
			int cnt=ps.executeUpdate();
			return (cnt>0)? true: false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			closeAll();
		}
	}//----------------------------------
	
	public ArrayList<MemoVO> selectMemoAll() {
		try {
			con=DBUtil.getCon();
			String sql="select idx, name, msg, wdate from memo order by idx desc";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			
			ArrayList<MemoVO> arrList=makeList(rs);
			
			return arrList;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			closeAll();
		}
	}//selectMemoAll()--------------------

	private ArrayList<MemoVO> makeList(ResultSet rs) throws SQLException {
		ArrayList<MemoVO> arrList=new ArrayList<>();
		while(rs.next()) {
			int idx=rs.getInt("idx");
			String name=rs.getString("name");
			String msg=rs.getString("msg");
			java.sql.Date wdate=rs.getDate("wdate");
			MemoVO memo=new MemoVO(idx,name,msg,wdate);//하나의 레코드
			arrList.add(memo);
		}//while----
		return arrList;
	}//makeList()-----------------------------------------

	/**select문 where절 글번호로 검색해서 해당글을 가져오는 메소드*/
	public MemoVO selectMemo(int idx) {
		try {
			con =DBUtil.getCon();
			String sql="select * from memo where idx=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			ArrayList<MemoVO> arrList=makeList(rs);
			//pk로 가져오므로 데이터가 있다면 1개 있음
			if(arrList!=null && arrList.size()==1) {
				MemoVO memo=arrList.get(0);
				return memo;
			}
			return null;			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			closeAll();
		}

	}

	/**select문 where절  like절 이용
	 * 메모내용(msg)에서 검색어를 찾아 가져오는 메소드
	 * */
	public ArrayList<MemoVO> findMemo(String keyword) {
		try {
			con=DBUtil.getCon();
			String sql="select * from memo where msg like ?";
			ps=con.prepareStatement(sql);
			ps.setString(1, "%"+keyword+"%");
			rs=ps.executeQuery();
			return makeList(rs);			
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			closeAll();
		}
	}
}////////////////////////////////////////////////////////////







