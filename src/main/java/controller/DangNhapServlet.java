package controller;

import dao.ThanhVienDAO;
import model.ThanhVien;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DangNhapServlet", value = "/dangNhapServlet")
public class DangNhapServlet extends HttpServlet {
    private ThanhVien thanhVien;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        ThanhVien thanhVien = new ThanhVien();
        thanhVien.setUserName(userName);
        thanhVien.setPassword(password);
        ThanhVienDAO thanhVienDAO = new ThanhVienDAO();
        boolean ok = thanhVienDAO.kiemTraDangNhap(thanhVien);

        if(ok && (thanhVien.getVaiTro().equalsIgnoreCase("sinh viên"))){
            request.getSession().setAttribute("sinhvien",thanhVien);
            response.sendRedirect("trangchinh.jsp");
        }else{
            response.sendRedirect("dangnhap.jsp?err=fail");
        }
    }
}
