<%--
  Created by IntelliJ IDEA.
  User: KJJ
  Date: 2023-07-14
  Time: 오후 6:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
    <title>이력서 수정</title>

<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">--%>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />--%>

    <link rel="stylesheet" href="/css/resume/resume.css">

    <link rel="stylesheet" href="/css/job-css/linearicons.css">
    <link rel="stylesheet" href="/css/job-css/bootstrap.css">
    <link rel="stylesheet" href="/css/job-css/magnific-popup.css">
    <link rel="stylesheet" href="/css/job-css/nice-select.css">
    <link rel="stylesheet" href="/css/job-css/animate.min.css">
    <link rel="stylesheet" href="/css/job-css/owl.carousel.css">
    <link rel="stylesheet" href="/css/job-css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
<my:font />
<my:job-header-nav />
<my:job-inner-banner>
    이력서 수정
</my:job-inner-banner>

  <div class="container col-lg-5 pt-50">

      <div class="text-right">
          <a href="/resume/" class="genric-btn default">뒤로가기</a>
      </div>

      <!-- 이력서 제목 입력칸 -->
      <div class="form-group mb-3">
          <h4 class="mb-10">이력서 제목</h4>
          <input type="text" class="form-control" id="resumeTitle" value="${resumeUpdateData.title}" placeholder="이력서 제목을 입력해주세요">
      </div>

      <input type="hidden" id="resumeId" value="${resumeUpdateData.resumeId}">


      <!-- 경력 입력 그룹 -->
      <div class="form-group mb-3">
          <h4 class="mb-10">경력</h4>
          <div id="careerContainer" class="inputContainer">
              <c:forEach var="career" items="${resumeUpdateData.careers}" varStatus="status">
                  <div class="careerGroup inputDetailGroup">
                      <button class="deleteButton"><i class="fa-solid fa-xmark"></i></button>
                      <input type="hidden" class="form-control careerId" id="careerId${status.index + 1}" value="${career.careerId}">
                      <div class="row">
                          <div class="col">
                              <label for="companyName${status.index + 1}">회사명</label>
                              <input type="text" class="form-control companyName" id="companyName${status.index + 1}" value="${career.companyName}">
                          </div>
                          <div class="col">
                              <label for="startDate${status.index + 1}">입사일</label>
                              <input type="text" class="form-control entryDate" id="startDate${status.index + 1}" value="${career.entryDate}">
                          </div>
                          <div class="col">
                              <label for="resignationDate${status.index + 1}">퇴사일</label>
                              <input type="text" class="form-control resignationDate" id="resignationDate${status.index + 1}" value="${career.resignationDate}">
                          </div>
                      </div>
                      <div class="row mt-3">
                          <div class="col">
                              <label for="position${status.index + 1}">직위</label>
                              <input type="text" class="form-control position" id="position${status.index + 1}" value="${career.position}">
                          </div>
                          <div class="col">
                              <label for="task${status.index + 1}">담당업무</label>
                              <input type="text" class="form-control task" id="task${status.index + 1}" value="${career.task}">
                          </div>
                      </div>
                      <label for="description${status.index + 1}">기타설명</label>
                      <input type="text" class="form-control description" id="description${status.index + 1}" value="${career.description}">
                  </div>
              </c:forEach>
          </div>
<%--          <div class="addBtnDiv">--%>
<%--              <button type="button" class="btn btn-dark mt-3" id="addCareerButton">경력 추가</button>--%>
<%--          </div>--%>
      </div>

      <!-- 학력 입력 그룹 -->
      <div class="form-group mb-3">
          <h4 class="mb-10">학력</h4>
          <div id="educationContainer" class="inputContainer">
              <c:forEach var="education" items="${resumeUpdateData.educations}" varStatus="status">
                  <div class="educationGroup inputDetailGroup">
                      <button class="deleteButton"><i class="fa-solid fa-xmark"></i></button>
                      <input type="hidden" class="form-control educationId" id="education${status.index + 1}" value="${education.educationId}">
                      <div class="row">
                          <div class="col">
                              <label for="educationType${status.index + 1}">최종학력</label>
                              <select class="form-control educationType" id="educationType${status.index + 1}">
                                  <option selected disabled></option>
                                  <option ${education.educationType eq '고졸' ? 'selected' : ''}>고졸</option>
                                  <option ${education.educationType eq '전문대졸' ? 'selected' : ''}>전문대졸</option>
                                  <option ${education.educationType eq '대졸' ? 'selected' : ''}>대졸</option>
                                  <option ${education.educationType eq '대학원졸(석사)' ? 'selected' : ''}>대학원졸(석사)</option>
                                  <option ${education.educationType eq '대학원졸(박사)' ? 'selected' : ''}>대학원졸(박사)</option>
                              </select>
                          </div>
                          <div class="col">
                              <label for="schoolName${status.index + 1}">학교명</label>
                              <input type="text" class="form-control schoolName" id="schoolName${status.index + 1}" value="${education.schoolName}">
                          </div>
                          <div class="col">
                              <label for="enterDate${status.index + 1}">입학일</label>
                              <input type="text" class="form-control enterDate" id="enterDate${status.index + 1}" value="${education.entryDate}">
                          </div>
                          <div class="col">
                              <label for="gradDate${status.index + 1}">졸업일</label>
                              <input type="text" class="form-control gradDate" id="gradDate${status.index + 1}" value="${education.graduationDate}">
                          </div>
                      </div>
                      <div class="row mt-3">
                          <div class="col">
                              <label for="major${status.index + 1}">학과</label>
                              <input type="text" class="form-control major" id="major${status.index + 1}" value="${education.major}">
                          </div>
                          <div class="col">
                              <label for="gradStatus${status.index + 1}">졸업상태</label>
                              <select class="form-control form-selected gradStatus" id="gradStatus${status.index + 1}">
                                  <option selected disabled></option>
                                  <option ${education.status eq '졸업' ? 'selected' : ''}>졸업</option>
                                  <option ${education.status eq '휴학' ? 'selected' : ''}>휴학</option>
                                  <option ${education.status eq '재학' ? 'selected' : ''}>재학</option>
                                  <option ${education.status eq '중퇴' ? 'selected' : ''}>중퇴</option>
                              </select>
                          </div>
                      </div>
                  </div>
              </c:forEach>
          </div>
<%--          <div class="addBtnDiv">--%>
<%--              <button type="button" class="btn btn-dark mt-2" id="addEducation">학력 추가</button>--%>
<%--          </div>--%>
      </div>

      <!-- 자격증 입력 그룹 -->
      <div class="form-group mb-3">
          <h4 class="mb-10">자격증</h4>
          <div id="certificationContainer" class="inputContainer">
              <c:forEach var="certification" items="${resumeUpdateData.certifications}" varStatus="status">
                  <div class="certificationGroup inputDetailGroup">
                      <button class="deleteButton"><i class="fa-solid fa-xmark"></i></button>
                      <input type="hidden" class="form-control certificationId" id="certification${status.index + 1}" value="${certification.certificationId}">
                      <div class="row">
                          <div class="col">
                              <label for="certificationName${status.index + 1}">종류</label>
                              <input type="text" class="form-control certificationName" id="certificationName${status.index + 1}" value="${certification.certificationName}">
                          </div>
                          <div class="col">
                              <label for="getDate${status.index + 1}">취득일</label>
                              <input type="text" class="form-control getDate" id="getDate${status.index + 1}" value="${certification.getDate}">
                          </div>
                          <div class="col">
                              <label for="organization${status.index + 1}">발급기관</label>
                              <input type="text" class="form-control organization" id="organization${status.index + 1}" value="${certification.organization}">
                          </div>
                      </div>
                  </div>
              </c:forEach>
          </div>
<%--          <div class="addBtnDiv">--%>
<%--              <button type="button" class="btn btn-dark" id="addCertification">자격증 추가</button>--%>
<%--          </div>--%>
      </div>

      <!-- 희망근무조건 입력 그룹 -->
      <h4 class="mb-10">희망근무조건</h4>
      <div id="desiredConditionContainer" class="inputContainer">
          <div class="form-group mb-3 desiredConditionGroup inputDetailGroup">
              <input type="hidden" class="form-control workConditionId" id="workConditionId" value="${resumeUpdateData.workCondition.workConditionId}">
              <div id="workAreaContainer">
                  <label>근무지역</label>
                  <c:forEach var="workArea" items="${resumeUpdateData.workAreas}" varStatus="status">
                      <input type="hidden" class="form-control workAreaId" id="workArea${status.index + 1}" value="${workArea.workAreaId}">
                      <input type="text" class="form-control desiredLocation" id="desiredLocation${status.index + 1}" value="${workArea.hopedWorkArea}">
                  </c:forEach>
              </div>
<%--              <button type="button" class="btn btn-dark mt-2 addBtnDiv" id="addWorkArea">근무지역 추가</button>--%>
              <label for="desiredSalary">연봉</label>
              <input type="text" class="form-control desiredSalary" id="desiredSalary" value="${resumeUpdateData.workCondition.salary}">
              <label for="employmentType">고용형태</label>
              <select class="form-control" id="employmentType" value="${resumeUpdateData.workCondition.employmentType}">
                  <option selected disabled></option>
                  <option ${resumeUpdateData.workCondition.employmentType == '정규직' ? 'selected' : ''}>정규직</option>
                  <option ${resumeUpdateData.workCondition.employmentType == '계약직' ? 'selected' : ''}>계약직</option>
              </select>
          </div>
      </div>


      <!-- 병역여부 그룹 -->
      <div class="form-group mb-3">
          <h4 class="mb-10">병역여부</h4>
          <div class="inputContainer">
              <div class="inputDetailGroup">
                  <div class="form-check">
                      <input class="form-check-input" type="radio" name="militaryService" id="unfulfilled" value="미필" ${resumeUpdateData.military == '미필' ? 'checked' : ''}>
                      <label class="form-check-label" for="unfulfilled">미필</label>
                  </div>
                  <div class="form-check">
                      <input class="form-check-input" type="radio" name="militaryService" id="fulfilled" value="fulfilled" ${resumeUpdateData.military == 'fulfilled' ? 'checked' : ''}>
                      <label class="form-check-label" for="fulfilled">군필</label>
                  </div>
                  <div class="form-check">
                      <input class="form-check-input" type="radio" name="militaryService" id="notApplicable" value="해당사항없음" ${resumeUpdateData.military == '해당사항없음' ? 'checked' : ''}>
                      <label class="form-check-label" for="notApplicable">해당사항없음</label>
                  </div>
                  <select class="form-select militaryRank" id="militaryRank" ${resumeUpdateData.military == 'fulfilled' ? '' : 'style="display: none;"'}>
                      <option selected disabled>병급 선택</option>
                      <option ${resumeUpdateData.military == '이병' ? 'selected' : ''}>이병</option>
                      <option ${resumeUpdateData.military == '일병' ? 'selected' : ''}>일병</option>
                      <option ${resumeUpdateData.military == '상병' ? 'selected' : ''}>상병</option>
                      <option ${resumeUpdateData.military == '병장' ? 'selected' : ''}>병장</option>
                  </select>
              </div>
          </div>
      </div>

      <!-- 자기소개 입력칸 -->
      <div class="form-group mb-3">
          <h4 class="mb-10">자기소개</h4>
          <textarea class="form-control" id="selfIntroduction" rows="3">${resumeUpdateData.intro}</textarea>
      </div>

      <!-- 희망업종 선택칸 -->
      <div class="form-group mb-3">
          <h4 class="mb-10">희망업종</h4>
          <select class="form-select" id="desiredIndustry">
              <c:forEach var="industry" items="${industry}" >
                  <option value="${industry.industryId}" ${industry.industryId == resumeUpdateData.industryId ? 'selected' : ''}>${industry.industryName}</option>
              </c:forEach>
          </select>
      </div>

      <button type="submit" class="btn btn-success" id="updateResumeBtn">수정하기</button>
  </div>

<my:job-footer />

<%--  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>--%>
<%--  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>--%>

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

  <script src="/js/resume/update.js"></script>
</body>
</html>
