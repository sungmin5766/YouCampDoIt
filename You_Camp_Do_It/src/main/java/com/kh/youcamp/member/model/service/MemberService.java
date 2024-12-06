package com.kh.youcamp.member.model.service;

import java.util.ArrayList;

import com.kh.youcamp.member.model.vo.Member;

public interface MemberService {
	
	// 24.12.06 정성민 작성
	// 회원 관리 서비스 메소드 
	
	// 로그인 서비스 (select)
	Member loginMember(Member m);
	
	// 회원가입 서비스 (insert)
	int insertMember(Member m);
	
	// 회원정보수정 서비스 (update)
	int updateMember(Member m);
	
	// 회원탈퇴 서비스 (delete : update 구문을 이용)
	int deleteMember(String userId);
	
	// 아이디 중복체크 서비스 (select)
	int idCheck(String checkId);
	
	// 회원 전체조회 서비스 (select)
	ArrayList<Member> selectMemberList();

}
