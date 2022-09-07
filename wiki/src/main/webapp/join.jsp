<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file ="menu.jsp" %>
<script type="text/javascript">

function checkForm(){

	
	if(!document.newMember.memberId.value){
		alert("아이디를 입력해주세요.");
		return false;
	}
	if(!document.newMember.memberPW.value){
		alert("비밀번호를 입력해주세요.");
		return false;
	}
	if(document.newMember.memberPW.value != document.newMember.memberPWC.value){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
	if(!document.newMember.memberName.value){
		alert("성명은 필수입니다.");
		return false;
	}
}

</script>
</head>
<body>
<div class="jumbotron">
	<h1 class="display-3" align="center">회원 가입</h1>
</div>
<hr>
<div>	

	<div class="container">
		<form name="newMember" action="./processJoin.jsp" class="form-horizontal" method="post" onsubmit="return checkForm()">
			<div class="form-group row">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-3">
					<input type="text" name="memberId" id="memberId"
						class="form-control">
				</div>	
			</div>
			<%if(request.getParameter("error")!=null) {
				out.println("<div class='alert alert-danger'>");
				out.println("아이디가 중복됩니다.");
				out.println("</div>");
			}
			%>

			<div class="form-group row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input type="password" name="memberPW" id="memberPW"
						class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">비밀번호 확인</label>
				<div class="col-sm-3">
					<input type="password" name="memberPWC" id="memberPWC"
						class="form-control">
				</div>
			</div>


			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input type="text" name="memberName" id="memberName"
						class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-5">
					<input type="radio" name="memberGender" value="m"> 남 <input
						type="radio" name="memberGender" value="f"> 여
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">생일</label>
				<div class="col-sm-2">
					<input type="date" name="userBirth" required="required" />
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-10">
					<input type="text" maxlength="50" name="memberEmail1"
						id="memberEmail1">@
					 <select name="memberEmail2" id="memberEmail2">
						<option value="naver.com">naver.com</option>
						<option value="google.com">google.com</option>
					</select>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input type="text" name="memberPhone" id="memberPhone"
						class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-3">
					<input type="text" name="memberAddress" id="memberAddress"
						class="form-control">
				</div>
			</div>
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-5 ">
				<input type="submit" class="btn btn-primary" value="등록">
				<a href="./main.jsp" class="btn btn-secondary">취소</a>
			</div>
		</div>
		</form>


	</div>

</div>

</body>
</html>