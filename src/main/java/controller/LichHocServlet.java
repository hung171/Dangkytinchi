package controller;

import dao.LichHocDAO;
import model.LichHoc;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "LichHocServlet", value = "/lichHocServlet")
public class LichHocServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LichHocDAO lichHocDAO = new LichHocDAO();
        ArrayList<LichHoc> listLicHoc = lichHocDAO.getListLichHoc(Integer.parseInt(request.getParameter("idlhp")));

        request.setAttribute("listLichHoc",listLicHoc);
        String tenLopHocPhan = request.getParameter("tenlhp");
        System.out.println("==== TEN LOP HOC PHAN ====");
        System.out.println(tenLopHocPhan);
        request.setAttribute("tenLopHocPhan",tenLopHocPhan);
        System.out.println(request.getRequestDispatcher("gdLichHoc.jsp"));
        request.getRequestDispatcher("gdLichHoc.jsp").forward(request,response);
    }
}
