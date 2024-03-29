<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>받은 쪽지함</title>
    <!-- Bootstrap CSS -->
<%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">--%>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"--%>
<%--          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="--%>
<%--          crossorigin="anonymous" referrerpolicy="no-referrer"/>--%>

    <link rel="stylesheet" href="/css/job-css/linearicons.css">
    <link rel="stylesheet" href="/css/job-css/bootstrap.css">
    <link rel="stylesheet" href="/css/job-css/magnific-popup.css">
    <link rel="stylesheet" href="/css/job-css/nice-select.css">
    <link rel="stylesheet" href="/css/job-css/animate.min.css">
    <link rel="stylesheet" href="/css/job-css/owl.carousel.css">
    <link rel="stylesheet" href="/css/job-css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />


    <style>
        .nav-link{
            color: #222222;
        }

        .nav-item>.active{
            background-color:#b4a4fc;
        }

    </style>
</head>
<body>
<my:font />
<my:job-header-nav />
<my:job-inner-banner>
    받은 쪽지함
</my:job-inner-banner>

<sec:authentication property="name" var="userId" />
<br>
<c:if test="${not empty message }">
    <div class="container">
        <div class="alert alert-success" role="alert">
                ${message}
            <button type="button" class="btn-close" aria-label="Close"><i class="fa-solid fa-xmark"></i></button>
        </div>
    </div>

</c:if>
    <div class="container">
        <ul class="nav">
            <li class="nav-item">
                <a class="nav-link active" href="/note/list/receive" >받은 쪽지함</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/note/list/send" >보낸 쪽지함</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/note/list/unread" >안읽은 쪽지함</a>
            </li>
            <li class="nav-item ml-auto"> <!-- 오른쪽 정렬 -->
                <button class="btn btn-outline-primary" onclick="openNoteWindow('/note/write?senderId=${userId}')">쪽지쓰기</button>
            </li>

        </ul>
    <table class="table" style="">
        <thead>
        <tr>
            <th>보낸 사람</th>
            <th>제목</th>
            <th>받은 시간</th>
            <th>삭제</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${noteList}" var="note" varStatus="status">

            <tr>
                <td>${note.senderId}</td>
                <td>
                    <c:url value="/note/detail" var="noteDetailURL">
                        <c:param name="noteId" value="${note.noteId}"/>
                        <c:param name="distinction" value="receive"/>
                    </c:url>
                    <c:choose>
                        <c:when test="${note.status}">
                            <a href="#" onclick="openNoteWindow('${noteDetailURL}')" style="color: #222222" >
                                    ${note.title}
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="#" onclick="openNoteWindow('${noteDetailURL}')" style="color: #222222; font-weight: bold">
                                    ${note.title}
                            </a>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>${fn:replace(note.created, 'T', ' ')}</td>
                <td>
                    <button class="btn btn-outline-danger"
                            name="deleteButton"
                            data-bs-toggle="modal"
                            data-bs-target="#deleteNoteConfirmModal"
                            data-note-id="${note.noteId}"
                    >삭제
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>



<%--페이지네이션--%>
<nav aria-label="...">
    <ul class="pagination justify-content-center">


        <c:if test="${pageInfo.begin != 1}">

            <%--맨앞으로--%>
            <c:url value="/note/list/receive" var="pageLink">
                <c:param name="page" value="1"></c:param>
            </c:url>
            <li class="page-item">
                <a class="page-link" href="${pageLink}"><i class="fa-solid fa-angles-left"></i></a>
            </li>

            <%-- 앞으로 --%>
            <c:url value="/note/list/receive" var="pageLink">
                <c:param name="page" value="${pageInfo.previous }"></c:param>
            </c:url>
            <li class="page-item">
                <a class="page-link" href="${pageLink}"><i class="fa-solid fa-angle-left"></i></a>
            </li>

        </c:if>

        <c:forEach begin="${pageInfo.begin}" end="${pageInfo.end}" var="pageNumber">
            <c:url value="/note/list/receive" var="pageLink">
                <c:param name="page" value="${pageNumber }"></c:param>
            </c:url>
            <c:choose>
                <c:when test="${param.page == null}">
                    <c:set var="page" value="1" />
                </c:when>
                <c:otherwise>
                    <c:set var="page" value="${param.page}" />
                </c:otherwise>
            </c:choose>
            <li class="page-item ${page eq pageNumber ? 'active' : ''}">
                <a class="page-link" href="${pageLink}">${pageNumber}</a>
            </li>
        </c:forEach>


        <c:if test="${pageInfo.end != pageInfo.last}">

            <%-- 뒤로--%>
            <c:url value="/note/list/receive" var="pageLink">
                <c:param name="page" value="${pageInfo.next }"></c:param>
            </c:url>
            <li class="page-item">
                <a class="page-link" href="${pageLink}"><i class="fa-solid fa-angle-right"></i></a>
            </li>

            <%--맨 뒤로--%>
            <c:url value="/note/list/receive" var="pageLink">
                <c:param name="page" value="${pageInfo.last }"></c:param>
            </c:url>
            <li class="page-item">
                <a class="page-link" href="${pageLink}"><i class="fa-solid fa-angles-right"></i></a>
            </li>

        </c:if>
    </ul>
</nav>

<%--삭제 모달--%>
<div class="d-none">
    <form action="/note/delete" method="post"
          id="deleteNoteForm">
        <input type="text" id="deleteNoteById" name="noteId" value=""/>
        <input type="hidden" name="distinction" value="receive">
    </form>
</div>

<div class="modal fade" id="deleteNoteConfirmModal" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title fs-5" id="exampleModalLabel">삭제 확인</h3>
                <button type="button" class="btn-outline-close"
                        data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">삭제하시겠습니까?</div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-outline-danger"
                        form="deleteNoteForm">삭제
                </button>
                <button type="button" class="btn btn-outline-secondary"
                        data-bs-dismiss="modal">닫기
                </button>
            </div>
        </div>
    </div>
</div>

<my:job-footer />

<!-- Bootstrap JS -->
<%--<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.min.js"--%>
<%--        integrity="sha512-3dZ9wIrMMij8rOH7X3kLfXAzwtcHpuYpEgQg1OA4QAob1e81H8ntUQmQm3pBudqIoySO5j0tHN4ENzA6+n2r4w=="--%>
<%--        crossorigin="anonymous" referrerpolicy="no-referrer"></script>--%>

<script src="/job-js/vendor/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
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


<script src="/js/note/list.js"></script>

</body>
</html>

