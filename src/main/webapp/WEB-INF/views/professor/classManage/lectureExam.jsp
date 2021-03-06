<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../common/classManageLectureSideCategory.jsp"%>

<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #666666; margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">시험조회</h4>
		</div>
		<div class="panel-body">
			<table class="table table-hover">
				<c:choose>
					<c:when test="${prfsExamList eq null}">
						<th colspan="9">등록된 시험이 존재하지 않습니다.</th>
					</c:when>
					<c:otherwise>
						<thead>
							<tr>
								<th>시험번호</th>
								<th>년도</th>
								<th>학기</th>
								<th>강의명</th>
								<th>분반</th>
								<th>유형</th>
								<th>시험일</th>
								<th>시험시간</th>
								<th>상세페이지</th>
								<th>응시자조회</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${prfsExamList}" var="prfsExam" varStatus="status">
								<tr>
									<td>${prfsExam.get("exam_num") }</td>
									<td>${prfsExam.get("lct_yr") }</td>
									<td>${prfsExam.get("lct_qtr") }</td>
									<td>${prfsExam.get("lct_nm") }</td>
									<td>${prfsExam.get("lct_nm_class") }</td>
									<td>${prfsExam.get("exam_type") }</td>
									<td>${prfsExam.get("exam_date") }</td>
									<td>${prfsExam.get("exam_start_date") } ~ ${prfsExam.get("exam_end_date") }</td>
									<td><button style="padding:5px" class="btn btn-outline btn-primary" onclick="location.href='${pageContext.request.contextPath}/professor/classManage/lectureExamQn?exam_num=${prfsExam.get('exam_num')}&division=1'">시험문제조회</button></td>
									<td><button style="padding:5px" class="btn btn-outline btn-primary" onclick="location.href='${pageContext.request.contextPath}/professor/classManage/lectureTakeExamStudent?exam_num=${prfsExam.get('exam_num')}'">응시자조회</button></td>
								<tr/>
							</c:forEach>
						</tbody>
					</c:otherwise>
				</c:choose>
			</table>
			<button style="float:right" class="btn btn-outline btn-primary" onclick="location.href='${pageContext.request.contextPath }/professor/classManage/lectureRegistryExam'">시험등록</button>
		</div>
	</div>
</div>