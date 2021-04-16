package com.kubg.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kubg.dao.MemberDAOImpl;
import com.kubg.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	MemberDAOImpl memberDAO;
	
	@Override
	public void register(MemberVO vo) {
		memberDAO.addMember(vo);
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return memberDAO.login(vo);
	}

	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		
		memberDAO.memberUpdate(vo);
	}

	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		
		memberDAO.memberDelete(vo);
	}

	@Override
	public int passChk(MemberVO vo) throws Exception {
		int result = memberDAO.passChk(vo);
		return result;
	}

	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = memberDAO.idChk(vo);
		
		return result;
	}

}
