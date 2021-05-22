package com.pms.petopia.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.pms.petopia.domain.Qna;
import com.pms.petopia.service.QnaService;

@SuppressWarnings("serial")
@WebServlet("/admin/answer")
public class AdminQnaAnswerHandler extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    QnaService qnaService = (QnaService) request.getServletContext().getAttribute("qnaService");

    Qna qna = new Qna();
    qna.setNo(Integer.parseInt(request.getParameter("no")));
    qna.setAnswer(request.getParameter("answer"));
    qna.setState(1);
    try {
      qnaService.answer(qna);
      response.setContentType("text/html;charset=UTF-8");
      request.getRequestDispatcher("/jsp/admin/qna_answer.jsp").include(request, response);
      response.setHeader("Refresh", "1;url=qnalist");
    }
    catch (Exception e) {
      throw new ServletException(e);

    }
  }
}