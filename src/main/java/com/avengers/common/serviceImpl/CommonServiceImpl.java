package com.avengers.common.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.avengers.common.service.CommonService;
import com.avengers.db.dto.BoardVO;

public class CommonServiceImpl implements CommonService{

	protected SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int loginConfirm(String id, String pw) throws SQLException{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<BoardVO> selectBoard(String bc_num,int firstRow,int endRow) throws SQLException{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String selectById(String name, String bir, String email, int kinds) throws SQLException{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String selectByPw(String id, String email)throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}