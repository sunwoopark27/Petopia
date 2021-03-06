package com.pms.petopia.web;

import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.pms.petopia.domain.Member;
import com.pms.petopia.domain.MyTownBoard;
import com.pms.petopia.domain.Recomment;
import com.pms.petopia.service.MyTownBoardService;
import com.pms.petopia.service.RecommentService;


@Controller
public class MyTownBoardRecommentController {

  MyTownBoardService myTownBoardService;
  RecommentService recommentService;

  public MyTownBoardRecommentController(MyTownBoardService myTownBoardService, RecommentService recommentService) {
    this.myTownBoardService = myTownBoardService;
    this.recommentService = recommentService;
  }

  @RequestMapping("/mytown/recommentAdd")
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws Exception {

    PrintWriter out = response.getWriter();

    Recomment recomment = new Recomment();
    int boardNo = Integer.parseInt(request.getParameter("no"));
    MyTownBoard t = myTownBoardService.get(boardNo);
    recomment.setMyTownBoard(t);

    Member loginUser = (Member)request.getSession().getAttribute("loginUser");
    recomment.setRecommender(loginUser);

    int count = 0;
    List<Recomment> recomments = recommentService.list();

    if (recomments.size() == 0) {
      recommentService.add(recomment);
      myTownBoardService.updateRecommentCount(boardNo);
      out.print("success");

    } else {

      for(Recomment reco : recomments) {
        if (reco.getRecommender().getNo() != loginUser.getNo() && reco.getMyTownBoard().getNo() != boardNo
            || reco.getRecommender().getNo() == loginUser.getNo() && reco.getMyTownBoard().getNo() != boardNo
            || reco.getRecommender().getNo() != loginUser.getNo() && reco.getMyTownBoard().getNo() == boardNo) {

          count++;
          if (count == recomments.size()) {
            recommentService.add(recomment);
            myTownBoardService.updateRecommentCount(boardNo);
            System.out.println("success");
            out.print("success");
            break;
          }

        }else {
          System.out.println("fail");
          out.print("fail");
        }
      }
    }
    //    String webAddress= String.format("detail?stateNo=%d&cityNo=%d&no=%d\n", 
    //        t.getBigAddress().getNo(), t.getSmallAddress().getNo(), boardNo);
    //
    //    return "redirect:" + webAddress;
  }
}

