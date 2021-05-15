package com.pms.petopia.web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.pms.petopia.domain.Story;
import com.pms.petopia.service.StoryService;

@SuppressWarnings("serial")
@WebServlet("/story/delete")
public class StoryDeleteHandler extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    StoryService storyService = (StoryService) request.getServletContext().getAttribute("storyService");

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    out.println("<title>스토리 삭제</title>");
    out.println("</head>");
    out.println("<body>");
    out.println("<h1>스토리 삭제</h1>");

    try {
      int no = Integer.parseInt(request.getParameter("no"));

      Story oldStory = storyService.get(no);
      if (oldStory == null) {
        throw new Exception("해당 번호의 스토리가 없습니다.");
      }

      storyService.delete(no);
      out.println("<p>스토리를 삭제했습니다.</p>");
      response.setHeader("Refresh", "1;url=../main");

    } catch (Exception e) {
      throw new ServletException(e);
    }

    out.println("</body>");
    out.println("</html>");
  }
}
