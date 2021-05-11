package com.pms.petopia.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.pms.petopia.domain.Hospital;
import com.pms.petopia.domain.Member;
import com.pms.petopia.service.HospitalService;

@SuppressWarnings("serial")
@WebServlet("/hospital/add")
public class HospitalAddHandler extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    HospitalService hospitalService = (HospitalService) request.getServletContext().getAttribute("hospitalService");

    Hospital hospital = new Hospital();

    request.setCharacterEncoding("UTF-8");

    hospital.setName(request.getParameter("name"));
    hospital.setTel(request.getParameter("tel"));
    hospital.setAddress(request.getParameter("address"));
    hospital.setBusinessHour(request.getParameter("time"));
    hospital.setParking(Integer.valueOf(request.getParameter("parking")));
    hospital.setVeterinarian(Integer.valueOf(request.getParameter("vet")));
    hospital.setSmallAddress(Integer.valueOf(request.getParameter("cno")));

    Member loginUser = (Member) request.getSession().getAttribute("loginUser");
    hospital.setAdmin(loginUser);

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    out.println("<title>병원 등록</title>");

    try {
      hospitalService.add(hospital);
      //      List<SmallAddress> smallAddressList =smallAddressService.list();
      //            out.println("<select name='gno'>");
      //            for(SmallAddress s : smallAddressList) {
      //              out.printf("<option value='%d'>%s</option>",s.getBigAddress().getNo(),s.getBigAddress().getName());
      //            }
      //            out.println("</select>");
      //      out.println("<select name='cno'>");
      //      for(SmallAddress s : smallAddressList) {
      //        out.printf("<option value='%d'>%s</option>",s.getNo(),s.getName());
      //      }
      //      out.println("</select>");
      //      out.println("<br>");
      //      out.println("<form action='submit' value='등록'>");

      out.println("<meta http-equiv='Refresh' content='1;url=list'>");
      out.println("</head>");
      out.println("<body>");
      out.println("<h1>병원 등록</h1>");
      out.println("<p>병원을 등록했습니다.</p>");

    } catch (Exception e) {
      StringWriter strWriter = new StringWriter();
      PrintWriter printWriter = new PrintWriter(strWriter);
      e.printStackTrace(printWriter);

      out.println("</head>");
      out.println("<body>");
      out.println("<h1>병원 등록 오류</h1>");
      out.printf("<pre>%s</pre>\n", strWriter.toString());
      out.println("<p><a href='list'>목록</a></p>");
    }

    out.println("</body>");
    out.println("</html>");
  }
}
