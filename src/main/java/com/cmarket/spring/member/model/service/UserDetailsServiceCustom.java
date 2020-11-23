//package com.cmarket.spring.member.model.service;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.stereotype.Service;
//
//import com.cmarket.spring.member.model.dao.MemberDao;
//import com.cmarket.spring.member.model.vo.UserDetailsVO;
//
//
//@Service
//public class UserDetailsServiceCustom implements UserDetailsService {
//
//	@Autowired
//	private MemberDao mDao;
//
//	@Override
//	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//
//		// return VO
//		UserDetailsVO userDetails = new UserDetailsVO();
//
//		// user info select
//		UserInfoVO userInfo = mDao.
//
//		// 사용자 정보 없으면 null 처리
//		if (userInfo == null) {
//			return null;
//
//			// 사용자 정보 있을 경우 로직 전개 (userDetails에 데이터 넣기)
//		} else {
//			userDetails.setUsername(userInfo.getUserId());
//			userDetails.setPassword(userInfo.getUserPw());
//
//			// 사용자 권한 select해서 받아온 List<String> 객체 주입
//			userDetails.setAuthorities(mapper.selectUserAuthOne(username));
//		}
//
//		return userDetails;
//	}
//
//}
