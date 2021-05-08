package com.pms.petopia.web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.pms.petopia.service.MemberService;

@SuppressWarnings("serial")
@WebServlet("/member/main")
public class MainDisplay extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    MemberService memberService = (MemberService) request.getServletContext().getAttribute("memberService");

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    out.println("<title>회원 가입</title>");
    out.println("</head>");
    out.println("<body>");
    out.println("<h1>회원 가입</h1>");
    out.println("<p><a href='memberForm.html'>가입</a></p>");

    out.println("</body>");
    out.println("</html>");
  }
}