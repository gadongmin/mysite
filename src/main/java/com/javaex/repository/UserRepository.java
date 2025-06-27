package com.javaex.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.UserVO;

@Repository
public class UserRepository {

	@Autowired
	private SqlSession sqlSession;

	public void userSelectOne() {

	}

	public int userInsert(UserVO userVO) {
		System.out.println("UserRepository.userInsert()");

		int count = sqlSession.insert("mysite.insert", userVO);

		return count;
	}

}
