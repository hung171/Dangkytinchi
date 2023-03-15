package controller;

import dao.DangKyHocDAO;
import logic.Logic;
import model.DangKyHoc;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "LuuDangKyServlet", value = "/luuDangKyServlet")
public class LuuDangKyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<DangKyHoc> listDK = (ArrayList<DangKyHoc>)request.getSession().getAttribute("listDangKyHoc");
        String message="";
        if(new DangKyHocDAO().luuDKcuaSV(listDK)){
            message="Đăng ký thành công!";
        }else{
            message="Lỗi đăng ký!";
        }
        request.setAttribute("soTC", Logic.tongSoTinChi(listDK));
        request.setAttribute("errorMessage",message);
        request.getRequestDispatcher("giaoDienDangKy.jsp").forward(request,response);
    }
}
