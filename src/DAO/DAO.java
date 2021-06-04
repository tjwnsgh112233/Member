package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import JDBC.JDBC;
import VO.AVO;
import VO.MVO;

public class DAO {
	Connection conn = null;
	ResultSet rs = null;
	PreparedStatement stmt = null;
	
	public ArrayList<MVO> getmemberList(){
		ArrayList<MVO> M = null;
		
		try {
			conn = JDBC.getConnection();
			String sql = "select custno, custname, phone, address, joindate, decode(grade,'A','VIP','B','일반','C','직원') grade, city from m order by custno asc ";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			M = new ArrayList<MVO>();
			
			while(rs.next()) {
				MVO m = new MVO();
				
				m.setAddress(rs.getString("address"));
				m.setCity(rs.getString("city"));
				m.setPhone(rs.getString("phone"));
				m.setCustname(rs.getString("custname"));
				m.setCustno(rs.getInt("custno"));
				m.setGrade(rs.getString("grade"));
				m.setJoindate(rs.getDate("joindate"));
				
				M.add(m);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBC.close(rs, stmt, conn);
		}
		return M;
	}

	public ArrayList<AVO> getamountList(){
		ArrayList<AVO> A = null;
		
		try {
			 conn = JDBC.getConnection();
			 String sql = "select m.custno, custname,decode(grade,'A','VIP','B','일반','C','직원') grade,sum(price) price from a a , m m where a.custno = m.custno group by m.custno, custname, grade order by price desc";
			 stmt = conn.prepareStatement(sql);
			 rs = stmt.executeQuery();
			 
			 A = new ArrayList<AVO>();
			 
			 while(rs.next()) {
				 AVO a = new AVO();
				 
				 a.setCustname(rs.getString("custname"));
				 a.setCustno(rs.getInt("custno"));
				 a.setGrade(rs.getString("grade"));
				 a.setPrice(rs.getInt("price"));
				 
				 A.add(a);
			 }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBC.close(rs, stmt, conn);
		}
		return A;
	}
	
	public int MAXNO() {
		int max = 0;
		
		try {
			conn = JDBC.getConnection();
			String sql = "select nvl(max(custno),0)+1 max from M ";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				max = rs.getInt("max");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBC.close(rs, stmt, conn);
		}
		return max;
	}

	public int add(MVO vo) {
		int cnt = 0;
		
		try {
			conn = JDBC.getConnection();
			String sql = "insert into m values(?,?,?,?,?,?,?) ";
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, vo.getCustno());
			stmt.setString(2, vo.getCustname());
			stmt.setString(3, vo.getPhone());
			stmt.setString(4, vo.getAddress());
			stmt.setDate(5, vo.getJoindate());
			stmt.setString(6, vo.getGrade());
			stmt.setString(7, vo.getCity());
			
			cnt  = stmt.executeUpdate();
			
			if(cnt > 0) {
				conn.commit();
			}
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			JDBC.close(rs, stmt, conn);
		}
		return cnt;
	}
	
	public MVO getmember(int no) {
		MVO m = null;
		
		try {
			conn = JDBC.getConnection();
			String sql = "select * from m where custno = ? ";
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, no);
			
			rs = stmt.executeQuery();
			
			m = new MVO();
			
			if(rs.next()) {
				m.setAddress(rs.getString("address"));
				m.setCity(rs.getString("city"));
				m.setCustname(rs.getString("custname"));
				m.setCustno(rs.getInt("custno"));
				m.setGrade(rs.getString("grade"));
				m.setJoindate(rs.getDate("joindate"));
				m.setPhone(rs.getString("phone"));
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBC.close(rs, stmt, conn);
		}
		return m;
	}

	public int update(MVO vo, int no) {
		int cnt = 0;
		
		try {
			conn = JDBC.getConnection();
			String sql = "update M set custname=?,phone=?, address=?,joindate=?,grade=?,city=? where custno=? ";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getCustname());
			stmt.setString(2, vo.getPhone());
			stmt.setString(3, vo.getAddress());
			stmt.setDate(4, vo.getJoindate());
			stmt.setString(5, vo.getGrade());
			stmt.setString(6, vo.getCity());
			stmt.setInt(7, no);
			
			cnt = stmt.executeUpdate();
			
			if(cnt > 0) {
				conn.commit();
			}
			
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			JDBC.close(stmt, conn);
		}
		return cnt;
	}

	public int delete(int no) {
		int cnt = 0;
		
		try {
			conn = JDBC.getConnection();
			String sql = "delete m where custno=? ";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, no);
			
			cnt = stmt.executeUpdate();
			
			if(cnt > 0) {
				conn.commit();
			}
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			JDBC.close(stmt, conn);
		}
		return cnt;
	}
}
