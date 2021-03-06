package com.pms.petopia.service;

import java.util.List;
import com.pms.petopia.domain.Qna;

public interface QnaService {

  int add(Qna qna) throws Exception;

  List<Qna> list() throws Exception;

  Qna get(int no) throws Exception;

  int update(Qna qna) throws Exception;

  int answer(Qna qna) throws Exception;

  int delete(int no) throws Exception;

  int deleteAll(int no) throws Exception;
}
