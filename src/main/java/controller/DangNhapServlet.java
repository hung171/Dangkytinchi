package controller;

import dao.ThanhVienDAO;
import model.ThanhVien;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DangNhapServlet", value = "/dangNhapServlet")
public class DangNhapServlet extends HttpServlet {
    private ThanhVien thanhVien;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        ThanhVien thanhVien = new ThanhVien();
        thanhVien.setUserName(userName);
        thanhVien.setPassword(password);
        ThanhVienDAO thanhVienDAO = new ThanhVienDAO();
        boolean ok = thanhVienDAO.kiemTraDangNhap(thanhVien);
        PrintWriter out = response.getWriter();

        if(ok && (thanhVien.getVaiTro().equalsIgnoreCase("sinh viên"))){
            out.write("Login successful...");
            request.getSession().setAttribute("sinhvien",thanhVien);
            response.sendRedirect("trangchinh.jsp");
        }else{
            out.write("Login fail...");
            response.sendRedirect("dangnhap.jsp?err=fail");
        }
    }
}
