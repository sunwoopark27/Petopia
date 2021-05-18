package com.pms.petopia.web;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.pms.petopia.domain.Member;
import com.pms.petopia.domain.Qna;
import com.pms.petopia.service.QnaService;

@SuppressWarnings("serial")
@WebServlet("/qna/list")
public class QnaListHandler extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    QnaService qnaService = (QnaService) request.getServletContext().getAttribute("qnaService");
    Member loginUser = (Member) request.getServletContext().getAttribute("loginUser");

    try {
      List<Qna> list = qnaService.list();

      request.setAttribute("loginUser", loginUser);
      request.setAttribute("list", list);
      response.setContentType("text/html;charset=UTF-8");
      request.getRequestDispatcher("/jsp/qna/list.jsp").include(request, response);

    }
    catch (Exception e) {
      throw new ServletException(e);
    }

  }

}
