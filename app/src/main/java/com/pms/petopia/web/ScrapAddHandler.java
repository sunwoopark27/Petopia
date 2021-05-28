package com.pms.petopia.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.pms.petopia.domain.Member;
import com.pms.petopia.domain.Scrap;
import com.pms.petopia.domain.Story;
import com.pms.petopia.service.ScrapService;
import com.pms.petopia.service.StoryService;

@SuppressWarnings("serial")
@WebServlet("/story/scrapadd")
public class ScrapAddHandler extends HttpServlet{

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ScrapService scrapService = (ScrapService) request.getServletContext().getAttribute("scrapService");
    StoryService storyService = (StoryService) request.getServletContext().getAttribute("storyService");
    response.setContentType("text/html;charset=UTF-8");

    int newsNo = Integer.parseInt(request.getParameter("newsNo"));

    PrintWriter out = response.getWriter();
    Scrap scrap = new Scrap();
    int count = 0;
    try {
      Story story = storyService.get(newsNo);
      scrap.setStory(story);
      Member loginUser = (Member)request.getSession().getAttribute("loginUser");
      if(loginUser == null) {
        out.print("login");
      }
      scrap.setMember(loginUser);

      //여기서 로그인 체크
      List<Scrap> scraps = scrapService.list(loginUser.getNo());



      if(scraps.size() == 0) {
        scrapService.add(scrap);
        out.print("success");
      } else {
        for(Scrap s : scraps) {
          if (s.getStory().getNo() != newsNo && s.getMember().getNo() != loginUser.getNo()
              || s.getStory().getNo() == newsNo && s.getMember().getNo() != loginUser.getNo()
              || s.getStory().getNo() != newsNo && s.getMember().getNo() == loginUser.getNo()) {
            count++;
            if(count == scraps.size()) {
              scrapService.add(scrap);
              scrapService.updateScrap(newsNo);
              out.print("success");
            }
          } else {
            out.print("fail");
          }
        }
      }

    } catch (Exception e) {

      throw new ServletException(e);
    }
  }
}
