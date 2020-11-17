package com.cmarket.spring.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cmarket.spring.member.model.vo.Member;
import com.cmarket.spring.member.model.vo.MemberProfile;

@Repository("mDao")
public class MemberDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public Member loginMember(Member m) {
		return (Member)sqlSession.selectOne("memberMapper.loginMember",m);//mapper에 선언한 namespace명 그리고 destroy?
	}


	public int insertMember(Member m) {
		
		return sqlSession.insert("memberMapper.insertMember",m);
	}


	public int updateMember(Member m) {
		return sqlSession.update("memberMapper.updateMember",m);
	}


	public int deleteMember(String id) {
		sqlSession.update("memberMapper.deleteMember",id);
		return 0;
	}


	public int insertProfile(MemberProfile profile) {
		return sqlSession.insert("memberMapper.insertProfile",profile);
	}
}
