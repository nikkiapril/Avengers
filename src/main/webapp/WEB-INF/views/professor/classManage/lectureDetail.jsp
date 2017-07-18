<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		강의번호 : <input type="text" readonly value="${detailLct.get('lct_num') }"/>
		담당교수 : <input type="text" readonly value="${detailLct.get('prfs_nm')}"/>
		E-mail : <input type="text" readonly value="${detailLct.get('prfs_email')}"/>
		분반 : <input type="text" readonly value="${detailLct.get('lct_nm_class')}"/>
		핸드폰 : <input type="text" readonly value="${detailLct.get('prfs_hp')}"/><br/>
		
		교과목명 : <input type="text" readonly value="${detailLct.get('sjt_nm')}"/>
		학점 : <input type="text" readonly value="${detailLct.get('sjt_crd')}"/>
		이수구분 : <input type="text" readonly value="${detailLct.get('sjt_cd')}"/>
		개설학년 : <input type="text" readonly value="${detailLct.get('sjt_estm_grd')}"/>
		개설학과 : <input type="text" readonly value="${detailLct.get('dept_nm')}"/><br/>
		
		1.과목개요<br/>
		<textarea rows="10" cols="100" readonly>${detailLct.get('sjt_smy')}</textarea><br/>
		<div style="margin:10px 0; border:2px pink dotted">
			2.평가방법<br/>
			중간고사<input type="text" readonly value="${detailLct.get('lct_me_rate')}"/>
			기말고사<input type="text" readonly value="${detailLct.get('lct_fe_rate')}"/>
			과제<input type="text" readonly value="${detailLct.get('lct_asgn_rate')}"/>
			출석<input type="text" readonly value="${detailLct.get('lct_atdc_rate')}"/><br/>
		</div>
		3.교재<br/>
		저자<input type="text"  readonly value="${textbook[0] }"/>
		서명<input type="text"  readonly value="${textbook[1] }"/>
		출판사<input type="text" readonly value="${textbook[2] }"/>
		년도<input type="text" readonly value="${textbook[3] }"/><br/>
		
		4.강의내용<br/>
		<textarea rows="10" cols="100" readonly>${detailLct.get('lct_cont')}</textarea>
	</form>
	<button onclick="location.href='${pageContext.request.contextPath }/professor/classManage/lectureModifyDetail'">수정</button>
	<button onclick="location.href='${pageContext.request.contextPath }/professor/classManage/lectureMain'">뒤로가기</button> 
</body>
</html>