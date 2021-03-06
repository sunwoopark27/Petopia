package com.pms.petopia.service;

import java.util.List;
import com.pms.petopia.domain.SharingMarketBoard;

public interface SharingMarketBoardService {

  int add(SharingMarketBoard sharingMarketBoard) throws Exception;

  List<SharingMarketBoard> list() throws Exception;

  SharingMarketBoard get(int no) throws Exception;

  int update(SharingMarketBoard sharingMarketBoard) throws Exception;

  int delete(int no) throws Exception;

  List<SharingMarketBoard> searchByDetail(String item, String keyword) throws Exception;

  List<SharingMarketBoard> getCategory(int catNo) throws Exception;

  int deleteAll(int no)throws Exception;

}

