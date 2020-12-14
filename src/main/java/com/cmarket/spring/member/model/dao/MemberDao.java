package com.cmarket.spring.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cmarket.spring.member.model.vo.Member;
import com.cmarket.spring.member.model.vo.MemberProfile;
import com.cmarket.spring.member.model.vo.ProfileComment;

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
	
	public int updateMemberPwd(Member m) {
		return sqlSession.update("memberMapper.updateMemberPwd",m);
	}
	


	public int deleteMember(String id) {
		sqlSession.update("memberMapper.deleteMember",id);
		return 0;
	}


	public int insertProfile(MemberProfile profile) {
		return sqlSession.insert("memberMapper.insertProfile",profile);
	}


	public MemberProfile getMemberProfile(int user_sq) {
		return (MemberProfile)sqlSession.selectOne("memberMapper.getMemberProfile",user_sq);
	}


	public int updateProfile(MemberProfile profile) {
		return sqlSession.update("memberMapper.updateProfile", profile);
	}


	public int idCheck(String user_id) {
		return sqlSession.selectOne("memberMapper.idCheck",user_id);
	}


	public int updateMemberPhoto(MemberProfile profile) {
		return sqlSession.update("memberMapper.updateMemberPhoto",profile);
	}


	public ArrayList<ProfileComment> getCommentList(int profile_sq) {
		return (ArrayList)sqlSession.selectList("memberMapper.getCommentList",profile_sq);
	}


	public int writeComment(ProfileComment comment) {
		return sqlSession.insert("memberMapper.writeComment",comment);
	}


	public MemberProfile getMemberProfile2(int profile_sq) {
		return (MemberProfile)sqlSession.selectOne("memberMapper.getMemberProfile2",profile_sq);
	}


	public int updateTemp(MemberProfile mp) {
		return sqlSession.update("memberMapper.updateTemp",mp);
	}


	public int deleteComment(ProfileComment comment) {
		return sqlSession.delete("memberMapper.deleteComment",comment);
	}


	public ProfileComment getComment(ProfileComment comment) {
		return (ProfileComment)sqlSession.selectOne("memberMapper.getComment",comment);
	}
	

}
