package com.pms.petopia.dao;

import java.util.List;

import com.pms.petopia.domain.SharingMarketBoardComment;

public interface SharingMarketBoardCommentDao {
	
	  int insert(SharingMarketBoardComment comt) throws Exception;
		
	  int update(SharingMarketBoardComment comt) throws Exception;

	  List<SharingMarketBoardComment> findAll() throws Exception;

	  int delete(int no) throws Exception;

	  List<SharingMarketBoardComment> findByNo(int no) throws Exception;
	  
	  SharingMarketBoardComment findBySrno(int no) throws Exception;
	  
	  String comtCount(int smBoardNo) throws Exception;
}
