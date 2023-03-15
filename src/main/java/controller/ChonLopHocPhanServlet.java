package controller;

import dao.LopHocPhanDAO;
import model.LopHocPhan;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ChonLopHocPhanServlet", value = "/chonLopHocPhanServlet")
public class ChonLopHocPhanServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idmhkh=Integer.parseInt(request.getParameter("idmhkh"));
        ArrayList<LopHocPhan> listLopHocPhan = new LopHocPhanDAO().getLHPchoSVdangki(idmhkh);
        request.getSession().setAttribute("listLopHocPhan",listLopHocPhan);
        request.getRequestDispatcher("/gdChonLopHocPhan.jsp").forward(request,response);
    }

}
