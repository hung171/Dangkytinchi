package controller;

import dao.KiHocDAO;
import dao.SinhVienKhoaDAO;
import model.KiHoc;
import model.SinhVien;
import model.SinhVienKhoa;
import model.ThanhVien;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ChonNganhServlet", value = "/chonNganhServlet")
public class ChonNganhServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        KiHocDAO kiHocDAO = new KiHocDAO();
        ArrayList<KiHoc> listKiHoc = kiHocDAO.getKiHocDangKi();
        request.setAttribute("listKiHoc",listKiHoc);

        SinhVienKhoaDAO sinhVienKhoaDAO = new SinhVienKhoaDAO();
        ThanhVien sinhVien = (ThanhVien)request.getSession().getAttribute("sinhvien");
        ArrayList<SinhVienKhoa> listSinhVienKhoa = sinhVienKhoaDAO.getNganhcuaSV(sinhVien.getId());
        request.getSession().setAttribute("listSVK",listSinhVienKhoa);

        request.setAttribute("listSinhVienKhoa",listSinhVienKhoa);

        request.getRequestDispatcher("dangkymonhoc.jsp").forward(request,response);
    }
}
