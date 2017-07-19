package com.avengers.student.registryScholarshipManage.serviceImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avengers.db.dto.RegVO;
import com.avengers.db.dto.ScrapplVO;
import com.avengers.student.registryScholarshipManage.dao.StudentResManageDao;
import com.avengers.student.registryScholarshipManage.service.StudentResManageService;



@Service
public class StudentResManageServiceImpl implements StudentResManageService {
	@Autowired
	private StudentResManageDao stuResDAO;
	
	public void setStuResDAO(StudentResManageDao stuResDAO) {
		this.stuResDAO = stuResDAO;
	}

	@Override
	public ArrayList<ScrapplVO> selectScrapplList(String scrappl_stud,
			HashMap<String, String> map) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertScrappl(ScrapplVO scrapplVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<RegVO> selectRegList(String reg_stud) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RegVO selectReg(String reg_stud) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateReg(RegVO regVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public HashMap<String, String> selectResSchHistory(String stud_num)
			throws SQLException {
		HashMap<String, String> resSchStudent = null;
		resSchStudent = stuResDAO.selectresSchStudent(stud_num);
		return resSchStudent;
	}



}
