package com.kubg.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kubg.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sqlsession;
	
	@Override
	public void addMember(MemberVO vo) {
		//회원가입
		sqlsession.insert("memberMapper.add", vo);
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		
		return sqlsession.selectOne("memberMapper.login", vo);
	}

	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		
		sqlsession.update("memberMapper.memberUpdate", vo);
	}

	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		
		sqlsession.delete("memberMapper.memberDelete", vo);
	}

	@Override
	public int passChk(MemberVO vo) throws Exception {
		int result = sqlsession.selectOne("memberMapper.passChk", vo);
		return result;
	}

	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = sqlsession.selectOne("memberMapper.idChk", vo);
		return result;
	}

}
