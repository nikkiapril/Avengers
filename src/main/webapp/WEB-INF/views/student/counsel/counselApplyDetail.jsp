<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  상담 상세페이지
<from action="${pageContext.request.contextPath}/student/counsel/counselApply">

<select name="cns_prfs">
<c:forEach var="cnsList" items="${cnsList}">
<option>${cnsList.cns_prfs}</option>
</c:forEach> 
</select>

<input type="submit" value="신청">
</from>