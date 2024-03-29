<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ page import="java.util.*" %>

<html>
<head>

    <%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"--%>
    <%--          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">--%>
    <%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"--%>
    <%--          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="--%>
    <%--          crossorigin="anonymous" referrerpolicy="no-referrer"/>--%>
    <%--    <my:font></my:font>--%>

    <link rel="stylesheet" href="/css/job-css/linearicons.css">
    <link rel="stylesheet" href="/css/job-css/bootstrap.css">
    <link rel="stylesheet" href="/css/job-css/magnific-popup.css">
    <link rel="stylesheet" href="/css/job-css/nice-select.css">
    <link rel="stylesheet" href="/css/job-css/animate.min.css">
    <link rel="stylesheet" href="/css/job-css/owl.carousel.css">
    <link rel="stylesheet" href="/css/job-css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <title>참여기업상세</title>

</head>
<body>
<my:font/>
<my:job-header-nav/>

<my:job-inner-banner>
    참여기업 신청 상세
</my:job-inner-banner>


<div class="container-lg mt-3">
    <!-- .row.justify-content-center>.col-12.col-md-8.col-lg-6 -->
    <div class="row justify-content-center">
        <div class="col-12 col-md-8 col-lg-6">
            <div class="me-auto">
                <h1>
                    <span id="company-name"></span> 신청 내역
                    <input type="hidden" id="bucketUrl" value="${bucketUrl}"/>
                </h1>
            </div>

            <div class="mb-3 mt-3">
                <label for="round" class="form-label">회차</label>
                <input id="round" type="text" style="background-color: white" class="form-control" readonly/>
            </div>

            <div class="mb-3">
                <label for="member-id" class="form-label">담당자</label>
                <input id="member-id" type="text" style="background-color: white" class="form-control" readonly/>
            </div>

            <div class="mb-3">
                <label for="registration-number" class="form-label">사업자등록번호</label>
                <input id="registration-number" type="text" style="background-color: white" class="form-control"
                       readonly/>
            </div>

            <div class="mb-3">
                <label for="number-of-employees" class="form-label">사원수</label>
                <input id="number-of-employees" type="text" style="background-color: white" class="form-control"
                       readonly/>
            </div>

            <div class="mb-3">
                <label for="establishment-date" class="form-label">설립일</label>
                <input id="establishment-date" type="text" style="background-color: white" class="form-control"
                       readonly/>
            </div>

            <div class="mb-3">
                <label for="revenue" class="form-label">매출액</label>
                <input id="revenue" type="text" style="background-color: white" class="form-control" readonly/>
            </div>

            <div class="mb-3">
                <label for="address" class="form-label">주소</label>
                <input id="postalCode" type="text" style="background-color: white" class="form-control"
                       placeholder="우편번호" readonly/>
                <input id="address" type="text" style="background-color: white" class="form-control" placeholder="주소"
                       readonly/>
                <input id="detail-address" type="text" style="background-color: white" class="form-control"
                       placeholder="상세주소" readonly/>
            </div>

            <div class="mb-3">
                <label for="ceo-name" class="form-label">대표</label>
                <input id="ceo-name" type="text" style="background-color: white" class="form-control" readonly/>
            </div>

            <div class="mb-3">
                <label for="industry-name" class="form-label">업종</label>
                <input id="industry-name" type="text" style="background-color: white" class="form-control" readonly/>
                <input id="industry-id" type="hidden" class="form-control" readonly/>
            </div>

            <div class="mb-3">
                <label for="status" class="form-label">상태</label>
                <input id="status" type="text" style="background-color: white" class="form-control" readonly/>
            </div>

            <div id="file-name" class="mb-3">
                <label class="form-label">첨부파일</label>
            </div>

            <div>
                <div>
                    <button id="hold-btn" type="button" class="btn btn-warning" style="color: white">보류</button>
                    <button id="reject-btn" type="button" class="btn btn-danger">반려</button>
                    <button id="approve-btn" type="button" class="btn btn-success">승인</button>
                    <a class="btn btn-secondary" href="/admin/join/list">목록으로 가기</a>
                </div>
            </div>
        </div>
    </div>
</div>

<my:job-footer/>

<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"--%>
<%--        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"--%>
<%--        crossorigin="anonymous"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"--%>
<%--        integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="--%>
<%--        crossorigin="anonymous" referrerpolicy="no-referrer"></script>--%>

<script src="/job-js/vendor/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="/job-js/vendor/bootstrap.min.js"></script>
<script src="/job-js/easing.min.js"></script>
<script src="/job-js/hoverIntent.js"></script>
<script src="/job-js/superfish.min.js"></script>
<script src="/job-js/jquery.ajaxchimp.min.js"></script>
<script src="/job-js/jquery.magnific-popup.min.js"></script>
<script src="/job-js/owl.carousel.min.js"></script>
<script src="/job-js/jquery.sticky.js"></script>
<script src="/job-js/jquery.nice-select.min.js"></script>
<script src="/job-js/parallax.min.js"></script>
<script src="/job-js/mail-script.js"></script>
<script src="/job-js/main.js"></script>

<script src="/js/admin/join/detail.js"></script>
</body>
</html>