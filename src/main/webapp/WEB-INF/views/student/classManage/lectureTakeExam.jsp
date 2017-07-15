<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	a{
	cursor:pointer;
	text-decoration:none;
	color:#323232;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(function(){
		var index = 0;
		var qtnas = [];
		var answers = [];
		var eqSize = '<c:out value="${eqList.size()}"/>';
		
		ans_check = function(qtna, ans){
			if(index == 0){
				qtnas[index] = qtna;
				answers[index] = ans;
				index++;
			} else {//처음 답변이 저장될 때, 즉 index=0일 때 문항과 답변을 담아준다.
				for(var i=0; i<index;i++){
					if(qtnas[i] == qtna){//문항이 같은 경우, 해당 문항의 답변만 바꿔준다.
						answers[i] = ans;
						break;
					} else if(i == index - 1){//마지막까지 같은 문항을 찾지 못한 경우, 새로운 문항번호와 답변을 넣어준다.
						qtnas[index] = qtna;
						answers[index] = ans;
						index++;
						break;
					}
				}
			}
		};
		
		exam_submit = function (){
			alert(qtnas.length + " " +eqSize)
			if(qtnas.length == eqSize){
				var lct = '<c:out value="${lct_num}"/>';
				var te = '<c:out value="${te_num}"/>';
				lct = encodeURIComponent(lct);
				lct = lct.replace("'", "%27");
				te = encodeURIComponent(te);
				te = te.replace("'", "%27");
<%-- 				location.href="<%=request.getContextPath()%>/student/classManage/lectureExamSubmit?lct_num="+lct; --%>
				$.post({
					url:'<%=request.getContextPath()%>/student/classManage/lectureExamSubmit'
					, type:'post'
					, data:{
						qtnaArr:qtnas,
						answerArr:answers,
						lct_num:lct,
						te_num:te
					},
					success:function(){
						location.href="<%=request.getContextPath()%>/student/classManage/lectureExamSubmit?lct_num="+lct;
					}
				});
			} else {
				alert("풀지 않은 문제가 있습니다.");
			}
		};
		
		$('textarea').blur(function(){
			if(!$(this).val()){
				
			} else{
				if(index == 0){
					qtnas[index] = $(this).attr("id");
					answers[index] = $(this).val();
					index++;
				} else{
					for(var i=0; i<index;i++){
						if(qtnas[i] == $(this).attr("id")){//문항이 같은 경우, 해당 문항의 답변만 바꿔준다.
							answers[i] = $(this).val();
							break;
						} else if(i == index - 1){//마지막까지 같은 문항을 찾지 못한 경우, 새로운 문항번호와 답변을 넣어준다.
							qtnas[index] = $(this).attr("id");
							answers[index] = $(this).val();
							index++;
							break;
						}
					}
				}
			}
		})
	});
</script>
</head>
<body>
<!--1.주관식 2.객관식 -->
<form>
	<c:forEach items="${eqList}" var="eq1" varStatus="status">
		시험문제고유번호 : ${eq1.getEq_num() }<br/>
		${eq1.getEq_qtna() }.
		${eq1.getEq_qtn() }<br/>
		<c:choose>
			<c:when test="${eq1.getEq_qtn_type() eq 1}">
				<a href="javascript:ans_check(${eq1.getEq_qtna() },1)">①${eq1.getEq_exmp_one() }</a><br/>
				<a href="javascript:ans_check(${eq1.getEq_qtna() },2)">②${eq1.getEq_exmp_two() }</a><br/>
				<a href="javascript:ans_check(${eq1.getEq_qtna() },3)">③${eq1.getEq_exmp_three() }</a><br/>
				<a href="javascript:ans_check(${eq1.getEq_qtna() },4)">④${eq1.getEq_exmp_four() }</a><br/><br/>
			</c:when>
			<c:otherwise>
				<textarea id="${eq1.getEq_qtna() }" cols="100" rows="10"></textarea><br/><br/>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</form>
<button onclick="javascript:exam_submit();">제출</button>

제출버튼을 누르면 학생답안 테이블에 학생의 정답정보를 저장해주어야됨



</body>
</html>