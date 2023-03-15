<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.ThanhVien" %><%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 9/21/2021
  Time: 5:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chọn ngành học</title>
    <title>Trang chu sinh vien</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/all.min.css">
    <link rel="stylesheet" href="css/bootsrap.min.css">
    <link rel="stylesheet" href="js/bootstrap.bundle.min.js">
</head>

<body>
<%--<%--%>
<%--    ThanhVien sv = (ThanhVien)session.getAttribute("sinhvien");--%>
<%--    if(sv==null){--%>
<%--        response.sendRedirect("gdDangNhap.jsp?err=timeout");--%>
<%--    }--%>
<%--%>--%>
<c:if test = "${sessionScope.sinhvien eq null}">
    <c:redirect url="gdDangNhap.jsp?err=timeout"/>
</c:if>


<div class="container">
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card border-0 shadow rounded-3 my-5">
                <div class="card-body p-4 p-sm-5">

                    <h1>Chọn ngành học</h1>

                    <form style="margin-top: 30px"  action="dangKyHocServlet" method="post">
                        <div class="form-floating mb-3">
                            <select class="form-control" id="floatingInput" name="nganh">
                                <c:forEach var="sinhVienKhoa" items="${listSinhVienKhoa}">
                                    <option value="${sinhVienKhoa.id}">${sinhVienKhoa.khoa.ten}</option>
                                </c:forEach>
                            </select>
                            <label for="floatingInput">Ngành học của sinh viên:</label>
                        </div>
                        <div class="form-floating mb-3">
                            <select class="form-control" id="floatingPassword" name="ki">
                                <c:forEach var="kiHoc" items="${listKiHoc}">
                                    <option value="${kiHoc.id}">${kiHoc.hocKi.ten} - năm ${kiHoc.namHoc.ten}</option>
                                </c:forEach>
                            </select>

                            <label for="floatingPassword">Chọn kỳ học:</label>
                        </div>


                        <div class="d-grid" style="margin-top: 30px">
                            <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">Vào đăng ký</button>
                        </div>
                        <hr class="my-4">

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
