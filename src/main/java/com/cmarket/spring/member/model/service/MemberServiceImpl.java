package com.cmarket.spring.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.cmarket.spring.member.model.dao.MemberDao;
import com.cmarket.spring.member.model.vo.Follow;
import com.cmarket.spring.member.model.vo.Member;
import com.cmarket.spring.member.model.vo.MemberProfile;
import com.cmarket.spring.member.model.vo.ProfileComment;

@Service("Service")
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao mDao;

	@Autowired
	SqlSessionTemplate sqlSession;

	@Autowired
	private DataSourceTransactionManager transactionManager;

	@Override
	public Member loginMember(Member m) {
		return mDao.loginMember(m);
	}

	@Override
	public int insertMember(Member m) {
		
		int result = mDao.insertMember(m);

		return result;
	}

	@Override
	public int updateMember(Member m) {
		int result = 0;
		int result1 = mDao.updateMember(m);
		int result2 = 0;
		if(result1>0) {
//			result2= mDao.updateProfile(m.getUser_sq());
		}
		
		if(result1 >0 && result2 >0) {
			result = 1;
		}
		
		return result;
	}
	
	@Override
	public int updateMemberPwd(Member m) {
		return mDao.updateMemberPwd(m);
	}

	@Override
	public int deleteMember(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int idCheck(String user_id) {
		return mDao.idCheck(user_id);
	}

	@Override
	public int insertProfile(MemberProfile profile) {
			int result = mDao.insertProfile(profile);	
		return result;
	}

	@Override
	public MemberProfile getMemberProfile(int user_sq) {
		return mDao.getMemberProfile(user_sq);
	}

	@Override
	public int updateProfile(MemberProfile profile) {
		return mDao.updateProfile(profile);
	}

	@Override
	public int updateMemberPhoto(MemberProfile profile) {
		return mDao.updateMemberPhoto(profile);
	}

	@Override
	public ArrayList<ProfileComment> getCommentList(int profile_sq) {
		return mDao.getCommentList(profile_sq);
	}

	@Override
	public int writeComment(ProfileComment comment) {
		return mDao.writeComment(comment);
	}

	@Override
	public MemberProfile getMemberProfile2(int profile_sq) {
		return mDao.getMemberProfile2(profile_sq);
	}


	@Override
	public int updateTemp(MemberProfile mp) {
		return mDao.updateTemp(mp);
	}

	@Override
	public int deleteComment(ProfileComment comment) {
		return mDao.deleteComment(comment);
	}

	@Override
	public ProfileComment getComment(ProfileComment comment) {
		return mDao.getComment(comment);
	}

	@Override
	public int insertFollow(Follow follow) {
		return mDao.insertFollow(follow);
	}

	@Override
	public int unFollow(Follow follow) {
		return mDao.unFollow(follow);
	}

	@Override
	public ArrayList<Follow> getUserFollowList(int profileNum) {
		return mDao.getUserFollowList(profileNum);
	}
	
	

}
