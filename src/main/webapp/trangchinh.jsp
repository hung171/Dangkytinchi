<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@include file="/header.jsp" %>
    <script async="" src="//za.zdn.vn/v3/za.js?19428"></script>
    <script language="javascript" type="text/javascript">

        var gv = 'False';
    </script>
    <script type="text/javascript" src="https://apis.google.com/js/platform.js?hl=vn" async="" defer=""
            gapi_processed="true"></script>
    <meta name="google-signin-scope" content="profile email"  http-equiv="Content-Type" >
    <meta id="ctl00_metaGoogle" name="google-signin-client_id" >
    <link id="ctl00_favicon" rel="shortcut icon" type="image/x-icon" href="Images/Edusoft.gif">
    <script src="js/jquery-2.2.1.js" type="text/javascript"></script>
    <script src="js/dialog.js" type="text/javascript"></script>
    <script src="js/checkdate.js" type="text/javascript"></script>
    <script src="js/balloontip.js" type="text/javascript"></script>
    <link href="js/balloontip.css" rel="stylesheet" type="text/css">
    <title>
        Cổng Thông Tin Đào Tạo-Học Viện Công Nghệ Bưu Chính Viễn Thông-Cơ Sở Miền Bắc-BCVTVTHN
    </title>
    <script type="text/javascript" language="javascript">

        function ShowMess() {
            var url = location.href;
            if (url.indexOf("err=serveroverload", 0) > 0)
                alert('Server quá tải, vui lòng đăng nhập lại!');
            else if (url.indexOf("err=sessionreuse", 0) > 0)
                alert('Vui lòng tắt và mở lại trình duyệt!');
        }

        $(function () {
            if (typeof AjaxPro != 'undefined' && AjaxPro && AjaxPro.Request && AjaxPro.Request.prototype) {
                AjaxPro.Request.prototype.doStateChange = function () {
                    this.onStateChanged(this.xmlHttp.readyState, this);
                    if (this.xmlHttp.readyState != 4 || !this.isRunning) {
                        return;
                    }
                    this.duration = new Date().getTime() - this.__start;
                    if (this.timeoutTimer != null) {
                        clearTimeout(this.timeoutTimer);
                    }
                    var res = this.getEmptyRes();
                    if (this.xmlHttp.status == 200 && (this.xmlHttp.statusText == "OK" || !this.xmlHttp.statusText)) {
                        res = this.createResponse(res);
                    } else {
                        res = this.createResponse(res, true);
                        res.error = {
                            Message: this.xmlHttp.statusText,
                            Type: "ConnectFailure",
                            Status: this.xmlHttp.status
                        };
                    }
                    this.endRequest(res);
                };
            }
            //gapi.load('auth2', function () {
            //    gapi.auth2.GoogleUser(u => {
            //        u.getAuthResponse(a => {
            //            EduSoft.Web.DefaultMaster.CheckGoogle(a.id_token, x => {
            //                if (x.value) {
            //                    self.location = decodeURIComponent(x.value);
            //                }
            //            });
            //        });
            //    });
            //}
        });
    </script>

    <link href="/WebResource.axd?d=We1xxkxE0WKe855rlV518V6bZ9tqOgwMjVh1QYXUtjuuNMdnSeJdlQG-nMmCrt9Kbr-Ba-9bAZEft_pYKFNSG3cq_r4w-80Wpyxb7vHmtI1i4oZtaD_MUwmDlvekWnxbQhD2cEDX9QyMaFi3XCVsPcQFt5sYh1nRQjBRmT872gB0DkFf0&amp;t=637971178500000000"
          rel="stylesheet" type="text/css">
    <link href="css/Standard.css" type="text/css" rel="stylesheet">
    <link href="css/StyleSheet.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .ctl00_ContentPlaceHolder1_ctl00_leftMenu_0 {
            background-color: white;
            visibility: hidden;
            display: none;
            position: absolute;
            left: 0px;
            top: 0px;
        }

        .ctl00_ContentPlaceHolder1_ctl00_leftMenu_1 {
            color: Black;
            font-size: 12px;
            font-weight: bold;
            text-decoration: none;
        }

        .ctl00_ContentPlaceHolder1_ctl00_leftMenu_2 {
            color: Black;
            background-color: #B0C5FF;
            border-style: None;
            font-size: 12px;
            font-weight: bold;
        }

        .ctl00_ContentPlaceHolder1_ctl00_leftMenu_3 {
            background-color: #B0C5FF;
            width: 200px;
        }

    </style>
</head>

<body background="css/Images/background.png" onload="ShowMess()">
<c:if test="${sessionScope.sinhvien eq null}">
    <c:redirect url="gdDangNhap.jsp?err=timeout"/>
</c:if>
<form name="aspnetForm" method="post" action="Default.aspx?page=gioithieu" id="aspnetForm"
      enctype="multipart/form-data">
    <div>
        <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="">
        <input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="">
        <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE"
               value="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bmggdGjhu6ljIGzhu5twIHJpw6puZyBj4bunYSBo4buNYyBr4buzIDIsIG7Eg20gaOG7jWMgPC9zcGFuPjwvc3Bhbj48L3A+PHA+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiBUaW1lcyBOZXcgUm9tYW47Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNHB0OyI+MjAyMi0yMDIzIMSR4buRaSB24bubaSBzaW5oIHZpw6puIGPDoWMgbOG7m3AgxJDhuqFpIGjhu41jIGNow61uaCBxdXksIGNoaSB0aeG6v3Qgc2luaCB2acOqbiB4ZW0gdOG6oWk6PC9zcGFuPjwvc3Bhbj48L3A+PHA+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiBUaW1lcyBOZXcgUm9tYW47Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNHB0OyI+PGEgaHJlZj0iaHR0cHM6Ly9wb3J0YWwucHRpdC5lZHUudm4vZ2lhb3Z1L3Rob25nLWJhby12di10by1jaHVjLWNhYy1sb3AtaG9jLWxhaS1ob2MtY2FpLXRoaWVuLWRpZW0tdGhlby1sb3AtcmllbmctaG9jLWt5LTItbmFtLWhvYy0yMDIyLTIwMjMtY2hvLXNpbmgtdmllbi1jYWMtbG9wLWRhaS1ob2MtY2hpbmgtcXV5LyI+aHR0cHM6Ly9wb3J0YWwucHRpdC5lZHUudm4vZ2lhb3Z1L3Rob25nLWJhby12di10by1jaHVjLWNhYy1sb3AtaG9jLWxhaS1ob2MtY2FpLXRoaWVuLWRpZW0tdGhlby1sb3AtcmllbmctaG9jLWt5LTItbmFtLWhvYy0yMDIyLTIwMjMtY2hvLXNpbmgtdmllbi1jYWMtbG9wLWRhaS1ob2MtY2hpbmgtcXV5LzwvYT48L3NwYW4+PC9zcGFuPjwvcD48cD48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6IFRpbWVzIE5ldyBSb21hbjsiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE0cHQ7Ij48c3Bhbj5N4buNaSB24bqlbiDEkeG7gSBj4bqnbiBnaeG6o2kgxJHDoXAgbGnDqm4gaOG7hyBz4buRIMSRaeG7h24gdGhv4bqhaSAwOC44OTc4LjMyMDIgKDhoMzAtMTFo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L2E+PC9zcGFuPh8DAoCABGRkAhIPFgIfAgUgPC90ZD4gPHRkICBzdHlsZT0nZGlzcGxheTpub25lJz5kAhUPZBYCAgEPFgIfAgXDCjwvdGQ+DQogICAgICAgICAgICAgICAgICAgICAgICA8dGQgd2lkdGg9JzE0JScgdmFsaWduPSd0b3AnPg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxkaXYgY2xhc3M9J25hdmlnYXRlLWJhc2UnPg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSd0aXRsZS1iYXNlJz4NCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxkaXYgY2xhc3M9J3RpdGxlJz4NCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dGFibGU+DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0cj4NCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZCB3aWR0aD0nMTBweCcgPg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxpbWcgc3JjPSdBcHBfVGhlbWVzL1N0YW5kYXJkL0ltYWdlcy9pY29uXzA0Yi5naWYnIC8+PC90ZD4NCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZCB2YWxpZ249J3RvcCc+DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTEnDik4gS+G6vlQNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdGQ+DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdHI+DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC90YWJsZT4NCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvZGl2Pg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L2Rpdj4NCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRhYmxlIGJvcmRlcj0nMSc+PHRyPjx0ZCBhbGlnbj0nY2VudGVyJz48YSBocmVmPWh0dHA6Ly93d3cucHRpdC5lZHUudm4+PGltZyBzcmM9Jy4vTWVzc2FnZUZpbGUvMjQyNzk0TG9nbzIuZ2lmJ3N0eWxlPSd3aWR0aDogMTMwcHgnLz48L2E+PC9icj48YSBocmVmPWh0dHA6Ly93d3cucHRpdC5lZHUudm4gcnVuYXQ9J3NlcnZlcicgaWQ9MT5I4buNYyB2aeG7h24gQ8O0bmcgbmdo4buHIELGsHUgY2jDrW5oIHZp4buFbiB0aMO0bmc8L2E+PC90ZD48L3RyPjx0cj48dGQgYWxpZ249J2NlbnRlcic+PGEgaHJlZj1odHRwczovL3BvcnRhbC5wdGl0LmVkdS52bi9naWFvdnUvIHJ1bmF0PSdzZXJ2ZXInIGlkPTU+VHJhbmcgdGluIHBow7JuZyBHacOhbyB24bulPC9hPjwvdGQ+PC90cj48L3RhYmxlPg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvZGl2PmQCFg8WAh8CBSA8L3RkPiA8dGQgIHN0eWxlPSdkaXNwbGF5Om5vbmUnPmQCGQ8WAh8CBSA8L3RkPiA8dGQgIHN0eWxlPSdkaXNwbGF5Om5vbmUnPmQCCQ9kFggCAQ8PFgIfAgVtQ29weXJpZ2h0IMKpMjAwOSBI4buNYyBWaeG7h24gQ8O0bmcgTmdo4buHIELGsHUgQ2jDrW5oIFZp4buFbiBUaMO0bmctQ8ahIFPhu58gTWnhu4FuIELhuq9jLiBRdeG6o24gbMO9IGLhu59pIGRkAgMPDxYCHwIFC1RyYW5nIENo4bunZGQCBQ8PFgIfAgUtVGhp4bq/dCBr4bq/IGLhu59pIGN0eSBQaOG6p24gbeG7gW0gQW5oIFF1w6JuZGQCBw8PFgIfAgUMxJDhuqd1IFRyYW5nZGQYAQUeX19Db250cm9sc1JlcXVpcmVQb3N0QmFja0tleV9fFgIFOmN0bDAwJENvbnRlbnRQbGFjZUhvbGRlcjEkY3RsMDAkTWVzc2FnZUJveDEkaW1nQ2xvc2VCdXR0b24FMWN0bDAwJENvbnRlbnRQbGFjZUhvbGRlcjEkY3RsMDAkTWVzc2FnZUJveDEkYnRuT2uqYUqhcSJXGBj4Trn7jlu4dS5PdQ==">
    </div>

    <script type="text/javascript">
        //<![CDATA[
        var theForm = document.forms['aspnetForm'];
        if (!theForm) {
            theForm = document.aspnetForm;
        }

        function __doPostBack(eventTarget, eventArgument) {
            if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
                theForm.__EVENTTARGET.value = eventTarget;
                theForm.__EVENTARGUMENT.value = eventArgument;
                theForm.submit();
            }
        }

        //]]>
    </script>


    <script src="/WebResource.axd?d=jt9AYvi6V4xQfahTuUfOjEB2_HCph3X5HoThGgDhpmxRbJoF3kOsNFGyP420TbaPGyY3vQcN-4OIvj4Yk_NwLt7zBF41&amp;t=636041026940000000"
            type="text/javascript"></script>


    <script type="text/javascript">
        //<![CDATA[

        function ShowMsgBox(type, message, height, width) {
            if (width == undefined)
                width = '340';
            if (height == undefined)
                height = '60';
            var ajaxModal = $get('ctl00_ContentPlaceHolder1_ctl00_MessageBox1_ajaxModal');
            var headerText = $get('ctl00_ContentPlaceHolder1_ctl00_MessageBox1_lblPopupHeader');
            $get('ctl00_ContentPlaceHolder1_ctl00_MessageBox1_lblMessageDisplay').innerHTML = message;
            $get('ctl00_ContentPlaceHolder1_ctl00_MessageBox1_panelMessageBox').style.width = width + 'px';
            $get('ctl00_ContentPlaceHolder1_ctl00_MessageBox1_panelBody').style.height = height + 'px';
            $get('ctl00_ContentPlaceHolder1_ctl00_MessageBox1_ctl03').style.width = (parseInt(width) - 70) + 'px';
            $get('ctl00_ContentPlaceHolder1_ctl00_MessageBox1_lblMessageDisplay').style.width = (parseInt(width) - 80) + 'px';
            var imgType = $get('ctl00_ContentPlaceHolder1_ctl00_MessageBox1_ctl02');
            if (type.toLowerCase() == 'success') {
                headerText.innerHTML = 'Successful';
                imgType.src = '/WebResource.axd?d=ueZNHdikR8SawKpVsjOg3p78kad0RWg9XgKNm4ZmBF8LjS8vUUsSkQvWm-F8moeZfIGbyoVnbi4VQxECZUYVBi9EqabH-NBR5qgXb02LF73Abu_VbGyhfEdNsWgkvwdeUtfL8Ih6qxaKkB7xCFpTkopjr_DBzShhi6IW1eqLhBxnZdxP0&t=637971178500000000';
            } else if (type.toLowerCase() == 'error') {
                headerText.innerHTML = 'Error';
                imgType.src = '/WebResource.axd?d=wd1HEF4UJoQCwqMCmgH-ViDZTqcNoaCmTwEKb2TZfvMbOx3tSeIaZc3PgWbKWThlWK9aR2d2NqoI_1zD_qxQsujodrEtiyNnUkgjGcsP5Nu5pBD8bA1M2saTx8JTsoG6pMHtIfZrxptkIwtlCsYHvG5W5pLQMdtM_MuuxXuG0puxog8L0&t=637971178500000000';
            } else if (type.toLowerCase() == 'warning') {
                headerText.innerHTML = 'Warning';
                imgType.src = '/WebResource.axd?d=OntmoJqe7pjqeIF85w6t-F1EchMBKlPp4PLJvIHeDWl0sVleSdvs3lbPsErdiq9KYkRDkcwKy9g8E9CNPYSaFm3Va2-yBH6zZrsrFkEnXaKPQd5JQpioiavkbIzxAHJ4ykeaTGyGGLV0TONRLfDfPTEKFufP2mmMsEE68wjhe8YxaZa40&t=637971178500000000';
            } else {
                headerText.innerHTML = 'Information';
                imgType.src = '/WebResource.axd?d=OntmoJqe7pjqeIF85w6t-F1EchMBKlPp4PLJvIHeDWl0sVleSdvs3lbPsErdiq9KYkRDkcwKy9g8E9CNPYSaFm3Va2-yBH6zZrsrFkEnXaKPQd5JQpioiavkbIzxAHJ4ykeaTGyGGLV0TONRLfDfPTEKFufP2mmMsEE68wjhe8YxaZa40&t=637971178500000000';
            }

            $find('ctl00_ContentPlaceHolder1_ctl00_MessageBox1_ajaxModal').show();
            $get('ctl00_ContentPlaceHolder1_ctl00_MessageBox1_btnOk').focus();
        }

        //]]>
    </script>

    <script type="text/javascript" src="/ajaxpro/prototype.ashx"></script>
    <script type="text/javascript" src="/ajaxpro/core.ashx"></script>
    <script type="text/javascript" src="/ajaxpro/converter.ashx"></script>
    <script type="text/javascript" src="/ajaxpro/EduSoft.Web.DefaultMaster,EduSoft.Web.ashx"></script>
    <script type="text/javascript" src="/ajaxpro/EduSoft.Web.UC.Logout,EduSoft.Web.ashx"></script>
    <script type="text/javascript" src="/ajaxpro/EduSoft.Web.UC.GioiThieu,EduSoft.Web.ashx"></script>
    <script type="text/javascript" src="/ajaxpro/EduSoft.Web.UC.DangNhap,EduSoft.Web.ashx"></script>
    <script type="text/javascript" src="/ajaxpro/EduSoft.Web.UC.Footer,EduSoft.Web.ashx"></script>

    <script src="/ScriptResource.axd?d=QE7e42dSO6CDvULkF39HDRa7qgh-I273xY5hErCCz8VtqULZUFaPNdQifk0F4BsQ9iqvXOYhdj3Ue9I1boLCjIRDJjDcwBfcTH28RwndRL8mGBBfMl9mxePOumzT45zsKUOg2w2&amp;t=5e6d60e4"
            type="text/javascript"></script>
    <script src="/ScriptResource.axd?d=cQEGyShy-dS7kws6qYG_sqi3E-kmwZRs69oWT4rAxeWs_376QBIpjdyOE0wCCh7EreRkb8gsolMxTRChg7v_DSQ7csjEGasGVgtCZaC0EtOQ0EijMf6xosmx6uKEyFDcWi6B3gFaQk9LiI0ixtq_Rw6OTIiFLQm6fE2tm6eI_0ZDDZJF0&amp;t=fffffffffa2fd9a5"
            type="text/javascript"></script>
    <script type="text/javascript">
        //<![CDATA[
        if (typeof (Sys) === 'undefined') throw new Error('ASP.NET Ajax client-side framework failed to load.');
        //]]>
    </script>

    <script src="/ScriptResource.axd?d=6JBD0DCh1Udh_vOoTWo4Q-rjZ3n7NYE5S_EKtNUwbjLEaD3OUDOSB6i9UwOVTRM04UQ4My4LjqWOaHtaYKWZ6IvADJ-rbptcovlGPDj6a8sUGaSmkES5o4qtHFyNsgGyyLUsJCZmuaAIUgRHT_VZHaPWQ9_6WQrFpB5QUtCh2DHEF4gJ0&amp;t=fffffffffa2fd9a5"
            type="text/javascript"></script>
    <script src="/ScriptResource.axd?d=LwkciltALtBi1932T3DRtmNQcuTetMs3X2RkE29VbENYDuJPvRFItZoFOw_4wSZh8Unq5F9xafiFmKZu8p2jXaUr3ENFPb7MBJJeHUMooRiba_CoiTaaJC686AMu7sWPFV1aCdYvSYwHGhduj70RZ1Mt0zc1&amp;t=2e070b50"
            type="text/javascript"></script>
    <script src="/ScriptResource.axd?d=xDY5DWuTX0I6Z-X1onZpvlDt7MfXp89tAN-lPZrgulW17JOp7vyIYUZVvLS27qW9lW-88SDBEK-rriJxpjUFZXfyHChqFLsiXIQOuUFoWfjbUL16ofzWo1m93V8QMm9fVzvayKcRmS7nYmfqwxAO3Cg5yNE1&amp;t=2e070b50"
            type="text/javascript"></script>
    <script src="/ScriptResource.axd?d=LuyCDmnZbYjV3AF9ywWfruTuekenXfN4eFdkLOLTcPOSvfSXkNg8hpYzu6vdfFO9iND0OCs_oHVe5CuuYrrPty0h9FxdnvxA_9nBZZOWv-Te8l1j9p65fmE3qjmBd2dpNLo7s1MeWX4rBI9DjqTdzzP4SC0A3jsLDNAelLEwDXD8eziF0&amp;t=2e070b50"
            type="text/javascript"></script>
    <script src="/ScriptResource.axd?d=QGXu0q9_1MR0pB4bBBhZl0cgnCe4NBGNLAgcHdCQ1i-j2NnqU8tK_YniU77XcKsnGEgp60KxyWyS545Onz81RhjrcTRBJJmHaP3c6Xs_ouuAdm3SvtjGkMBw5h7QNPu-1AWQpZ0pt-n-AKAP5-we06J1TTM1&amp;t=2e070b50"
            type="text/javascript"></script>
    <script src="/ScriptResource.axd?d=5UEqi4DckobNvUBMF2AbGwWPIzH_LG-hfg4AAGPh3g3H5tJ80r46TjphvIZFz6GyYEVADxog651bGRjCi2b4dpN_meeH1OaVNygNhv5qMRex4v7uiSK5Di8oYmAKC5tBScXjGYlRqeOtv87qCV9_GlxGT841&amp;t=2e070b50"
            type="text/javascript"></script>
    <script src="/ScriptResource.axd?d=xn0ln7TQKH4-yheiTPreipmnbG72qmiMpHxeLN8yHY_xTPC59fvUCyz6Mdm_rU3SN-0b4X3r6NaMg9-Vs1i5NO4yjY7xIuFG-ex-3cIeVhMox91JIN8Pp2vrW0mFbHVvUUhHnAh2AX5vje6xgK2HHhsAShnf4Nw1vOX8j7crputFhxmr0&amp;t=2e070b50"
            type="text/javascript"></script>
    <script src="/ScriptResource.axd?d=gXcI8nYDPCqjxOeVj2fWFe-elrWD54vpy7Pk8lCZRrqDikm9zLdHH-eZ01KSlt7MrasyhetlXviBvYQBNPEOoaN4UeAvJyccbrEQ4A9FOKlCEFFNsXUIc_Qlk0F8GYw0NIFXR51brFaqGzn-VL3_AeUk7I8swZlN73zLzzIgcTEM1fMQ0&amp;t=2e070b50"
            type="text/javascript"></script>
    <script src="/ScriptResource.axd?d=6UBKjjNDEfyiEPrGP3QqEE1tOtZ2Umy1h1YVFdXDFn2h4vRblat_HDj-WP8hwVgzZ20uCDI6669Vfus_-yHhDwWewfS-xVra8b0h_pj-FZa1IAONZzZhjnw-gRshtjVJ7fBUgUQJA-VTHA3fwT-5l0AhW5TQDzt6IqSSTxjGbcELQQYe0&amp;t=2e070b50"
            type="text/javascript"></script>
    <script src="/ScriptResource.axd?d=FpTWHZW_NvVLWzbAeOq876OXidpxC6yrMajXrIJg-aEiYtf0oG7K8FkfF-WWHjup832w2H0co74rg1LViPxgcakH3FhKet-XQ2t_CD7Z5HO7B_ncObBe-M2rAhshyFXPW3xDwieqeo3_m9Vvd9Yl_msyLmPUVwMdq4hFP0pNhUiUp-w50&amp;t=2e070b50"
            type="text/javascript"></script>
    <div>

        <input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="CA0B0334">
    </div>
    <div align="center">
        <div class="base">

            <table>
                <tbody>
                <tr>
                    <td>


                        <div>
                            <table width="1000px">
                                <tbody>
                                <tr>
                                    <td height="115px" style="padding-left: 50px" valign="bottom" align="right">


                                        <script language="javascript" type="text/javascript">

                                            function changeLanguage_click(obj) {
                                                EduSoft.Web.UC.Logout.ChangeLanguage(obj, changeLanguage_callback);
                                            }

                                            function changeLanguage_callback() {
                                                var loc = window.location.href;
                                                if (loc.endsWith("/")) loc = loc.substr(0, loc.length - 1);
                                                if (loc.toLowerCase().indexOf("default.aspx") <= 0)
                                                    self.location = loc + "/default.aspx?pgtemp=x";
                                                else if (loc.toLowerCase().indexOf("?") <= 0)
                                                    self.location = loc + "?lang=x";
                                                else if (loc.endsWith("&lang=x"))
                                                    self.location = loc.replace("&lang=x", "&lang=y");
                                                else if (loc.endsWith("&lang=y"))
                                                    self.location = loc.replace("&lang=y", "&lang=x");
                                                else
                                                    self.location = loc + "&lang=x";
                                            }

                                            function selectFont_change() {
                                                var selectmenu = document.getElementById("selectFont");
                                                var chosenOption = selectmenu.options[selectmenu.selectedIndex];
                                                var font = chosenOption.value;
                                                EduSoft.Web.UC.Logout.ChangeFont(font, ChangeFont_callback);
                                            }

                                            function ChangeFont_callback() {
                                                //self.location=window.location;
                                            }

                                            function ConfirmChuaLuu(obj) {

                                                alert(obj);
                                                self.location = "default.aspx?page=dkmonhoc";
                                            }


                                            function signOutGoogle(dest) {
                                                var url = 'https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue='
                                                    + decodeURIComponent(dest);
                                                document.location = url;

                                                //gapi.load('auth2', function () {
                                                //    gapi.auth2.init();
                                                //    var auth = gapi.auth2.GoogleAuth;
                                                //    auth.signOut().then(function () {
                                                //        location = decodeURIComponent(dest) + 'page=gioithieu';
                                                //    });
                                                //});
                                            }
                                        </script>

                                        <div id="ctl00_Header1_Logout1_dLog" class="logout"
                                             style="text-align: right; margin-bottom: 0px">

                                            <img src="App_Themes/Standard/Images/US.gif" alt="English"
                                                 onclick="changeLanguage_click('_us')" id="imgUS" title="English">
                                            <img src="App_Themes/Standard/Images/VI.gif" alt="Vietnamese"
                                                 onclick="changeLanguage_click('_vi')" id="imgVi" title="Vietnamese">
                                            <span id="ctl00_Header1_Logout1_lblNguoiDung" class="Label"
                                                  style="color:MistyRose;font-size:12px;font-weight:bold;">Chào bạn Nguyễn Tấn Hùng (B18DCCN256)</span>&nbsp;<a
                                                id="ctl00_Header1_Logout1_lbtnThongBao"
                                                href="javascript:__doPostBack('ctl00$Header1$Logout1$lbtnThongBao','')"
                                                style="color:MistyRose;font-size:12px;font-style:italic;font-family: 'Tahoma', Times, serif">Xem
                                            thông báo</a><span id="ctl00_Header1_Logout1_lblXiet1" class="Label"
                                                               style="color:MistyRose;"> | </span>
                                            <a id="ctl00_Header1_Logout1_lbtnChangePass"
                                               href="javascript:__doPostBack('ctl00$Header1$Logout1$lbtnChangePass','')"
                                               style="color:MistyRose;font-size:12px;font-weight:bold;font-family: 'Tahoma', Times, serif">Thay
                                                đổi mật khẩu</a>
                                            <span id="ctl00_Header1_Logout1_lblXiet2" class="Label"
                                                  style="color:MistyRose;"> | </span>
                                            <a id="ctl00_Header1_Logout1_lbtnLogOut"
                                               href="javascript:__doPostBack('ctl00$Header1$Logout1$lbtnLogOut','')"
                                               style="color:MistyRose;font-size:10pt;font-weight:bold;font-family: 'Tahoma', Times, serif">Thoát</a>
                                            &nbsp;<select id="selectFont"
                                                          style="font-size: 11px; width: 100px; color: #000080;"
                                                          onchange="selectFont_change()">
                                            <option value="uni">-------Font-------</option>
                                            <option value="uni" selected="">Font Unicode</option>
                                            <option value="abc">Font ABC</option>
                                            <option value="vni">Font Vni</option>
                                            <option value="not">Text không
                                                dấu
                                            </option>
                                        </select>
                                        </div>

                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>


<%--                        <style type="text/css">--%>
<%--                            .styleApplication {--%>
<%--                                font-size: 26;--%>
<%--                                font-weight: bold;--%>
<%--                            }--%>

<%--                            @font-face {--%>
<%--                                font-family: 'myriadpro';--%>
<%--                                src: url('js/myriadpro-bold.otf');--%>
<%--                            }--%>

<%--                            .menufontdhxd {--%>
<%--                                font-family: 'myriadpro';--%>
<%--                                font-size: 14px;--%>
<%--                            }--%>
<%--                        </style>--%>

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
                                                <span id="ctl00_menu_lblDangKyMonHoc"
                                                      class="Label">ĐĂNG KÝ MÔN HỌC</span></a>
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
                                                <span id="ctl00_menu_lblXemLichThi"
                                                      class="Label">XEM LỊCH THI</span></a>
                                        </div>
                                        <div class="right"></div>

                                    </div>

                                    <div id="ctl00_menu_xemlichthilai" class="out-menu">

                                        <div class="left"></div>
                                        <div class="center" style="white-space: nowrap">
                                            <a href="Default.aspx?page=xemlichthilai">
                                                <span id="ctl00_menu_lblXemLichThiLai"
                                                      class="Label">XEM LỊCH THI LẠI</span></a>
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
                                                <span id="ctl00_menu_lblykiensinhvien"
                                                      class="Label">GÓP Ý KIẾN</span></a>
                                        </div>
                                        <div class="right"></div>

                                    </div>


                                    <div id="ctl00_menu_pnlHDSD" class="out-menu">

                                        <div class="left"></div>
                                        <div class="center" style="white-space: nowrap">
                                            <a href="HDDKMH.htm">
                                                <span id="ctl00_menu_lblHuongDanDangKy"
                                                      class="Label">HƯỚNG DẪN ĐKMH</span></a>
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

<span id="ctl00_ContentPlaceHolder1_ctl00_MessageBox1"><a id="ctl00_ContentPlaceHolder1_ctl00_MessageBox1_lbTarget"
                                                          href="javascript:__doPostBack('ctl00$ContentPlaceHolder1$ctl00$MessageBox1$lbTarget','')"></a><div
        id="ctl00_ContentPlaceHolder1_ctl00_MessageBox1_panelMessageBox" class="confirmBox"
        style="display: none; position: fixed; z-index: 100001;">
    <div id="ctl00_ContentPlaceHolder1_ctl00_MessageBox1_panelHeader" class="header">
        <div class="msg">
            <span id="ctl00_ContentPlaceHolder1_ctl00_MessageBox1_lblPopupHeader" class="Label"
                  style="color:White;font-family:Arial Black;"></span>
        </div><input type="image" name="ctl00$ContentPlaceHolder1$ctl00$MessageBox1$imgCloseButton"
                     id="ctl00_ContentPlaceHolder1_ctl00_MessageBox1_imgCloseButton" class="close"
                     src="/WebResource.axd?d=liERUmgzF99J6oTtMmPH4dMGrEZGapo2bZ_e0ZyNvfiiaewYPM80S8rleIkN6BpsYhWm2m1CQjf6lprtzuL-qSiraJvXLbFsYH8EPZXX09HzJXMkK-o_K5tJ7FggYGa8iz4Yhq_pQlC2fPG-IbVCJZ4Mo5V0Wf2L8j6qf1iP6hPLuklI0&amp;t=637971178500000000"
                     style="border-width:0px;">
    </div><div id="ctl00_ContentPlaceHolder1_ctl00_MessageBox1_panelBody" class="body"
               style="background-color:#E1E5F0;">
        <div class="body-left" style="background-color:#E1E5F0;">
            <img id="ctl00_ContentPlaceHolder1_ctl00_MessageBox1_ctl02" src="" style="border-width:0px;">
        </div><div id="ctl00_ContentPlaceHolder1_ctl00_MessageBox1_ctl03" class="body-right"
                   style="background-color:#E1E5F0;">
            <span id="ctl00_ContentPlaceHolder1_ctl00_MessageBox1_lblMessageDisplay" class="Label"
                  style="font-family:Tahoma;color:#263F75;"></span>
        </div>
    </div><div id="ctl00_ContentPlaceHolder1_ctl00_MessageBox1_panelFooter" class="footer"
               style="background-color:#E1E5F0;">
        <div class="right" style="background-color:#E1E5F0;">
            <input type="image" name="ctl00$ContentPlaceHolder1$ctl00$MessageBox1$btnOk"
                   id="ctl00_ContentPlaceHolder1_ctl00_MessageBox1_btnOk" class="button_small_active"
                   src="/WebResource.axd?d=VXD7jC1x8Of0zAABjPR3m45CZIwQvBEGsZw7XL1nyUARPuX_k-53ZcNJasgXWp6ts3tKBHw6ZyZygun9rkQ6wwJp1BLg3PflnELb7DZkPKu9c9Sp14d1oMCaswKsL2EiGVR_Bb14anIaHCl1cDtGPWIjnMRnyIG9DvNfUxvZjd_8E8Zn0&amp;t=637971178500000000"
                   style="height:22px;width:70px;border-width:0px;">
        </div>
    </div>
</div><div id="ctl00_ContentPlaceHolder1_ctl00_MessageBox1_ajaxModal_backgroundElement"
           class="msgbox_messagemodalbackground"
           style="display: none; position: fixed; left: 0px; top: 0px; z-index: 10000;"></div></span>


                        <style type="text/css">
                            #dhtmltooltip {
                                position: absolute;
                                width: 500px;
                                border: 1px solid black;
                                padding: 2px;
                                visibility: hidden;
                                z-index: 100;
                                filter: progid:DXImageTransform.Microsoft.Shadow(color=gray, direction=135);
                            }
                        </style>
                        <div id="dhtmltooltip"></div>

                        <script type="text/javascript" src="https://sp.zalo.me/plugins/sdk.js"></script>

                        <script type="text/javascript">

                            var offsetxpoint = -60 //Customize x offset of tooltip
                            var offsetypoint = 20 //Customize y offset of tooltip
                            var ie = document.all
                            var ns6 = document.getElementById && !document.all
                            var enabletip = false
                            if (ie || ns6)
                                var tipobj = document.all ? document.all["dhtmltooltip"] : document.getElementById ? document.getElementById("dhtmltooltip") : ""

                            function ietruebody() {
                                return (document.compatMode && document.compatMode != "BackCompat") ? document.documentElement : document.body
                            }

                            function ddrivetip(src, thecolor, thewidth) {
                                if (ns6 || ie) {
                                    if (typeof thewidth != "undefined") tipobj.style.width = thewidth + "px"
                                    if (typeof thecolor != "undefined" && thecolor != "") tipobj.style.backgroundColor = thecolor
                                    tipobj.innerHTML = src;
                                    enabletip = true
                                    return false
                                }
                            }

                            function positiontip(e) {
                                if (enabletip) {
                                    var curX = (ns6) ? e.pageX : event.clientX + ietruebody().scrollLeft;
                                    var curY = (ns6) ? e.pageY : event.clientY + ietruebody().scrollTop;
                                    //Find out how close the mouse is to the corner of the window
                                    var rightedge = ie && !window.opera ? ietruebody().clientWidth - event.clientX - offsetxpoint : window.innerWidth - e.clientX - offsetxpoint - 20
                                    var bottomedge = ie && !window.opera ? ietruebody().clientHeight - event.clientY - offsetypoint : window.innerHeight - e.clientY - offsetypoint - 20

                                    var leftedge = (offsetxpoint < 0) ? offsetxpoint * (-1) : -1000

                                    //if the horizontal distance isn't enough to accomodate the width of the context menu
                                    if (rightedge < tipobj.offsetWidth)
                                        //move the horizontal position of the menu to the left by it's width
                                        tipobj.style.left = ie ? ietruebody().scrollLeft + event.clientX - tipobj.offsetWidth + "px" : window.pageXOffset + e.clientX - tipobj.offsetWidth + "px"
                                    else if (curX < leftedge)
                                        tipobj.style.left = "5px"
                                    else
                                        //position the horizontal position of the menu where the mouse is positioned
                                        tipobj.style.left = curX + offsetxpoint + "px"

                                    //same concept with the vertical position
                                    if (bottomedge < tipobj.offsetHeight)
                                        tipobj.style.top = ie ? ietruebody().scrollTop + event.clientY - tipobj.offsetHeight - offsetypoint + "px" : window.pageYOffset + e.clientY - tipobj.offsetHeight - offsetypoint + "px"
                                    else
                                        tipobj.style.top = curY + offsetypoint + "px"
                                    tipobj.style.visibility = "visible"
                                }
                            }

                            function hideddrivetip() {
                                if (ns6 || ie) {
                                    enabletip = false
                                    tipobj.style.visibility = "hidden"
                                    tipobj.style.left = "-1000px"
                                    tipobj.style.backgroundColor = ''
                                    tipobj.style.width = ''
                                }
                            }

                            document.onmousemove = positiontip;
                            document.onblur = function (ev) {

                            }
                        </script>

                        <script type="text/javascript">
                            // initialize plugins
                            $(function () {
                                var tm = setTimeout(function () {
                                    EduSoft.Web.UC.GioiThieu.GetHitCounter(function (ret) {
                                        if (ret?.value) {
                                            var st = "00000000" + ret.value;
                                            st = st?.substring(st.length - 9);
                                            var ltCount = document.getElementById("ltHitCounter");
                                            if (!ltCount) return;
                                            var tb = '<table cellSpacing="1" cellPadding="1" border="1" borderWidth="" borderColor="White" style="color:White;background-color:Black;border-color:White;"><TR>';
                                            for (i = 0; i < st.length; i++) {
                                                tb += '<TD align="middle">' + st.substring(i, i + 1) + '</TD>';
                                            }
                                            tb += '</TR></table>';
                                            ltCount.innerHTML = tb;
                                        }
                                    });
                                }, 1000);

                                try {
                                    $("ul.sf-menu").supersubs({
                                        minWidth: 13,
                                        maxWidth: 60,
                                        extraWidth: 5,
                                    }).superfish();
                                } catch (ex) {
                                }
                            });
                        </script>


                        <div class="navigate-base">
                            <table>


                                <tbody>
                                <tr>
                                    <td align="left">


                                        <script src="//ajax.aspnetcdn.com/ajax/jQuery/jquery-2.2.3.min.js"></script>
                                        <script src="//kjur.github.io/jsrsasign/jsrsasign-latest-all-min.js"></script>
                                        <script src="js/graph-js-sdk-web.js"></script>
                                        <script src="js/Login365_1.js"></script>

                                        <script language="javascript" type="text/javascript">
                                            function MessUpdate(obj) {
                                                alert(obj);
                                            }

                                            function ConfirmXemDiem(obj) {
                                                if (confirm(obj)) {
                                                    self.location = "default.aspx?page=xemdiemthi";
                                                }
                                            }

                                            function button_click(objTextBox, objBtnID) {
                                                if (window.event.keyCode == 13) {
                                                    document.getElementById(objBtnID).focus();
                                                    document.getElementById(objBtnID).click();
                                                }
                                            }
                                        </script>

                                        <script type="text/javascript">
                                            //<![CDATA[
                                            Sys.WebForms.PageRequestManager._initialize('ctl00$ContentPlaceHolder1$ctl00$ucDangNhap$ScriptManager1', document.getElementById('aspnetForm'));
                                            Sys.WebForms.PageRequestManager.getInstance()._updateControls([], [], [], 90);
                                            //]]>
                                        </script>


                                        <script src="js/Login365.js"></script>
                                        <script language="javascript" type="text/javascript">

                                            //Đăng ký sự kiện cho button Login365
                                            $('#btnLogin365').attr('href', buildAuthUrl());

                                        </script>

                                    </td>
                                </tr>

                                <tr valign="top">
                                    <td>
                                        <table>
                                            <tbody>
                                            <tr>
                                                <td style="display:none" width="0%">

                                                </td>
                                                <td style="display:none">
                                                    <div class="navigate-base">
                                                        <div class="title-base">
                                                            <div class="title">
                                                                <table>
                                                                    <tbody>
                                                                    <tr>
                                                                        <td width="10px">
                                                                            <img src="App_Themes/Standard/Images/icon_04b.gif">
                                                                        </td>
                                                                        <td>
                                                                            <span id="ctl00_ContentPlaceHolder1_ctl00_lblViTri0"
                                                                                  class="Label">GIỚI THIỆU CHUNG</span>
                                                                        </td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <br>


                                                        <table id="ctl00_ContentPlaceHolder1_ctl00_tbViTri0"
                                                               class="classTable" border="0" style="width:100%;">
                                                            <tbody>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>


                                                <td style="display:none">
                                                    <div class="navigate-base">
                                                        <div class="title-base">
                                                            <div class="title">
                                                                <table>
                                                                    <tbody>
                                                                    <tr>
                                                                        <td width="10px">
                                                                            <img src="App_Themes/Standard/Images/icon_04b.gif">
                                                                        </td>
                                                                        <td>
                                                                            <span id="ctl00_ContentPlaceHolder1_ctl00_lblViTri1"
                                                                                  class="Label">THÔNG TIN HỆ VỪA LÀM VỪA HỌC</span>
                                                                        </td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <br>
                                                        <table id="ctl00_ContentPlaceHolder1_ctl00_tbViTri1"
                                                               class="classTable" border="0" style="width:100%;">
                                                            <tbody>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <div id="ctl00_ContentPlaceHolder1_ctl00_pnlYahoo">

                                        </div>
                                        <div id="ctl00_ContentPlaceHolder1_ctl00_pnlWebLink">

                                        </div>
                                        <table width="100%">
                                            <tbody>
                                            <tr>
                                                <td width="14%" valign="top">
                                                    <table cellpadding="0" cellspacing="0">
                                                        <tbody>
                                                        <tr>
                                                            <td>
                                                                <div class="navigate-base">
                                                                    <table cellpadding="0" cellspacing="0">
                                                                        <tbody>
                                                                        <tr>
                                                                            <td align="left">

                                                                            </td>
                                                                        </tr>
                                                                        </tbody>
                                                                    </table>

                                                                    <div class="title-base">
                                                                        <div class="title">
                                                                            <table>

                                                                                <tbody>
                                                                                <tr>

                                                                                    <td width="10px">
                                                                                        <img src="App_Themes/Standard/Images/icon_04b.gif">
                                                                                    </td>
                                                                                    <td>
                                                                                        <span id="ctl00_ContentPlaceHolder1_ctl00_lblLeft"
                                                                                              class="Label">HỔ TRỢ ONLINE</span>
                                                                                    </td>

                                                                                </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </div>


                                                                </div>

                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>

                                                                <div id="ltHitCounter">
                                                                    <table cellspacing="1" cellpadding="1" border="1"
                                                                           borderwidth="" bordercolor="White"
                                                                           style="color:White;background-color:Black;border-color:White;">
                                                                        <tbody>
                                                                        <tr>
                                                                            <td align="middle">0</td>
                                                                            <td align="middle">2</td>
                                                                            <td align="middle">9</td>
                                                                            <td align="middle">7</td>
                                                                            <td align="middle">9</td>
                                                                            <td align="middle">4</td>
                                                                            <td align="middle">9</td>
                                                                            <td align="middle">3</td>
                                                                            <td align="middle">1</td>
                                                                        </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <span id="ctl00_ContentPlaceHolder1_ctl00_lblSumGust"
                                                                      class="Label">Số đang truy cập: 4839</span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <span id="ctl00_ContentPlaceHolder1_ctl00_lblSumInDay"
                                                                      class="Label"></span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <span id="ctl00_ContentPlaceHolder1_ctl00_lblSumLogon"
                                                                      class="Label">Số đã đăng nhập:110</span>/1600
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>

                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>

                                                            </td>
                                                        </tr>

                                                        </tbody>
                                                    </table>
                                                </td>


                                                <td width="1px">
                                                </td>
                                                <td width="70%" valign="top">
                                                    <div class="navigate-base">
                                                        <div class="title-base">
                                                            <div class="title">
                                                                <table>
                                                                    <tbody>
                                                                    <tr>
                                                                        <td width="10px">
                                                                            <img src="App_Themes/Standard/Images/icon_04b.gif">
                                                                        </td>
                                                                        <td>
                                                                            <span id="ctl00_ContentPlaceHolder1_ctl00_lblViTri2"
                                                                                  class="Label">THÔNG TIN CHUNG</span>
                                                                        </td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <br>
                                                        <table id="ctl00_ContentPlaceHolder1_ctl00_tbViTri2"
                                                               class="classTable" border="0" style="text-align: left">
                                                            <tbody>
                                                            <tr>
                                                                <td align="left" style="color:Blue;"><a
                                                                        class="TextTitle"
                                                                        href="default.aspx?page=chitietthongtin&amp;id=218"><span
                                                                        style="font-family: Times New Roman; font-size: 14pt;"><strong>Ngày 03/03/2023:&nbsp;&nbsp;&nbsp; THÔNG BÁO VỀ VIỆC TỔ CHỨC CÁC LỚP RIÊNG - KỲ 2 NĂM HỌC 2022-2023</strong></span></a><span
                                                                        class="NgayTitle"> (03/03/2023)</span></td>
                                                            </tr>
                                                            <tr>
                                                                <td><span class="TextThongTin"
                                                                          style="text-align:left"><p><span
                                                                        style="font-family: Times New Roman;"><span
                                                                        style="font-size: 14pt;">Phòng Giáo vụ thông báo tổ chức các lớp <strong>học lại, học cải thiện</strong> theo hình thức lớp riêng của học kỳ 2, năm học </span></span></p><p><span
                                                                        style="font-family: Times New Roman;"><span
                                                                        style="font-size: 14pt;">2022-2023 đối với sinh viên các lớp Đại học chính quy, chi tiết sinh viên xem tại:</span></span></p><p><span
                                                                        style="font-family: Times New Roman;"><span
                                                                        style="font-size: 14pt;"><a
                                                                        href="https://portal.ptit.edu.vn/giaovu/thong-bao-vv-to-chuc-cac-lop-hoc-lai-hoc-cai-thien-diem-theo-lop-rieng-hoc-ky-2-nam-hoc-2022-2023-cho-sinh-vien-cac-lop-dai-hoc-chinh-quy/">https://portal.ptit.edu.vn/giaovu/thong-bao-vv-to-chuc-cac-lop-hoc-lai-hoc-cai-thien-diem-theo-lop-rieng-hoc-ky-2-nam-hoc-2022-2023-cho-sinh-vien-cac-lop-dai-hoc-chinh-quy/</a></span></span></p><p><span
                                                                        style="font-family: Times New Roman;"><span
                                                                        style="font-size: 14pt;"><span>Mọi vấn đề cần giải đáp liên hệ số điện thoại 08.8978.3202 (8h30-11h, 14h-16h30, thứ 2 đến thứ 6)</span></span></span></p><p><span
                                                                        style="font-family: Times New Roman;"><span
                                                                        style="font-size: 14pt;"><span>Trân trọng./.</span><br></span></span></p></span>
                                                                    <div style="text-align:right">
                                                                        <div class="ChiTiet"><img
                                                                                src="App_Themes/Standard/Images/arrow_r.gif"
                                                                                alt=""> <a class="TextThongTin"
                                                                                           href="default.aspx?page=chitietthongtin&amp;id=218">Xem
                                                                            Chi Tiết</a></div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left">
                                                                    <table width="300px" style="text-align:left">
                                                                        <tbody>
                                                                        <tr>
                                                                            <td rowspan="2" width="15px"><img
                                                                                    src="App_Themes/Standard/Images/images.jpg"
                                                                                    width="15px" alt=""></td>
                                                                            <td align="left" width="280px">Bản tin cũ
                                                                            </td>
                                                                            <td align="left"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2" class="kecham"></td>
                                                                        </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left"><img
                                                                        src="App_Themes/Standard/Images/Bull9.gif"
                                                                        alt=""><a class="TextTitle"
                                                                                  href="default.aspx?page=chitietthongtin&amp;id=216"><strong><span
                                                                        style="font-family: Times New Roman; font-size: 14pt;">NỘI DUNG:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ĐĂNG KÝ LỊCH HỌC KỲ 2 NĂM HỌC 2022 - 2023</span></strong><br><img
                                                                        style=" border:0" src="./Images/new.gif"
                                                                        width="30px" height="30px"
                                                                        alt="Tin tức mới cập nhật">... (<span
                                                                        class="NgayTitle">05/12/2022</span>)</a></td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left"><img
                                                                        src="App_Themes/Standard/Images/Bull9.gif"
                                                                        alt=""><a class="TextTitle"
                                                                                  href="default.aspx?page=chitietthongtin&amp;id=217">
                                                                    <div align="center"><span
                                                                            style="font-family: Times New Roman; font-size: 14pt;"><strong>THÔNG BÁO VỀ VIỆC TẠM DỪNG HOẠT ĐỘNG ĐỂ BẢO TRÌ, NÂNG CẤP HỆ THỐNG QLDT<br></strong></span>
                                                                    </div>
                                                                    ... (<span class="NgayTitle">14/02/2023</span>)</a>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left"><img
                                                                        src="App_Themes/Standard/Images/Bull9.gif"
                                                                        alt=""><a class="TextTitle"
                                                                                  href="default.aspx?page=chitietthongtin&amp;id=215"><strong><span
                                                                        style="font-family: Times New Roman; font-size: 14pt;">Ngày 17/10/2022:&nbsp; THÔNG BÁO V/V ĐĂNG KÝ LỊCH HỌC-CÁC LỚP RIÊNG KỲ 1 NĂM HỌC 2022-2023</span></strong><br>...
                                                                    (<span class="NgayTitle">17/10/2022</span>)</a></td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left"><img
                                                                        src="App_Themes/Standard/Images/Bull9.gif"
                                                                        alt=""><a class="TextTitle"
                                                                                  href="default.aspx?page=chitietthongtin&amp;id=214"><span
                                                                        style="font-size: 12pt;">Thông báo: V/v Mở hệ thống cho sinh viên đăng ký thi chuẩn đầu ra tiếng anh đợt 3 năm 2022<br></span>...
                                                                    (<span class="NgayTitle">13/10/2022</span>)</a></td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left"><img
                                                                        src="App_Themes/Standard/Images/Bull9.gif"
                                                                        alt=""><a class="TextTitle"
                                                                                  href="default.aspx?page=chitietthongtin&amp;id=213"><span
                                                                        style="font-size: 14pt;"><span
                                                                        style="letter-spacing: -0.2pt; font-size: 12pt;">Thông báo V/v: Đăng ký lại chuyên ngành đào tạo các lớp khóa D19 ngành Kỹ thuật điện tử
viễn thông</span></span>... (<span class="NgayTitle">04/10/2022</span>)</a></td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left"><img
                                                                        src="App_Themes/Standard/Images/Bull9.gif"
                                                                        alt=""><a class="TextTitle"
                                                                                  href="default.aspx?page=chitietthongtin&amp;id=212"><span
                                                                        style="font-size: 12pt;">Thông báo: V/v Rà soát kết quả đăng ký thực hiện khối kiên thức tốt nghiệp khóa 2018 ngành kỹ thuật</span>...
                                                                    (<span class="NgayTitle">16/09/2022</span>)</a></td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left"><img
                                                                        src="App_Themes/Standard/Images/Bull9.gif"
                                                                        alt=""><a class="TextTitle"
                                                                                  href="default.aspx?page=chitietthongtin&amp;id=211">...
                                                                    (<span class="NgayTitle">16/09/2022</span>)</a></td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left"><img
                                                                        src="App_Themes/Standard/Images/Bull9.gif"
                                                                        alt=""><a class="TextTitle"
                                                                                  href="default.aspx?page=chitietthongtin&amp;id=210"><span
                                                                        style="font-size: 12pt;">Thông báo: V/v Điều chỉnh lịch đăng ký thực hiện khối kiến thức tốt nghiệp khóa 2018 kỹ thuật</span><span
                                                                        style="font-size: 12pt;"><br></span>... (<span
                                                                        class="NgayTitle">09/09/2022</span>)</a></td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left"><img
                                                                        src="App_Themes/Standard/Images/Bull9.gif"
                                                                        alt=""><a class="TextTitle"
                                                                                  href="default.aspx?page=chitietthongtin&amp;id=208"><span
                                                                        style="font-size: 14pt;">Thông báo:V/v Cập nhật điểm học kỳ 2 và học kỳ phụ (hè) năm học 2021-2022<br></span><span
                                                                        style="font-size: 14pt;"><br></span>... (<span
                                                                        class="NgayTitle">15/08/2022</span>)</a></td>
                                                            </tr>
                                                            <tr>

                                                            </tr>
                                                            <tr>
                                                                <td align="right"><span class="tatcabantin"><a
                                                                        href="default.aspx?page=danhsachthongtin&amp;type=0">Xem tất cả</a></span>
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </td>
                                                <td width="1px">
                                                </td>
                                                <td style="display:none">
                                                    <div class="navigate-base">
                                                        <div class="title-base">
                                                            <div class="title">
                                                                <table>
                                                                    <tbody>
                                                                    <tr>
                                                                        <td width="10px">
                                                                            <img src="App_Themes/Standard/Images/icon_04b.gif">
                                                                        </td>
                                                                        <td valign="top">
                                                                            <span id="ctl00_ContentPlaceHolder1_ctl00_lblViTri3"
                                                                                  class="Label">TIN TỨC &amp; SỰ KIỆN</span>
                                                                        </td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <br>
                                                        <table id="ctl00_ContentPlaceHolder1_ctl00_tbViTri3"
                                                               class="classTable" border="0">
                                                            <tbody>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </td>

                                                <td width="1px">
                                                </td>
                                                <td width="14%" valign="top">
                                                    <div class="navigate-base">
                                                        <div class="title-base">
                                                            <div class="title">
                                                                <table>
                                                                    <tbody>
                                                                    <tr>
                                                                        <td width="10px">
                                                                            <img src="App_Themes/Standard/Images/icon_04b.gif">
                                                                        </td>
                                                                        <td valign="top">
                                                                            LIÊN KẾT
                                                                        </td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <table border="1">
                                                            <tbody>
                                                            <tr>
                                                                <td align="center"><a href="http://www.ptit.edu.vn"><img
                                                                        src="Images/MessageFile/242794Logo2.gif"
                                                                        style="width: 130px"></a><br><a
                                                                        href="http://www.ptit.edu.vn" runat="server"
                                                                        id="1">Học viện Công nghệ Bưu chính viễn
                                                                    thông</a></td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center"><a
                                                                        href="https://portal.ptit.edu.vn/giaovu/"
                                                                        runat="server" id="5">Trang tin phòng Giáo
                                                                    vụ</a></td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </td>


                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <table width="100%">
                                            <tbody>
                                            <tr>
                                                <td width="2px">
                                                </td>
                                                <td style="display:none">
                                                    <div class="navigate-base">
                                                        <div class="title-base">
                                                            <div class="title">
                                                                <table>
                                                                    <tbody>
                                                                    <tr>
                                                                        <td width="10px">
                                                                            <img src="App_Themes/Standard/Images/icon_04b.gif">
                                                                        </td>
                                                                        <td>
                                                                            <span id="ctl00_ContentPlaceHolder1_ctl00_lblViTri4"
                                                                                  class="Label"> THONG BAO KHAC 1</span>
                                                                        </td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <br>
                                                        <table id="ctl00_ContentPlaceHolder1_ctl00_tbViTri4"
                                                               class="classTable" border="0" style="width:100%;">
                                                            <tbody>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </td>

                                                <td width="1px">
                                                </td>
                                                <td style="display:none">
                                                    <div class="navigate-base">
                                                        <div class="title-base">
                                                            <div class="title">
                                                                <table>
                                                                    <tbody>
                                                                    <tr>
                                                                        <td width="10px">
                                                                            <img src="App_Themes/Standard/Images/icon_04b.gif">
                                                                        </td>
                                                                        <td>
                                                                            <span id="ctl00_ContentPlaceHolder1_ctl00_lblViTri5"
                                                                                  class="Label">THONG BAO KHAC 2</span>
                                                                        </td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <br>
                                                        <table id="ctl00_ContentPlaceHolder1_ctl00_tbViTri5"
                                                               class="classTable" border="0" style="width:100%;">
                                                            <tbody>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>


                                </tbody>
                            </table>
                        </div>

                        <div id="ctl00_ContentPlaceHolder1_ctl00_pnlZalo">

                            <div class="zalo-chat-widget" data-oaid="" data-welcome-message="" data-autopopup="0"
                                 data-width="300" data-height="300">
                            </div>


                        </div>


                    </td>
                </tr>
                <tr>
                    <td>


                        <style type="text/css">

                            .style3 {
                                width: 70px;
                            }

                            .style4 {
                                width: 129px;
                            }

                            .style5 {
                                width: 1019px;
                            }

                        </style>

                        <div class="footer">
                            <table width="100%">
                                <tbody>
                                <tr>
                                    <td align="left" class="style5">
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
                                        <a href="https://aqtech.vn/" target="_blank"><span
                                                id="ctl00_Footer1_lblCopyRight" class="Label">Thiết kế bởi cty Phần mềm Anh Quân</span></a>


                                    </td>
                                    <td align="right" valign="top" class="style4">
                                        <img src="App_Themes/Standard/Images/topTen.gif" width="15px" alt="">
                                    </td>
                                    <td class="style3">
                                        <a href="#Top" title="Go to top"
                                           style="text-decoration: none; font-family:Tahoma;font-size:8pt">
                                            <span id="ctl00_Footer1_lbltop" class="Label">Đầu Trang</span>
                                        </a>
                                    </td>
                                    <td align="right"><a href="Default.aspx?page=thongtinsp"><span
                                            id="ctl00_Footer1_lblAbout" class="Label">About</span></a></td>
                                </tr>

                                </tbody>
                            </table>
                        </div>

                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>


    <script type="text/javascript">
        //<![CDATA[
        var ctl00_ContentPlaceHolder1_ctl00_leftMenu_Data = new Object();
        ctl00_ContentPlaceHolder1_ctl00_leftMenu_Data.disappearAfter = 500;
        ctl00_ContentPlaceHolder1_ctl00_leftMenu_Data.horizontalOffset = 0;
        ctl00_ContentPlaceHolder1_ctl00_leftMenu_Data.verticalOffset = 0;
        ctl00_ContentPlaceHolder1_ctl00_leftMenu_Data.iframeUrl = '/WebResource.axd?d=AFcMb559RRMZCWV5i_gfx-07hGIFCmOTXJ53sNVWzrTM9VmWFn6zZLSkVRfXHqHoH-0cHJgTewf2_fW0tF1_2y7QlJ41&t=636041026940000000';
        Sys.Application.add_init(function () {
            $create(AjaxControlToolkit.ModalPopupBehavior, {
                "BackgroundCssClass": "msgbox_messagemodalbackground",
                "CancelControlID": "ctl00_ContentPlaceHolder1_ctl00_MessageBox1_imgCloseButton",
                "OkControlID": "ctl00_ContentPlaceHolder1_ctl00_MessageBox1_btnOk",
                "PopupControlID": "ctl00_ContentPlaceHolder1_ctl00_MessageBox1_panelMessageBox",
                "dynamicServicePath": "/Default.aspx",
                "id": "ctl00_ContentPlaceHolder1_ctl00_MessageBox1_ajaxModal"
            }, null, null, $get("ctl00_ContentPlaceHolder1_ctl00_MessageBox1_lbTarget"));
        });
        Sys.Application.initialize();
        //]]>
    </script>
</form>
<div id="app" class="zs"></div>


<img src="arrowdown.gif" id="arrowhead"></body>
</html>
