package com.pms.petopia.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.pms.petopia.domain.Member;
import com.pms.petopia.domain.MyTownBoard;
import com.pms.petopia.domain.MyTownBoardComment;
import com.pms.petopia.service.MyTownBoardCommentService;
import com.pms.petopia.service.MyTownBoardService;

@SuppressWarnings("serial")
@WebServlet("/mytowncomment/delete")
public class MyTownBoardCommentDeleteHandler extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    response.setContentType("text/html;charset=UTF-8");
    MyTownBoardCommentService myTownBoardCommentService = (MyTownBoardCommentService) request.getServletContext().getAttribute("myTownBoardCommentService");
    MyTownBoardService myTownBoardService = (MyTownBoardService) request.getServletContext().getAttribute("myTownBoardService");
    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    out.println("<title>댓글 삭제</title>");
    out.println("</head>");
    out.println("<body>");
    out.println("<h1>댓글 삭제</h1>");

    int no = Integer.parseInt(request.getParameter("no"));

    try {
      MyTownBoardComment oldBoardComment = myTownBoardCommentService.get(no);
      if (oldBoardComment == null) {
        throw new Exception("해당 번호의 댓글이 없습니다.");
      }

      Member loginUser = (Member) request.getSession().getAttribute("loginUser");
      if (oldBoardComment.getWriter().getNo() != loginUser.getNo()) {
        throw new Exception("삭제 권한이 없습니다!");
      }

      myTownBoardCommentService.delete(no);
      int oldBoardNo = oldBoardComment.getMyTownBoard().getNo();
      MyTownBoard oldBoard = myTownBoardService.get(oldBoardNo);

      out.printf("<meta http-equiv='Refresh' content='1;url=list?stateNo=%d&cityNo=%d>",
          oldBoard.getBigAddress().getNo(), oldBoard.getSmallAddress().getNo());
      out.println("</head>");
      out.println("<body>");
      out.println("<h1>댓글 삭제</h1>");
      out.println("<p>댓글을 삭제하였습니다.</p>");

      response.setHeader("Redirect", "1;url=../mytown/main");

    } catch (Exception e) {
      StringWriter strWriter = new StringWriter();
      PrintWriter printWriter = new PrintWriter(strWriter);
      e.printStackTrace(printWriter);

      out.println("</head>");
      out.println("<body>");
      out.println("<h1>댓글 삭제 오류</h1>");
      out.printf("<pre>%s</pre>\n", strWriter.toString());
      out.println("<a href='list'>목록</a></p>\n");
    }
    out.println("</body>");
    out.println("</html>");
  }
}
