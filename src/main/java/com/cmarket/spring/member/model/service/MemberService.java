package com.cmarket.spring.member.model.service;

import com.cmarket.spring.member.model.vo.Member;
import com.cmarket.spring.member.model.vo.MemberProfile;

public interface MemberService {

	/*
	 * 1. 회원 로그인 서비스를 위한 메소드
	 * @param m
	 * @return Member
	 * @author
	 */
	Member loginMember(Member m);

	/*
	 *  2. 회원가입 서비스를 위한 메소드
	 *  @param m
	 *  @return int (성공: 1이상)
	 *  
	 */
	int insertMember(Member m);

	/*
	 * 3. 회원 정보 수정 서비스를 위한 메소드
	 * @param m
	 * @return
	 */
	int updateMember(Member m);

	int deleteMember(String id);


	/**
	 * 5. 아이디 중복 체크
	 * @author hyom
	 */
	int idCheck(String id);

	int insertProfile(MemberProfile profile);

}
