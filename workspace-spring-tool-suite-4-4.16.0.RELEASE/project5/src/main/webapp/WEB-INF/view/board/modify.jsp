<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<%@include file="../include/header.jsp"%>

<body class="bg-gradient-primary">

	<script type="text/javascript">
		$(function(){
			const formObj = $("form");
			
			$('button').on("click",
				function(e)
				{
					e.preventDefault();
					
					const operation = $(this).data("oper");
					
					console.log(operation);
					
					if(operation === 'remove'){
						formObj.attr("action", "/board/remove");
					}else if(operation === 'list'){
						/* self.location="/board/list";
						return; */
						formObj.attr("action", "/board/list").attr("method", "get"); /* 태그 내용에만 영향이 감. */ 
						formObj.empty(); /* 이 녀석 안에 속해있는 내용을 전부 지워버리겠다는 뜻. */
					}
					
					formObj.submit();
			});
		});
	</script>


	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-5">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">게시글 수정</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">

							<div class="panel heading">Board Modify</div>
							<!-- ./panel-heading -->
							<div class="panel-body">
								<form role="form" action="/board/modify" method="post">

									<div class="form-group">
										<label>Bno</label> <input class="form-control" name='bno'
											value='<c:out value="${board.bno}"/>' readonly="readonly">
									</div>

									<div class="form-group">
										<label>Title</label> <input class="form-control" name='title'
											value='<c:out value="${board.title}"/>'>
									</div>

									<div class="form-group">
										<label>Text area</label>
										<textarea rows="3" name='content' class="form-control"><c:out
												value="${board.content}" /></textarea>
									</div>

									<div class="form-group">
										<label>Writer</label> <input class="form-control"
											name='writer' value='<c:out value="${board.writer}"/>'
											readonly="readonly">
									</div>

									<div class="form-group">
										<label>RegDate</label> <input class="form-control"
											name='regDate'
											value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate}" />'
											readonly="readonly">
									</div>

									<div class="form-group">
										<label>Update Date</label> <input class="form-control"
											name='updateDate'
											value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.updateDate}"/>'
											readonly="readonly">
										<!-- 날짜 형식을 pattern="yyyy/MM/dd" 해주지 않으면 인식 못함. -->
									</div>

									<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
									<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
									<button type="submit" data-oper='list' class="btn btn-info">List</button>
								</form>

							</div>
							<!-- end panel-body -->
						</div>
						<!-- end panel-body -->
					</div>
					<!-- end panel -->
				</div>
				<!-- /.row -->






				<!-- Nested Row within Card Body -->
			</div>
		</div>
	</div>
</body>

</html>