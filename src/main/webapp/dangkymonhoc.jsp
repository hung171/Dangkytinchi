<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.ThanhVien" %><%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 9/21/2021
  Time: 5:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html >
<head>
<script type="text/javascript" src="https://apis.google.com/js/platform.js?hl=vn" async="" defer="" gapi_processed="true"></script>
<meta name="google-signin-scope" content="profile email"><meta id="ctl00_metaGoogle" name="google-signin-client_id"><link id="ctl00_favicon" rel="shortcut icon" type="image/x-icon" href="Images/Edusoft.gif">
<script src="js/jquery-2.2.1.js" type="text/javascript"></script>
<script src="js/dialog.js" type="text/javascript"></script>
<script src="js/checkdate.js" type="text/javascript"></script>
<script src="js/balloontip.js" type="text/javascript"></script>
<link href="js/balloontip.css" rel="stylesheet" type="text/css"><title>
	Cổng Thông Tin Đào Tạo-Học Viện Công Nghệ Bưu Chính Viễn Thông-Cơ Sở Miền Bắc-BCVTVTHN
</title>

<link href="css/Standard.css" type="text/css" rel="stylesheet"><link href="css/StyleSheet.css" type="text/css" rel="stylesheet"></head>

<body background="css/Images/background.png" onload="ShowMess()">
<c:if test = "${sessionScope.sinhvien eq null}">
    <c:redirect url="trangchinh.jsp?err=timeout"/>
</c:if>
<form name="aspnetForm" method="post" action="dangKyHocServlet" id="aspnetForm" enctype="multipart/form-data">
        <div>
            <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="">
            <input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="">
            <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="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IElEPSdsYmxHMURLJyBydW5hdD0nc2VydmVyJz4gIDwvYXNwOkxhYmVsPiAgPC90ZD48dGQgd2lkdGg9JzYwcHgnID48YXNwOkxhYmVsIElEPSdsYmxHMU1NSCcgcnVuYXQ9J3NlcnZlcic+TcOjIE1IPC9hc3A6TGFiZWw+PC90ZD4NCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGQgd2lkdGg9JzE1MHgnID48YXNwOkxhYmVsIElEPSdsYmxHMVRNSCcgcnVuYXQ9J3NlcnZlcic+VMOqbiBtw7RuIGjhu41jIDwvYXNwOkxhYmVsPjwvdGQ+PHRkIHdpZHRoPSczNXB4Jz48YXNwOkxhYmVsIElEPSdsYmxHMU5NTScgcnVuYXQ9J3NlcnZlcic+Tk1IPC9hc3A6TGFiZWw+PC90ZD48dGQgd2lkdGg9JzMwcHgnPjxhc3A6TGFiZWwgSUQ9J2xibEcxVFRIJyBydW5hdD0nc2VydmVyJz5UVEg8L2FzcDpMYWJlbD48L3RkPg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZCB3aWR0aD0nMjVweCc+PGFzcDpMYWJlbCBJRD0nbGJsRzFTVEMnIHJ1bmF0PSdzZXJ2ZXInPlNUQzwvYXNwOkxhYmVsPjwvdGQ+DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRkIHdpZHRoPSczNXB4Jz48YXNwOkxhYmVsIElEPSdsYmxHMVNUQ0hQJyBydW5hdD0nc2VydmVyJz5TVENIUDwvYXNwOkxhYmVsPjwvdGQ+PHRkIHdpZHRoPSc3N3B4Jz48YXNwOkxhYmVsIElEPSdsYmxHMU1hTG9wJyBydW5hdD0nc2VydmVyJz5Nw6MgbOG7m3A8L2FzcDpMYWJlbD48L3RkPjx0ZCB3aWR0aD0nMjhweCc+PGFzcDpMYWJlbCBJRD0nbGJsRzFTQ1AnIHJ1bmF0PSdzZXJ2ZXInPlPEqSBz4buRPC9hc3A6TGFiZWw+PC90ZD4NCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRkIHdpZHRoPScyOHB4Jz48YXNwOkxhYmVsIElEPSdsYmxHMUNMJyBydW5hdD0nc2VydmVyJz5DTDwvYXNwOkxhYmVsPjwvdGQ+PHRkIHdpZHRoPScyMHB4Jz48YXNwOkxhYmVsIElEPSdsYmxHMVRIJyBydW5hdD0nc2VydmVyJz5USDwvYXNwOkxhYmVsPjwvdGQ+DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZCB3aWR0aD0nMzVweCc+PGFzcDpMYWJlbCBJRD0nbGJsRzFUaHUnIHJ1bmF0PSdzZXJ2ZXInPlRo4bupIDwvYXNwOkxhYmVsPjwvdGQ+DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZCB3aWR0aD0nNDBweCc+PGFzcDpMYWJlbCBJRD0nbGJsRzFUQkQnIHJ1bmF0PSdzZXJ2ZXInPlRp4bq/dCBCRDwvYXNwOkxhYmVsPjwvdGQ+DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZCB3aWR0aD0nMzBweCc+PGFzcDpMYWJlbCBJRD0nbGJsRzFTVCcgcnVuYXQ9J3NlcnZlcic+U1Q8L2FzcDpMYWJlbD48L3RkPg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGQgd2lkdGg9JzYwcHgnPjxhc3A6TGFiZWwgSUQ9J2xibEcxUGhvbmcnIHJ1bmF0PSdzZXJ2ZXInPlBow7JuZzwvYXNwOkxhYmVsPiA8L3RkPjx0ZCB3aWR0aD0nNzBweCc+PGFzcDpMYWJlbCBJRD0nbGJsRzFUZW5HVicgcnVuYXQ9J3NlcnZlcic+R2nhuqNuZyB2acOqbjwvYXNwOkxhYmVsPiA8L3RkPiA8dGQ+PGFzcDpMYWJlbCBJRD0nbGJsRzFUdWFuJyBydW5hdD0nc2VydmVyJz5UdeG6p248L2FzcDpMYWJlbD48L3RkPjwvdHI+PC90YWJsZT5kAg0PFgIfAgUzICA8ZGl2IGlkPSJkaXZUREsiPjwvZGl2Pg0KICAgICAgICAgICAgICAgICAgICAgICAgZAIPD2QWDAIBDw8WAh8CBQ5YRU0gxJDEgk5HIEvDnWRkAgMPFgIfAgWzFzx0YWJsZSBjZWxsc3BhY2luZz0nMCcgY2VsbHBhZGRpbmc9JzAnICBjbGFzcz0ndGl0bGUtdGFibGUnID48dHI+PHRkIGNvbHNwYW49JzExJyBhbGlnbj0ncmlnaHQnIHN0eWxlPSdiYWNrZ3JvdW5kLWNvbG9yOiM2Njk5RkY7aGVpZ2h0OjVweDsnPjxpbnB1dCB0eXBlPSdidXR0b24nIGlkPSdidG5MdXUnIGRpc2FibGVkIHZhbHVlPSdMxrB1IMSQxINuZyBLw70nIG9uY2xpY2s9J0x1dURhbmhTYWNoRGFuZ0t5KCknIC8+DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RkPg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRkIGFsaWduPSdjZW50ZXInIHN0eWxlPSdiYWNrZ3JvdW5kLWNvbG9yOiM2Njk5RkY7aGVpZ2h0OjVweDsnPg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGlucHV0IHR5cGU9J2J1dHRvbicgZGlzYWJsZWQgaWQ9J2JudFhvYUNob24nIHZhbHVlPSdYw7NhJyBvbmNsaWNrPSd4b2FUdURhbmhTYWNoKHRoaXMuZm9ybS5jaGtfeG9hLCBmYWxzZSknIC8+DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RkPg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RyPg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dHIgYWxpZ249J2NlbnRlcic+DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZCAgc3R5bGU9J3dpZHRoOiAzMHB4Oyc+PGFzcDpMYWJlbCBJRD0nbGJsRzJTVFQnIHJ1bmF0PSdzZXJ2ZXInPlNUVDwvYXNwOkxhYmVsPjwvdGQ+DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZCAgc3R5bGU9J2Rpc3BsYXk6bm9uZSc+PGFzcDpMYWJlbCBJRD0nbGJsRzJNYURLJyBydW5hdD0nc2VydmVyJz5SZWdpcyBJRCA8L2FzcDpMYWJlbD48L3RkPg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGQgIHN0eWxlPSd3aWR0aDogNjBweDsnPjxhc3A6TGFiZWwgSUQ9J2xibEcyTU1IJyBydW5hdD0nc2VydmVyJz5Nw6MgTUggPC9hc3A6TGFiZWw+PC90ZD4NCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRkICBzdHlsZT0nd2lkdGg6IDE4MHB4Oyc+PGFzcDpMYWJlbCBJRD0nbGJsRzJUTUgnIHJ1bmF0PSdzZXJ2ZXInPlTDqm4gbcO0biBo4buNYyA8L2FzcDpMYWJlbD48L3RkPg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGQgIHN0eWxlPSd3aWR0aDogMzVweDsnPjxhc3A6TGFiZWwgSUQ9J2xibEcyTk1IJyBydW5hdD0nc2VydmVyJz5OTUggPC9hc3A6TGFiZWw+PC90ZD4NCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRkICBzdHlsZT0nd2lkdGg6IDQ1cHg7Jz48YXNwOkxhYmVsIElEPSdsYmxHMlRUSCcgcnVuYXQ9J3NlcnZlcic+VFRIIDwvYXNwOkxhYmVsPjwvdGQ+DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZCAgc3R5bGU9J3dpZHRoOiAzNXB4Oyc+PGFzcDpMYWJlbCBJRD0nbGJsRzJTVEMnIHJ1bmF0PSdzZXJ2ZXInPlNUQyA8L2FzcDpMYWJlbD48L3RkPg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGQgIHN0eWxlPSd3aWR0aDogMzVweDsnPjxhc3A6TGFiZWwgSUQ9J2xibEcyU1RDSFAnIHJ1bmF0PSdzZXJ2ZXInPlNUQ0hQIDwvYXNwOkxhYmVsPjwvdGQ+IDx0ZCAgc3R5bGU9J3dpZHRoOiA4MHB4Oyc+PGFzcDpMYWJlbCBJRD0nbGJsRzJIUCcgcnVuYXQ9J3NlcnZlcic+SOG7jWMgUGjDrTwvYXNwOkxhYmVsPjwvdGQ+DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGQgIHN0eWxlPSd3aWR0aDogODBweDsnPjxhc3A6TGFiZWwgSUQ9J2xibEcyTUcnIHJ1bmF0PSdzZXJ2ZXInPk1p4buFbiBHaeG6o208L2FzcDpMYWJlbD48L3RkPg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRkICBzdHlsZT0nd2lkdGg6IDgwcHg7Jz48YXNwOkxhYmVsIElEPSdsYmxHMlBEJyBydW5hdD0nc2VydmVyJz5QaOG6o2kgxJDDs25nPC9hc3A6TGFiZWw+PC90ZD48dGQgPjxhc3A6TGFiZWwgSUQ9J2xibEcyVHJhbmdUaGFpJyBydW5hdD0nc2VydmVyJz5UcuG6oW5nIFRow6FpIG3DtG4gaOG7jWMgPC9hc3A6TGFiZWw+PC90ZD48dGQgYWxpZ249J2xlZnQnICBzdHlsZT0nd2lkdGg6NTBweDsnID48aW5wdXQgdHlwZT0nY2hlY2tib3gnIGlkPSdJRGNoa19hbGwnIG5hbWU9J2Noa19hbGwnICBkaXNhYmxlZD0nZGlzYWJsZWQnIG9uY2xpY2s9J2NoZWNrKHRoaXMuZm9ybS5jaGtfeG9hKTsnLz48L3RkPjwvdHI+PC90YWJsZT5kAgUPFgIfAgWPPg0KPGRpdiBpZD0nZGl2S1EnID48dGFibGUgY2xhc3M9J2JvZHktdGFibGUnIHN0eWxlPSdib3JkZXItY29sbGFwc2U6IGNvbGxhcHNlOyBjb2xvcjpOYXZ5OycgcnVsZXM9J2FsbCcgYm9yZGVyPScxJyBjZWxsc3BhY2luZz0nMCcgY2VsbHBhZGRpbmc9JzAnPg0KDQogICAgICAgICAgICAgICAgPHRyPg0KICAgICAgICAgICAgICAgICAgICA8dGQgc3R5bGU9J3dpZHRoOiAzMHB4OycgdmFsaWduPSdtaWRkbGUnIGFsaWduPSdjZW50ZXInPjE8L3RkPg0KICAgICAgICAgICAgICAgICAgICA8dGQgc3R5bGU9J2Rpc3BsYXk6bm9uZScgdmFsaWduPSdtaWRkbGUnIGFsaWduPSdjZW50ZXInPkJBUzExNTkxNyAgICA8L3RkPg0KICAgICAgICAgICAgICAgICAgICA8dGQgc3R5bGU9J3dpZHRoOiA2MHB4OycgdmFsaWduPSdtaWRkbGUnIGFsaWduPSdjZW50ZXInPkJBUzExNTk8L3RkPg0KICAgICAgICAgICAgICAgICAgICA8dGQgc3R5bGU9J3dpZHRoOiAxODBweDsnIHZhbGlnbj0nbWlkZGxlJyBhbGlnbj0nbGVmdCc+Jm5ic3A7VGnhur9uZyBBbmggKENvdXJzZSAzKTwvdGQ+DQogICAgICAgICAgICAgICAgICAgIDx0ZCBzdHlsZT0nd2lkdGg6IDM1cHg7JyB2YWxpZ249J21pZGRsZScgYWxpZ249J2NlbnRlcic+MTc8L3RkPg0KICAgICAgICAgICAgICAgICAgICA8dGQgc3R5bGU9J3dpZHRoOiA0NXB4OycgdmFsaWduPSdtaWRkbGUnIGFsaWduPSdjZW50ZXInPjwvdGQ+DQogICAgICAgICAgICAgICAgICAgIDx0ZCBzdHlsZT0nd2lkdGg6IDM1cHg7JyB2YWxpZ249J21pZGRsZScgYWxpZ249J2NlbnRlcic+NDwvdGQ+DQogICAgICAgICAgICAgICAgICAgIDx0ZCBzdHlsZT0nd2lkdGg6IDM1cHg7JyB2YWxpZ249J21pZGRsZScgYWxpZ249J2NlbnRlcic+MDwvdGQ+DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGQgc3R5bGU9J3dpZHRoOiA4MHB4OycgdmFsaWduPSdtaWRkbGUnIGFsaWduPSdyaWdodCc+MDAmbmJzcDs8L3RkPg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRkIHN0eWxlPSd3aWR0aDogODBweDsnIHZhbGlnbj0nbWlkZGxlJyBhbGlnbj0ncmlnaHQnPiZuYnNwOzwvdGQ+DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGQgc3R5bGU9J3dpZHRoOiA4MHB4OycgdmFsaWduPSdtaWRkbGUnIGFsaWduPSdyaWdodCc+MDAmbmJzcDs8L3RkPg0KICAgICAgICAgICAgICAgICAgICAgICAgPHRkICB2YWxpZ249J21pZGRsZScgYWxpZ249J2xlZnQnPiZuYnNwOyBC4bqvdCBideG7mWMgcGjhuqNpIGjhu41jPC90ZD4NCiAgICAgICAgICAgICAgICAgICAgICAgIDx0ZCB2YWxpZ249J21pZGRsZScgYWxpZ249J2xlZnQnIHN0eWxlPSd3aWR0aDogNTBweDsnPjxpbnB1dCBzdHlsZT0ndmlzaWJpbGl0eTpoaWRkZW4nIHR5cGU9J2NoZWNrYm94JyBpZD0nY2hrX0JBUzExNTkxNyAgICAnIG5hbWU9J2Noa194b2EnICB2YWx1ZT0nQkFTMTE1OTE3ICAgICcgb25jbGljaz0nQ2hlY2tUb0RlbGV0ZV9DaGVja2VkQ2hhbmdlZCh0aGlzKScgZGlzYWJsZWQ9J2Rpc2FibGVkJy8+PC90ZD48L3RyPg0KICAgICAgICAgICAgICAgIDx0cj4NCiAgICAgICAgICAgICAgICAgICAgPHRkIHN0eWxlPSd3aWR0aDogMzBweDsnIHZhbGlnbj0nbWlkZGxlJyBhbGlnbj0nY2VudGVyJz4yPC90ZD4NCiAgICAgICAgICAgICAgICAgICAgPHRkIHN0eWxlPSdkaXNwbGF5Om5vbmUnIHZhbGlnbj0nbWlkZGxlJyBhbGlnbj0nY2VudGVyJz5JTlQxNDQ5MDEgIDAxPC90ZD4NCiAgICAgICAgICAgICAgICAgICAgPHRkIHN0eWxlPSd3aWR0aDogNjBweDsnIHZhbGlnbj0nbWlkZGxlJyBhbGlnbj0nY2VudGVyJz5JTlQxNDQ5PC90ZD4NCiAgICAgICAgICAgICAgICAgICAgPHRkIHN0eWxlPSd3aWR0aDogMTgwcHg7JyB2YWxpZ249J21pZGRsZScgYWxpZ249J2xlZnQnPiZuYnNwO1Bow6F0IHRyaeG7g24g4bupbmcgZOG7pW5nIGNobyBjw6FjIHRoaeG6v3QgYuG7iyBkaSDEkeG7mW5nPC90ZD4NCiAgICAgICAgICAgICAgICAgICAgPHRkIHN0eWxlPSd3aWR0aDogMzVweDsnIHZhbGlnbj0nbWlkZGxlJyBhbGlnbj0nY2VudGVyJz4wMTwvdGQ+DQogICAgICAgICAgICAgICAgICAgIDx0ZCBzdHlsZT0nd2lkdGg6IDQ1cHg7JyB2YWxpZ249J21pZGRsZScgYWxpZ249J2NlbnRlcic+MDE8L3RkPg0KICAgICAgICAgICAgICAgICAgICA8dGQgc3R5bGU9J3dpZHRoOiAzNXB4OycgdmFsaWduPSdtaWRkbGUnIGFsaWduPSdjZW50ZXInPjM8L3RkPg0KICAgICAgICAgICAgICAgICAgICA8dGQgc3R5bGU9J3dpZHRoOiAzNXB4OycgdmFsaWduPSdtaWRkbGUnIGFsaWduPSdjZW50ZXInPjA8L3RkPg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRkIHN0eWxlPSd3aWR0aDogODBweDsnIHZhbGlnbj0nbWlkZGxlJyBhbGlnbj0ncmlnaHQnPjAwJm5ic3A7PC90ZD4NCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZCBzdHlsZT0nd2lkdGg6IDgwcHg7JyB2YWxpZ249J21pZGRsZScgYWxpZ249J3JpZ2h0Jz4mbmJzcDs8L3RkPg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRkIHN0eWxlPSd3aWR0aDogODBweDsnIHZhbGlnbj0nbWlkZGxlJyBhbGlnbj0ncmlnaHQnPjAwJm5ic3A7PC90ZD4NCiAgICAgICAgICAgICAgICAgICAgICAgIDx0ZCAgdmFsaWduPSdtaWRkbGUnIGFsaWduPSdsZWZ0Jz4mbmJzcDsgQuG6r3QgYnXhu5ljIHBo4bqjaSBo4buNYzwvdGQ+DQogICAgICAgICAgICAgICAgICAgICAgICA8dGQgdmFsaWduPSdtaWRkbGUnIGFsaWduPSdsZWZ0JyBzdHlsZT0nd2lkdGg6IDUwcHg7Jz48aW5wdXQgc3R5bGU9J3Zpc2liaWxpdHk6aGlkZGVuJyB0eXBlPSdjaGVja2JveCcgaWQ9J2Noa19JTlQxNDQ5MDEgIDAxJyBuYW1lPSdjaGtfeG9hJyAgdmFsdWU9J0lOVDE0NDkwMSAgMDEnIG9uY2xpY2s9J0NoZWNrVG9EZWxldGVfQ2hlY2tlZENoYW5nZWQodGhpcyknIGRpc2FibGVkPSdkaXNhYmxlZCcvPjwvdGQ+PC90cj4NCiAgICAgICAgICAgICAgICA8dHI+DQogICAgICAgICAgICAgICAgICAgIDx0ZCBzdHlsZT0nd2lkdGg6IDMwcHg7JyB2YWxpZ249J21pZGRsZScgYWxpZ249J2NlbnRlcic+MzwvdGQ+DQogICAgICAgICAgICAgICAgICAgIDx0ZCBzdHlsZT0nZGlzcGxheTpub25lJyB2YWxpZ249J21pZGRsZScgYWxpZ249J2NlbnRlcic+SU5UMTMxNDUwMyAgICA8L3RkPg0KICAgICAgICAgICAgICAgICAgICA8dGQgc3R5bGU9J3dpZHRoOiA2MHB4OycgdmFsaWduPSdtaWRkbGUnIGFsaWduPSdjZW50ZXInPklOVDEzMTQ1PC90ZD4NCiAgICAgICAgICAgICAgICAgICAgPHRkIHN0eWxlPSd3aWR0aDogMTgwcHg7JyB2YWxpZ249J21pZGRsZScgYWxpZ249J2xlZnQnPiZuYnNwO0tp4bq/biB0csO6YyBtw6F5IHTDrW5oPC90ZD4NCiAgICAgICAgICAgICAgICAgICAgPHRkIHN0eWxlPSd3aWR0aDogMzVweDsnIHZhbGlnbj0nbWlkZGxlJyBhbGlnbj0nY2VudGVyJz4wMzwvdGQ+DQogICAgICAgICAgICAgICAgICAgIDx0ZCBzdHlsZT0nd2lkdGg6IDQ1cHg7JyB2YWxpZ249J21pZGRsZScgYWxpZ249J2NlbnRlcic+PC90ZD4NCiAgICAgICAgICAgICAgICAgICAgPHRkIHN0eWxlPSd3aWR0aDogMzVweDsnIHZhbGlnbj0nbWlkZGxlJyBhbGlnbj0nY2VudGVyJz4zPC90ZD4NCiAgICAgICAgICAgICAgICAgICAgPHRkIHN0eWxlPSd3aWR0aDogMzVweDsnIHZhbGlnbj0nbWlkZGxlJyBhbGlnbj0nY2VudGVyJz4wPC90ZD4NCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZCBzdHlsZT0nd2lkdGg6IDgwcHg7JyB2YWxpZ249J21pZGRsZScgYWxpZ249J3JpZ2h0Jz4wMCZuYnNwOzwvdGQ+DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGQgc3R5bGU9J3dpZHRoOiA4MHB4OycgdmFsaWduPSdtaWRkbGUnIGFsaWduPSdyaWdodCc+Jm5ic3A7PC90ZD4NCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZCBzdHlsZT0nd2lkdGg6IDgwcHg7JyB2YWxpZ249J21pZGRsZScgYWxpZ249J3JpZ2h0Jz4wMCZuYnNwOzwvdGQ+DQogICAgICAgICAgICAgICAgICAgICAgICA8dGQgIHZhbGlnbj0nbWlkZGxlJyBhbGlnbj0nbGVmdCc+Jm5ic3A7IELhuq90IGJ14buZYyBwaOG6o2kgaOG7jWM8L3RkPg0KICAgICAgICAgICAgICAgICAgICAgICAgPHRkIHZhbGlnbj0nbWlkZGxlJyBhbGlnbj0nbGVmdCcgc3R5bGU9J3dpZHRoOiA1MHB4Oyc+PGlucHV0IHN0eWxlPSd2aXNpYmlsaXR5OmhpZGRlbicgdHlwZT0nY2hlY2tib3gnIGlkPSdjaGtfSU5UMTMxNDUwMyAgICAnIG5hbWU9J2Noa194b2EnICB2YWx1ZT0nSU5UMTMxNDUwMyAgICAnIG9uY2xpY2s9J0NoZWNrVG9EZWxldGVfQ2hlY2tlZENoYW5nZWQodGhpcyknIGRpc2FibGVkPSdkaXNhYmxlZCcvPjwvdGQ+PC90cj4NCiAgICAgICAgICAgICAgICA8dHI+DQogICAgICAgICAgICAgICAgICAgIDx0ZCBzdHlsZT0nd2lkdGg6IDMwcHg7JyB2YWxpZ249J21pZGRsZScgYWxpZ249J2NlbnRlcic+NDwvdGQ+DQogICAgICAgICAgICAgICAgICAgIDx0ZCBzdHlsZT0nZGlzcGxheTpub25lJyB2YWxpZ249J21pZGRsZScgYWxpZ249J2NlbnRlcic+SU5UMTM0MTEzICAgIDwvdGQ+DQogICAgICAgICAgICAgICAgICAgIDx0ZCBzdHlsZT0nd2lkdGg6IDYwcHg7JyB2YWxpZ249J21pZGRsZScgYWxpZ249J2NlbnRlcic+SU5UMTM0MTwvdGQ+DQogICAgICAgICAgICAgICAgICAgIDx0ZCBzdHlsZT0nd2lkdGg6IDE4MHB4OycgdmFsaWduPSdtaWRkbGUnIGFsaWduPSdsZWZ0Jz4mbmJzcDtOaOG6rXAgbcO0biB0csOtIHR14buHIG5ow6JuIHThuqFvPC90ZD4NCiAgICAgICAgICAgICAgICAgICAgPHRkIHN0eWxlPSd3aWR0aDogMzVweDsnIHZhbGlnbj0nbWlkZGxlJyBhbGlnbj0nY2VudGVyJz4xMzwvdGQ+DQogICAgICAgICAgICAgICAgICAgIDx0ZCBzdHlsZT0nd2lkdGg6IDQ1cHg7JyB2YWxpZ249J21pZGRsZScgYWxpZ249J2NlbnRlcic+PC90ZD4NCiAgICAgICAgICAgICAgICAgICAgPHRkIHN0eWxlPSd3aWR0aDogMzVweDsnIHZhbGlnbj0nbWlkZGxlJyBhbGlnbj0nY2VudGVyJz4zPC90ZD4NCiAgICAgICAgICAgICAgICAgICAgPHRkIHN0eWxlPSd3aWR0aDogMzVweDsnIHZhbGlnbj0nbWlkZGxlJyBhbGlnbj0nY2VudGVyJz4wPC90ZD4NCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZCBzdHlsZT0nd2lkdGg6IDgwcHg7JyB2YWxpZ249J21pZGRsZScgYWxpZ249J3JpZ2h0Jz4wMCZuYnNwOzwvdGQ+DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGQgc3R5bGU9J3dpZHRoOiA4MHB4OycgdmFsaWduPSdtaWRkbGUnIGFsaWduPSdyaWdodCc+Jm5ic3A7PC90ZD4NCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZCBzdHlsZT0nd2lkdGg6IDgwcHg7JyB2YWxpZ249J21pZGRsZScgYWxpZ249J3JpZ2h0Jz4wMCZuYnNwOzwvdGQ+DQogICAgICAgICAgICAgICAgICAgICAgICA8dGQgIHZhbGlnbj0nbWlkZGxlJyBhbGlnbj0nbGVmdCc+Jm5ic3A7IELhuq90IGJ14buZYyBwaOG6o2kgaOG7jWM8L3RkPg0KICAgICAgICAgICAgICAgICAgICAgICAgPHRkIHZhbGlnbj0nbWlkZGxlJyBhbGlnbj0nbGVmdCcgc3R5bGU9J3dpZHRoOiA1MHB4Oyc+PGlucHV0IHN0eWxlPSd2aXNpYmlsaXR5OmhpZGRlbicgdHlwZT0nY2hlY2tib3gnIGlkPSdjaGtfSU5UMTM0MTEzICAgICcgbmFtZT0nY2hrX3hvYScgIHZhbHVlPSdJTlQxMzQxMTMgICAgJyBvbmNsaWNrPSdDaGVja1RvRGVsZXRlX0NoZWNrZWRDaGFuZ2VkKHRoaXMpJyBkaXNhYmxlZD0nZGlzYWJsZWQnLz48L3RkPjwvdHI+DQogICAgICAgICAgICAgICAgPHRyPg0KICAgICAgICAgICAgICAgICAgICA8dGQgc3R5bGU9J3dpZHRoOiAzMHB4OycgdmFsaWduPSdtaWRkbGUnIGFsaWduPSdjZW50ZXInPjU8L3RkPg0KICAgICAgICAgICAgICAgICAgICA8dGQgc3R5bGU9J2Rpc3BsYXk6bm9uZScgdmFsaWduPSdtaWRkbGUnIGFsaWduPSdjZW50ZXInPklOVDE0MTYwNSAgICA8L3RkPg0KICAgICAgICAgICAgICAgICAgICA8dGQgc3R5bGU9J3dpZHRoOiA2MHB4OycgdmFsaWduPSdtaWRkbGUnIGFsaWduPSdjZW50ZXInPklOVDE0MTY8L3RkPg0KICAgICAgICAgICAgICAgICAgICA8dGQgc3R5bGU9J3dpZHRoOiAxODBweDsnIHZhbGlnbj0nbWlkZGxlJyBhbGlnbj0nbGVmdCc+Jm5ic3A7xJDhuqNtIGLhuqNvIGNo4bqldCBsxrDhu6NuZyBwaOG6p24gbeG7gW08L3RkPg0KICAgICAgICAgICAgICAgICAgICA8dGQgc3R5bGU9J3dpZHRoOiAzNXB4OycgdmFsaWduPSdtaWRkbGUnIGFsaWduPSdjZW50ZXInPjA1PC90ZD4NCiAgICAgICAgICAgICAgICAgICAgPHRkIHN0eWxlPSd3aWR0aDogNDVweDsnIHZhbGlnbj0nbWlkZGxlJyBhbGlnbj0nY2VudGVyJz48L3RkPg0KICAgICAgICAgICAgICAgICAgICA8dGQgc3R5bGU9J3dpZHRoOiAzNXB4OycgdmFsaWduPSdtaWRkbGUnIGFsaWduPSdjZW50ZXInPjM8L3RkPg0KICAgICAgICAgICAgICAgICAgICA8dGQgc3R5bGU9J3dpZHRoOiAzNXB4OycgdmFsaWduPSdtaWRkbGUnIGFsaWduPSdjZW50ZXInPjA8L3RkPg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRkIHN0eWxlPSd3aWR0aDogODBweDsnIHZhbGlnbj0nbWlkZGxlJyBhbGlnbj0ncmlnaHQnPjAwJm5ic3A7PC90ZD4NCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZCBzdHlsZT0nd2lkdGg6IDgwcHg7JyB2YWxpZ249J21pZGRsZScgYWxpZ249J3JpZ2h0Jz4mbmJzcDs8L3RkPg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRkIHN0eWxlPSd3aWR0aDogODBweDsnIHZhbGlnbj0nbWlkZGxlJyBhbGlnbj0ncmlnaHQnPjAwJm5ic3A7PC90ZD4NCiAgICAgICAgICAgICAgICAgICAgICAgIDx0ZCAgdmFsaWduPSdtaWRkbGUnIGFsaWduPSdsZWZ0Jz4mbmJzcDsgQuG6r3QgYnXhu5ljIHBo4bqjaSBo4buNYzwvdGQ+DQogICAgICAgICAgICAgICAgICAgICAgICA8dGQgdmFsaWduPSdtaWRkbGUnIGFsaWduPSdsZWZ0JyBzdHlsZT0nd2lkdGg6IDUwcHg7Jz48aW5wdXQgc3R5bGU9J3Zpc2liaWxpdHk6aGlkZGVuJyB0eXBlPSdjaGVja2JveCcgaWQ9J2Noa19JTlQxNDE2MDUgICAgJyBuYW1lPSdjaGtfeG9hJyAgdmFsdWU9J0lOVDE0MTYwNSAgICAnIG9uY2xpY2s9J0NoZWNrVG9EZWxldGVfQ2hlY2tlZENoYW5nZWQodGhpcyknIGRpc2FibGVkPSdkaXNhYmxlZCcvPjwvdGQ+PC90cj4NCiAgICAgICAgICAgICAgICA8dHIgc3R5bGU9J2ZvbnQtd2VpZ2h0OiBib2xkOycgaGVpZ2h0PScyMHB4Jz4NCiAgICAgICAgICAgICAgICA8dGQgdmFsaWduPSdtaWRkbGUnIGFsaWduPSdjZW50ZXInIGNvbHNwYW49JzUnPlThu5VuZyBj4buZbmc8L3RkPg0KICAgICAgICAgICAgICAgIDx0ZCAgdmFsaWduPSdtaWRkbGUnIGFsaWduPSdjZW50ZXInPjE2PC90ZD4NCjx0ZCAgdmFsaWduPSdtaWRkbGUnIGFsaWduPSdjZW50ZXInPjAwPC90ZD4NCiAgICAgICAgICAgICAgICA8dGQgIHZhbGlnbj0nbWlkZGxlJyBhbGlnbj0ncmlnaHQnPjAwJm5ic3A7PC90ZD4NCiAgICAgICAgICAgICAgICA8dGQgIHZhbGlnbj0nbWlkZGxlJyBhbGlnbj0ncmlnaHQnPjAwJm5ic3A7PC90ZD4NCiAgICAgICAgICAgICAgICA8dGQgIHZhbGlnbj0nbWlkZGxlJyBhbGlnbj0ncmlnaHQnPjAwJm5ic3A7PC90ZD4NCiAgICAgICAgICAgICAgICA8dGQgIHZhbGlnbj0nbWlkZGxlJyBhbGlnbj0nbGVmdCc+PC90ZD4NCiAgICAgICAgICAgICAgICA8dGQgdmFsaWduPSdtaWRkbGUnIGFsaWduPSdjZW50ZXInPg0KICAgICAgICAgICAgICAgIDwvdGQ+DQogICAgICAgICAgICAgICAgDQoJCQkJICAgICAgICAgICAgICAgIDwvdHI+PC90YWJsZT48L2Rpdj5kAgcPDxYCHwIFzAEoIERp4buFbiBnaeG6o2k6IMSQSyAoxJHEg25nIGvDvSk7IE3DoyBNSCAobcOjIG3DtG4gaOG7jWMpOyBOTUggKE5ow7NtIG3DtG4gaOG7jWMpOyBUVEggKFThu5UgdGjhu7FjIGjDoG5oKTsgU1RDIChT4buRIHTDrW4gY2jhu4kpOyBTVENIUCAoU+G7kSB0w61uIGNo4buJIGjhu41jIHBow60pOyBDTCAoQ8OybiBs4bqhaSk7IFRIIChUaOG7sWMgaMOgbmgpIClkZAIJD2QWAgIBD2QWAgIBDw8WAh8CBR1bIEluIGvhur90IHF14bqjIMSRxINuZyBrw70gXWRkAgsPDxYCHwIFcEzGsHUgw706IGNoxrBhIMSR4bqhdCBz4buRIHTDrW4gY2jhu4kgdOG7kWkgdGhp4buDdSBo4buNYyBr4buzLCBj4bqnbiDEkcSDbmcga8O9IHRow6ptIMSR4buDIMSR4bqhdCAxIHTDrW4gY2jhu4lkZAITD2QWCAIBDw8WAh8CBUUtIFhlbSBkYW5oIHPDoWNoIGvhur90IHF14bqjIMSRxINuZyBrw70gxJHhu6N0IC4uLiB1cGxvYWQgbmfDoHkgLi4uLi5kZAIDDzwrAA0AZAIFD2QWBAIFDxBkZBYBZmQCCQ9kFgYCAQ8PFgIfAgUpxJDhu4MgbOG6oWkgbOG7nWkgbmjhuq9uIGNobyBzaW5oIHZpw6puOiBkZAIFDw8WAh8CBQRMxrB1ZGQCBw8PFgIfAgV0ICggTOG7nWkgbmjhuq9uIHbDoCBr4bq/dCBxdeG6oyBkdXnhu4d0IMSRw6MgxJHGsOG7o2MgbMawdSwgc2luaCB2acOqbiBz4bq9IHRo4bqleSBraGkgeGVtIGvhur90IHF14bqjIMSRxINuZyBrw70gKSBkZAIHD2QWAgIBDw8WAh8CBTLEkMSCTkcgS8OdIE5HVVnhu4ZOIFbhu4xORyBM4buaUCBSScOKTkcgSEsgMiAyMi0yM2RkAgMPFgIeB0VuYWJsZWRoZAIJD2QWCAIBDw8WAh8CBW1Db3B5cmlnaHQgwqkyMDA5IEjhu41jIFZp4buHbiBDw7RuZyBOZ2jhu4cgQsawdSBDaMOtbmggVmnhu4VuIFRow7RuZy1DxqEgU+G7nyBNaeG7gW4gQuG6r2MuIFF14bqjbiBsw70gYuG7n2kgZGQCAw8PFgIfAgULVHJhbmcgQ2jhu6dkZAIFDw8WAh8CBS1UaGnhur90IGvhur8gYuG7n2kgY3R5IFBo4bqnbiBt4buBbSBBbmggUXXDom5kZAIHDw8WAh8CBQzEkOG6p3UgVHJhbmdkZBgBBSpjdGwwMCRDb250ZW50UGxhY2VIb2xkZXIxJGN0bDAwJGdyaWRLUURLQ3UPZ2RmbNwl5frJGmMi5qQswSLAuBDd8g==">
        </div>


        <div>

           <input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="CA0B0334">
       </div>
       <div align="center">
        <div class="base">

            <table>
                <tbody><tr>
                    <td>


                        <div style="background-image: url(css/Images/bg_heading_thongbao.png)">
                            <table width="1000px">
                                <tbody><tr>
                                    <td height="20px" style="padding-left: 50px" valign="bottom" align="right">


                                        <div id="ctl00_Header1_Logout1_dLog" class="logout" style="text-align: right; margin-bottom: 0px">

                                            <img src="css/Images/US.gif" alt="English" onclick="changeLanguage_click('_us')" id="imgUS" title="English">
                                            <img src="css/Images/VI.gif" alt="Vietnamese" onclick="changeLanguage_click('_vi')" id="imgVi" title="Vietnamese">
                                            <span id="ctl00_Header1_Logout1_lblNguoiDung" class="Label" style="color:MistyRose;font-size:12px;font-weight:bold;">Chào bạn Nguyễn Tấn Hùng (B18DCCN256)</span>&nbsp;<a id="ctl00_Header1_Logout1_lbtnThongBao" href="javascript:__doPostBack('ctl00$Header1$Logout1$lbtnThongBao','')" style="color:MistyRose;font-size:12px;font-style:italic;font-family: 'Tahoma', Times, serif">Xem thông báo</a><span id="ctl00_Header1_Logout1_lblXiet1" class="Label" style="color:MistyRose;"> | </span>
                                            <a id="ctl00_Header1_Logout1_lbtnChangePass" href="javascript:__doPostBack('ctl00$Header1$Logout1$lbtnChangePass','')" style="color:MistyRose;font-size:12px;font-weight:bold;font-family: 'Tahoma', Times, serif">Thay đổi mật khẩu</a>
                                            <span id="ctl00_Header1_Logout1_lblXiet2" class="Label" style="color:MistyRose;"> | </span>
                                            <a id="ctl00_Header1_Logout1_lbtnLogOut" href="javascript:__doPostBack('ctl00$Header1$Logout1$lbtnLogOut','')" style="color:MistyRose;font-size:10pt;font-weight:bold;font-family: 'Tahoma', Times, serif">Thoát</a>
                                            &nbsp;<select id="selectFont" style="font-size: 11px; width: 100px; color: #000080;" onchange="selectFont_change()">
                                                <option value="uni">-------Font-------</option>
                                                <option value="uni" selected="">Font Unicode</option>
                                                <option value="abc">Font ABC</option>
                                                <option value="vni">Font Vni</option>
                                                <option value="not">Text không
                                                dấu</option>
                                            </select>
                                        </div>

                                    </td>
                                </tr>
                            </tbody></table>
                        </div>



                        <style type="text/css">
                            .styleApplication {
                                /*font-size: 26;*/
                                font-weight: bold;
                            }

                            @font-face {
                                font-family: 'myriadpro';
                                /*src: url('js/myriadpro-bold.otf');*/
                            }

                            .menufontdhxd {
                                font-family: 'myriadpro';
                                font-size: 14px;
                            }
                        </style>

                        <div class="left-menu">
                            <div class="right-menu">

                                <div class="main-menu" style="height: 110px">

                                    <div id="ctl00_menu_pnlGioithieu" class="out-menu">

                                        <div class="left"></div>
                                        <div class="center" style="white-space: nowrap">
                                            <a href="Default.aspx?page=gioithieu">
                                                <span id="ctl00_menu_lblTrangChu" class="Label">TRANG CHỦ</span></a>
                                            </div>
                                            <div class="right"></div>

                                        </div>


                                        <div id="ctl00_menu_pnDangKyMonHoc" class="out-menu">

                                            <div class="left"></div>
                                            <div class="center" style="white-space: nowrap">

                                                <a href="Default.aspx?page=dkmonhoc">
                                                    <span id="ctl00_menu_lblDangKyMonHoc" class="Label">ĐĂNG KÝ MÔN HỌC</span></a>
                                                </div>
                                                <div class="right"></div>

                                            </div>



                                            <div id="ctl00_menu_thoikhoabieu" class="out-menu">

                                                <div class="left"></div>
                                                <div class="center" style="white-space: nowrap">
                                                    <a href="Default.aspx?page=thoikhoabieu">
                                                        <span id="ctl00_menu_lblThoiKhoaBieu" class="Label">XEM TKB</span></a>
                                                    </div>
                                                    <div class="right"></div>

                                                </div>



                                                <div id="ctl00_menu_xemlichthi" class="out-menu">

                                                    <div class="left"></div>
                                                    <div class="center" style="white-space: nowrap">
                                                        <a href="Default.aspx?page=xemlichthi">
                                                            <span id="ctl00_menu_lblXemLichThi" class="Label">XEM LỊCH THI</span></a>
                                                        </div>
                                                        <div class="right"></div>

                                                    </div>

                                                    <div id="ctl00_menu_xemlichthilai" class="out-menu">

                                                        <div class="left"></div>
                                                        <div class="center" style="white-space: nowrap">
                                                            <a href="Default.aspx?page=xemlichthilai">
                                                                <span id="ctl00_menu_lblXemLichThiLai" class="Label">XEM LỊCH THI LẠI</span></a>
                                                            </div>
                                                            <div class="right"></div>

                                                        </div>



                                                        <div id="ctl00_menu_xemhocphi" class="out-menu">

                                                            <div class="left"></div>
                                                            <div class="center" style="white-space: nowrap">
                                                                <a href="Default.aspx?page=xemhocphi">
                                                                    <span id="ctl00_menu_lblXemHocPhi" class="Label">XEM HỌC PHÍ</span></a>
                                                                </div>
                                                                <div class="right"></div>

                                                            </div>



                                                            <div id="ctl00_menu_xemdiemthi" class="out-menu">

                                                                <div class="left"></div>
                                                                <div class="center" style="white-space: nowrap">
                                                                    <a href="Default.aspx?page=xemdiemthi">
                                                                        <span id="ctl00_menu_lblXemDiem" class="Label">XEM ĐIỂM</span></a>
                                                                    </div>
                                                                    <div class="right"></div>

                                                                </div>



                                                                <div id="ctl00_menu_pnlXemCTDTKhoi" class="out-menu">

                                                                    <div class="left"></div>
                                                                    <div class="center" style="white-space: nowrap">
                                                                        <a href="Default.aspx?page=ctdtkhoisv">
                                                                            <span id="ctl00_menu_lblXemCTDTKhoiSV" class="Label">XEM CTĐT</span></a>
                                                                        </div>
                                                                        <div class="right"></div>

                                                                    </div>

                                                                    <div id="ctl00_menu_pnlXemMonTienQuyet" class="out-menu">

                                                                        <div class="left"></div>
                                                                        <div class="center" style="white-space: nowrap">
                                                                            <a href="Default.aspx?page=xemmontienquyet">
                                                                                <span id="ctl00_menu_lblXemMonTQ" class="Label">XEM MÔN TQ</span></a>
                                                                            </div>
                                                                            <div class="right"></div>

                                                                        </div>





                                                                        <div id="ctl00_menu_thaydoittcn" class="out-menu">

                                                                            <div class="left"></div>
                                                                            <div class="center" style="white-space: nowrap">
                                                                                <a href="Default.aspx?page=thaydoittcn">
                                                                                    <span id="ctl00_menu_lblThayDoiTTCN" class="Label">SỬA TT CÁ NHÂN</span></a>
                                                                                </div>
                                                                                <div class="right"></div>

                                                                            </div>

                                                                            <div id="ctl00_menu_ykiensinhvien" class="out-menu">

                                                                                <div class="left"></div>
                                                                                <div class="center" style="white-space: nowrap">
                                                                                    <a href="Default.aspx?page=ykiensinhvien">
                                                                                        <span id="ctl00_menu_lblykiensinhvien" class="Label">GÓP Ý KIẾN</span></a>
                                                                                    </div>
                                                                                    <div class="right"></div>

                                                                                </div>



                                                                                <div id="ctl00_menu_pnlHDSD" class="out-menu">

                                                                                    <div class="left"></div>
                                                                                    <div class="center" style="white-space: nowrap">
                                                                                        <a href="HDDKMH.htm">
                                                                                            <span id="ctl00_menu_lblHuongDanDangKy" class="Label">HƯỚNG DẪN ĐKMH</span></a>
                                                                                        </div>
                                                                                        <div class="right"></div>

                                                                                    </div>



                                                                                </div>

                                                                            </div>

                                                                        </div>

                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td height="500px" valign="top">


                                                                        <style type="text/css">
                                                                            #dhtmltooltip {
                                                                                position: absolute;
                                                                                padding: 2px;
                                                                                visibility: hidden;
                                                                                z-index: 100;
                                                                            }

                                                                            .style1 {
                                                                                width: 814px;
                                                                            }

                                                                            .style2 {
                                                                                width: 68px;
                                                                            }

                                                                            .style3 {
                                                                                width: 1252px;
                                                                            }

                                                                            #Select1 {
                                                                                height: 66px;
                                                                                width: 238px;
                                                                            }

                                                                            #selectMonHoc1 {
                                                                                width: 352px;
                                                                                height: 63px;
                                                                            }
                                                                            #ctl00_ContentPlaceHolder1_ctl00_lblLocMH {
                                                                                font-family: tahoma,verdana;
                                                                                color: #000000;
                                                                                font-size: 9pt;
                                                                                line-height: 20px;
                                                                                text-align: left;
                                                                                word-wrap: normal;
                                                                         }
                                                                        </style>

                                                                
                                                                    <div id="dhtmltooltip" style="background-image: url(css/Images/tooltip.png); text-align: center"></div>

                                                                    <div id="ctl00_ContentPlaceHolder1_ctl00_UpdatePanel2">


                                                                        <div id="divfilters" class="filters" visible="false">
                                                                            <table>
                                                                                <tbody><tr>
                                                                                    <td>                       
                                                                                        <div id="ctl00_ContentPlaceHolder1_ctl00_pnlLocMonHoc">

                                                                                           <table cellpadding="0" cellspacing="0">
                                                                                            <tbody><tr>
                                                                                                <td style="width: 110px">
                                                                                                    <span id="ctl00_ContentPlaceHolder1_ctl00_lblLocMH" style="display:inline-block;width:110px;">Lọc theo môn học: </span>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <input type="text" id="txtMaMH1" onkeypress="txtMaMH1_keypress(event)">
                                                                                                    <input type="button" value="Lọc >>" id="btnLocTheoMaMH1" onclick="btnLocTheoMaMH1_click()">

                                                                                                </td>
                                                                                            </tr>
                                                                                        </tbody></table>

                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td valign="top">
                                                                                    <div id="ctl00_ContentPlaceHolder1_ctl00_pnlLocDK">



                                                                                    </div>




                                                                                </td>
                                                                            </tr>

                                                                        </tbody></table>
                                                                    </div>
                                                                    <div id="ctl00_ContentPlaceHolder1_ctl00_pnlThongbao">


                                                                    </div>
                                                                    <table id="pnlDSMonhocDK">
                                                                        <tbody><tr>
                                                                            <td align="center">
                                                                                <div align="left">
                                                                                    <table cellspacing="0" cellpadding="0" class="title-table">
                                                                                        <tbody><tr align="center" height="30px">
                                                                                            <td width="25px"><asp:label id="lblG1DK" runat="server">  </asp:label>  </td><td width="60px"><asp:label id="lblG1MMH" runat="server">Mã MH</asp:label></td>
                                                                                            <td width="150x"><asp:label id="lblG1TMH" runat="server">Tên môn học </asp:label></td><td width="35px"><asp:label id="lblG1NMM" runat="server">NMH</asp:label></td><td width="30px"><asp:label id="lblG1TTH" runat="server">TTH</asp:label></td>
                                                                                            <td width="25px"><asp:label id="lblG1STC" runat="server">STC</asp:label></td>
                                                                                            <td width="35px"><asp:label id="lblG1STCHP" runat="server">STCHP</asp:label></td><td width="77px"><asp:label id="lblG1MaLop" runat="server">Mã lớp</asp:label></td><td width="28px"><asp:label id="lblG1SCP" runat="server">Sĩ số</asp:label></td>
                                                                                            <td width="28px"><asp:label id="lblG1CL" runat="server">CL</asp:label></td><td width="20px"><asp:label id="lblG1TH" runat="server">TH</asp:label></td>
                                                                                            <td width="35px"><asp:label id="lblG1Thu" runat="server">Thứ </asp:label></td>
                                                                                            <td width="40px"><asp:label id="lblG1TBD" runat="server">Tiết BD</asp:label></td>
                                                                                            <td width="30px"><asp:label id="lblG1ST" runat="server">ST</asp:label></td>
                                                                                            <td width="60px"><asp:label id="lblG1Phong" runat="server">Phòng</asp:label> </td><td width="70px"><asp:label id="lblG1TenGV" runat="server">Giảng viên</asp:label> </td> <td><asp:label id="lblG1Tuan" runat="server">Tuần</asp:label></td></tr></tbody></table>
                                                                                        </div>
                                                                                        <div style="height: 320px" class="grid-roll">
                                                                                          <div id="divTDK"></div>

                                                                                      </div>
                                                                                  </td>
                                                                              </tr>
                                                                          </tbody></table>

                                                                          <div id="ctl00_ContentPlaceHolder1_ctl00_pnlDaChon">

                                                                            <div style="margin-top: 5px;" id="titleDSDK">
                                                                                <span id="ctl00_ContentPlaceHolder1_ctl00_lblDaChon" class="Label" style="font-size:14px;font-weight:bold;">XEM ĐĂNG KÝ</span>
                                                                                <table cellspacing="0" cellpadding="0" class="title-table"><tbody><tr><td colspan="11" align="right" style="background-color:#6699FF;height:5px;"><input type="button" id="btnLuu" disabled="" value="Lưu Đăng Ký" onclick="LuuDanhSachDangKy()">
                                                                                </td>
                                                                                <td align="center" style="background-color:#6699FF;height:5px;">
                                                                                    <input type="button" disabled="" id="bntXoaChon" value="Xóa" onclick="xoaTuDanhSach(this.form.chk_xoa, false)">
                                                                                </td>
                                                                            </tr>
                                                                            <tr align="center">
                                                                                <td style="width: 30px;"><asp:label id="lblG2STT" runat="server">STT</asp:label></td>
                                                                                <td style="display:none"><asp:label id="lblG2MaDK" runat="server">Regis ID </asp:label></td>
                                                                                <td style="width: 60px;"><asp:label id="lblG2MMH" runat="server">Mã MH </asp:label></td>
                                                                                <td style="width: 180px;"><asp:label id="lblG2TMH" runat="server">Tên môn học </asp:label></td>
                                                                                <td style="width: 35px;"><asp:label id="lblG2NMH" runat="server">NMH </asp:label></td>
                                                                                <td style="width: 45px;"><asp:label id="lblG2TTH" runat="server">TTH </asp:label></td>
                                                                                <td style="width: 35px;"><asp:label id="lblG2STC" runat="server">STC </asp:label></td>
                                                                                <td style="width: 35px;"><asp:label id="lblG2STCHP" runat="server">STCHP </asp:label></td> <td style="width: 80px;"><asp:label id="lblG2HP" runat="server">Học Phí</asp:label></td>
                                                                                <td style="width: 80px;"><asp:label id="lblG2MG" runat="server">Miễn Giảm</asp:label></td>
                                                                                <td style="width: 80px;"><asp:label id="lblG2PD" runat="server">Phải Đóng</asp:label></td><td><asp:label id="lblG2TrangThai" runat="server">Trạng Thái môn học </asp:label></td><td align="left" style="width:50px;"><input type="checkbox" id="IDchk_all" name="chk_all" disabled="disabled" onclick="check(this.form.chk_xoa);"></td></tr></tbody></table>

                                                                            </div>
                                                                            <div id="divTemp" class="grid-roll" style="height: 240px">

<%--                                                                                <div id="divKQ"><table class="body-table" style="border-collapse: collapse; color:Navy;" rules="all" border="1" cellspacing="0" cellpadding="0">--%>

<%--                                                                                    <tbody><tr>--%>
<%--                                                                                        <td style="width: 30px;" valign="middle" align="center">1</td>--%>
<%--                                                                                        <td style="display:none" valign="middle" align="center">    </td>--%>
<%--                                                                                        <td style="width: 60px;" valign="middle" align="center"></td>--%>
<%--                                                                                        <td style="width: 180px;" valign="middle" align="left">&nbsp;</td>--%>
<%--                                                                                        <td style="width: 35px;" valign="middle" align="center">17</td>--%>
<%--                                                                                        <td style="width: 45px;" valign="middle" align="center"></td>--%>
<%--                                                                                        <td style="width: 35px;" valign="middle" align="center">4</td>--%>
<%--                                                                                        <td style="width: 35px;" valign="middle" align="center">0</td>--%>
<%--                                                                                        <td style="width: 80px;" valign="middle" align="right">00&nbsp;</td>--%>
<%--                                                                                        <td style="width: 80px;" valign="middle" align="right">&nbsp;</td>--%>
<%--                                                                                        <td style="width: 80px;" valign="middle" align="right">00&nbsp;</td>--%>
<%--                                                                                        <td valign="middle" align="left">&nbsp; Bắt buộc phải học</td>--%>
<%--                                                                                        <td valign="middle" align="left" style="width: 50px;"><input style="visibility:hidden" type="checkbox" id="chk_BAS115917    " name="chk_xoa" value="BAS115917    " onclick="CheckToDelete_CheckedChanged(this)" disabled="disabled"></td></tr>--%>
<%--                                                                                        <tr>--%>
<%--                                                                                            <td style="width: 30px;" valign="middle" align="center">2</td>--%>
<%--                                                                                            <td style="display:none" valign="middle" align="center">INT144901  01</td>--%>
<%--                                                                                            <td style="width: 60px;" valign="middle" align="center">INT1449</td>--%>
<%--                                                                                            <td style="width: 180px;" valign="middle" align="left">&nbsp;Phát triển ứng dụng cho các thiết bị di động</td>--%>
<%--                                                                                            <td style="width: 35px;" valign="middle" align="center">01</td>--%>
<%--                                                                                            <td style="width: 45px;" valign="middle" align="center">01</td>--%>
<%--                                                                                            <td style="width: 35px;" valign="middle" align="center">3</td>--%>
<%--                                                                                            <td style="width: 35px;" valign="middle" align="center">0</td>--%>
<%--                                                                                            <td style="width: 80px;" valign="middle" align="right">00&nbsp;</td>--%>
<%--                                                                                            <td style="width: 80px;" valign="middle" align="right">&nbsp;</td>--%>
<%--                                                                                            <td style="width: 80px;" valign="middle" align="right">00&nbsp;</td>--%>
<%--                                                                                            <td valign="middle" align="left">&nbsp; Bắt buộc phải học</td>--%>
<%--                                                                                            <td valign="middle" align="left" style="width: 50px;"><input style="visibility:hidden" type="checkbox" id="chk_INT144901  01" name="chk_xoa" value="INT144901  01" onclick="CheckToDelete_CheckedChanged(this)" disabled="disabled"></td></tr>--%>
<%--                                                                                            <tr>--%>
<%--                                                                                                <td style="width: 30px;" valign="middle" align="center">3</td>--%>
<%--                                                                                                <td style="display:none" valign="middle" align="center">INT1314503    </td>--%>
<%--                                                                                                <td style="width: 60px;" valign="middle" align="center">INT13145</td>--%>
<%--                                                                                                <td style="width: 180px;" valign="middle" align="left">&nbsp;Kiến trúc máy tính</td>--%>
<%--                                                                                                <td style="width: 35px;" valign="middle" align="center">03</td>--%>
<%--                                                                                                <td style="width: 45px;" valign="middle" align="center"></td>--%>
<%--                                                                                                <td style="width: 35px;" valign="middle" align="center">3</td>--%>
<%--                                                                                                <td style="width: 35px;" valign="middle" align="center">0</td>--%>
<%--                                                                                                <td style="width: 80px;" valign="middle" align="right">00&nbsp;</td>--%>
<%--                                                                                                <td style="width: 80px;" valign="middle" align="right">&nbsp;</td>--%>
<%--                                                                                                <td style="width: 80px;" valign="middle" align="right">00&nbsp;</td>--%>
<%--                                                                                                <td valign="middle" align="left">&nbsp; Bắt buộc phải học</td>--%>
<%--                                                                                                <td valign="middle" align="left" style="width: 50px;"><input style="visibility:hidden" type="checkbox" id="chk_INT1314503    " name="chk_xoa" value="INT1314503    " onclick="CheckToDelete_CheckedChanged(this)" disabled="disabled"></td></tr>--%>
<%--                                                                                                <tr>--%>
<%--                                                                                                    <td style="width: 30px;" valign="middle" align="center">4</td>--%>
<%--                                                                                                    <td style="display:none" valign="middle" align="center">INT134113    </td>--%>
<%--                                                                                                    <td style="width: 60px;" valign="middle" align="center">INT1341</td>--%>
<%--                                                                                                    <td style="width: 180px;" valign="middle" align="left">&nbsp;Nhập môn trí tuệ nhân tạo</td>--%>
<%--                                                                                                    <td style="width: 35px;" valign="middle" align="center">13</td>--%>
<%--                                                                                                    <td style="width: 45px;" valign="middle" align="center"></td>--%>
<%--                                                                                                    <td style="width: 35px;" valign="middle" align="center">3</td>--%>
<%--                                                                                                    <td style="width: 35px;" valign="middle" align="center">0</td>--%>
<%--                                                                                                    <td style="width: 80px;" valign="middle" align="right">00&nbsp;</td>--%>
<%--                                                                                                    <td style="width: 80px;" valign="middle" align="right">&nbsp;</td>--%>
<%--                                                                                                    <td style="width: 80px;" valign="middle" align="right">00&nbsp;</td>--%>
<%--                                                                                                    <td valign="middle" align="left">&nbsp; Bắt buộc phải học</td>--%>
<%--                                                                                                    <td valign="middle" align="left" style="width: 50px;"><input style="visibility:hidden" type="checkbox" id="chk_INT134113    " name="chk_xoa" value="INT134113    " onclick="CheckToDelete_CheckedChanged(this)" disabled="disabled"></td></tr>--%>
<%--                                                                                                    <tr>--%>
<%--                                                                                                        <td style="width: 30px;" valign="middle" align="center">5</td>--%>
<%--                                                                                                        <td style="display:none" valign="middle" align="center">INT141605    </td>--%>
<%--                                                                                                        <td style="width: 60px;" valign="middle" align="center">INT1416</td>--%>
<%--                                                                                                        <td style="width: 180px;" valign="middle" align="left">&nbsp;Đảm bảo chất lượng phần mềm</td>--%>
<%--                                                                                                        <td style="width: 35px;" valign="middle" align="center">05</td>--%>
<%--                                                                                                        <td style="width: 45px;" valign="middle" align="center"></td>--%>
<%--                                                                                                        <td style="width: 35px;" valign="middle" align="center">3</td>--%>
<%--                                                                                                        <td style="width: 35px;" valign="middle" align="center">0</td>--%>
<%--                                                                                                        <td style="width: 80px;" valign="middle" align="right">00&nbsp;</td>--%>
<%--                                                                                                        <td style="width: 80px;" valign="middle" align="right">&nbsp;</td>--%>
<%--                                                                                                        <td style="width: 80px;" valign="middle" align="right">00&nbsp;</td>--%>
<%--                                                                                                        <td valign="middle" align="left">&nbsp; Bắt buộc phải học</td>--%>
<%--                                                                                                        <td valign="middle" align="left" style="width: 50px;"><input style="visibility:hidden" type="checkbox" id="chk_INT141605    " name="chk_xoa" value="INT141605    " onclick="CheckToDelete_CheckedChanged(this)" disabled="disabled"></td></tr>--%>
<%--                                                                                                        <tr style="font-weight: bold;" height="20px">--%>
<%--                                                                                                            <td valign="middle" align="center" colspan="5">Tổng cộng</td>--%>
<%--                                                                                                            <td valign="middle" align="center">16</td>--%>
<%--                                                                                                            <td valign="middle" align="center">00</td>--%>
<%--                                                                                                            <td valign="middle" align="right">00&nbsp;</td>--%>
<%--                                                                                                            <td valign="middle" align="right">00&nbsp;</td>--%>
<%--                                                                                                            <td valign="middle" align="right">00&nbsp;</td>--%>
<%--                                                                                                            <td valign="middle" align="left"></td>--%>
<%--                                                                                                            <td valign="middle" align="center">--%>
<%--                                                                                                            </td>--%>

<%--                                                                                                        </tr></tbody></table></div>--%>
                                                                                                    </div>
                                                                                                    <br>

                                                                                                    <div style="text-align: right">
                                                                                                        <span id="ctl00_ContentPlaceHolder1_ctl00_lblNote" class="Label" style="color:Gray;font-size:10px;font-style:italic;">( Diễn giải: ĐK (đăng ký); Mã MH (mã môn học); NMH (Nhóm môn học); TTH (Tổ thực hành); STC (Số tín chỉ); STCHP (Số tín chỉ học phí); CL (Còn lại); TH (Thực hành) )</span>
                                                                                                    </div>

                                                                                                    <br>





                                                                                                </div>
                                                                                                <div id="ctl00_ContentPlaceHolder1_ctl00_pnlDanhGia">


                                                                                                </div>
                                                                                                <div id="ctl00_ContentPlaceHolder1_ctl00_pnlNguyenVong">




                                                                                                    <br>


                                                                                                </div>





                                                                                            </div>





                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>


                                                                                            <style type="text/css">

                                                                                                .style3
                                                                                                {
                                                                                                    width: 70px;
                                                                                                }
                                                                                                .style4
                                                                                                {
                                                                                                    width: 129px;
                                                                                                }
                                                                                                .style5
                                                                                                {
                                                                                                    width: 1019px;
                                                                                                }

                                                                                            </style>

                                                                                            <div class="footer">
                                                                                                <table width="100%"><tbody><tr><td align="left" class="style5">
                                                                                                    <img src="App_Themes/Standard/Images/icon_11c.gif" alt="">
                                                                                                    <span class="LogoFooter"><span id="ctl00_Footer1_lblCompany" class="Label">Copyright ©2009 Học Viện Công Nghệ Bưu Chính Viễn Thông-Cơ Sở Miền Bắc. Quản lý bởi </span></span>
                                                                                                </td>

                                                                                                <td valign="top" align="left" class="style4">
                                                                                                    <img src="App_Themes/Standard/Images/iconHome.png" alt="" align="right">    
                                                                                                </td>
                                                                                                <td align="left" class="style3">
                                                                                                    <a href="Default.aspx"><span id="ctl00_Footer1_lbltrangchu" class="Label">Trang Chủ</span></a>
                                                                                                </td>


                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td class="style5">
                                                                                                    <img src="App_Themes/Standard/Images/icon_11c.gif" alt=""> 
                                                                                                    <a href="https://aqtech.vn/" target="_blank"><span id="ctl00_Footer1_lblCopyRight" class="Label">Thiết kế bởi cty Phần mềm Anh Quân</span></a>



                                                                                                </td>
                                                                                                <td align="right" valign="top" class="style4"> 
                                                                                                    <img src="App_Themes/Standard/Images/topTen.gif" width="15px" alt="">
                                                                                                </td>
                                                                                                <td class="style3">
                                                                                                    <a href="#Top" title="Go to top" style="text-decoration: none; font-family:Tahoma;font-size:8pt">
                                                                                                        <span id="ctl00_Footer1_lbltop" class="Label">Đầu Trang</span>
                                                                                                    </a>
                                                                                                </td>
                                                                                                <td align="right"><a href="Default.aspx?page=thongtinsp"><span id="ctl00_Footer1_lblAbout" class="Label">About</span></a></td>
                                                                                            </tr>

                                                                                        </tbody></table></div>

                                                                                    </td>
                                                                                </tr>
                                                                            </tbody></table>
                                                                        </div>
                                                                    </div>



<!-- <script language="JavaScript">LoadDSKhoaLop_load('Lọc >>|Lọc >>|Lưu Đăng Ký|Xóa|Lưu|Vượt số tín chỉ tối đa cho phép!|SV cân nhắc kỹ, vẫn tiếp tục chọn|Môn học vừa chọn bị trùng TKB, không được phép chọn!|Không có môn học nào được chọn để xóa!|Xác nhận xóa các môn đã chọn?|Xác nhận xóa tất cả các môn đã đăng ký?|Vui lòng nhập vào điều kiện cần lọc!|Server đang bận, vui lòng đợi chọn lưu lại lần nữa!|100|Bạn có muốn đóng 100% học phí cho lần đầu, nếu đóng 100% chọn Cancle   |Không được phép đăng ký môn học trùng với môn niên chế (môn bắt buộc học)|Vui lòng đợi trong khi môn trước được kiểm tra|Ngoài thời gian cho phép đăng ký môn học!|Môn học vừa chọn nằm ngoài chuyên ngành chuyên sâu chuyên ngành chính của sinh viên|Môn học vừa chọn nằm ngoài chuyên ngành chuyên sâu chuyên ngành 2 của sinh viên|Môn đăng ký học cải thiện cần có điểm tổng kết môn lớn hơn D|Môn đăng ký học cải thiện cần có điểm tổng kết môn lớn hơn D và số chênh lệch học kỳ tính đến học kỳ hiện tại là |Môn học vừa chọn bị trùng tổng số tiết với TKB cũ là |tổng số tiết. SV phải cân nhắc kỹ, vẫn tiếp tục chọn?|Môn vừa đăng ký bị trùng lịch thi với môn đã chọn trước đó, không thể chọn!|Môn vừa chọn trùng lịch thi với môn chọn trước đó, vẫn tiếp tục lưu ?|Môn vừa đăng ký bị trùng lịch thi với môn đã chọn trước đó, vượt quá số cho phép trùng tối đa |Đã qua thời gian đăng ký, không thể xóa|(Không có môn học được mở)|Không đủ số tín chỉ đăng ký tích lũy (hoặc đạt tích lũy) để đăng ký môn |Không thể thay đổi kqdk vượt quá phạm vi số tín chỉ max quy định trong đợt đăng ký 1|0');</script>
<script type="text/javascript">
//<![CDATA[
Sys.Application.initialize();
//]]>
</script> -->
</form>




<img src="arrowdown.gif" id="arrowhead"></body></html>
