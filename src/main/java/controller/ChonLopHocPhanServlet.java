package controller;

import dao.LopHocPhanDAO;
import model.LopHocPhan;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;

@WebServlet(name = "ChonLopHocPhanServlet", value = "/chonLopHocPhanServlet")
public class ChonLopHocPhanServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        int idmhkh=Integer.parseInt(request.getParameter("idmhkh"));
        ArrayList<LopHocPhan> listLopHocPhan = new LopHocPhanDAO().getLHPchoSVdangki(idmhkh);
        out.write("Login successful...");
        request.getSession().setAttribute("listLopHocPhan",listLopHocPhan);
        request.getRequestDispatcher("/gdChonLopHocPhan.jsp").forward(request,response);
    }

}
