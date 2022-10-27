<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<%@include file="../include/header.jsp"%>

<body class="bg-gradient-primary">
	<script type="text/javascript" src="/resources/js/reply.js"></script>
	<script type="text/javascript">
		$(function() {

			let formObj = $("#operForm");

			$('button').on("click", function(e) {
				e.preventDefault(); /* e.는 이벤트? */
				const operation = $(this).data("oper");

				console.log(operation);

				if (operation === 'remove') {
					formObj.attr("action", "/board/remove");
				} else if (operation === 'list') {
					formObj.find("#bno").remove();
					formObj.attr("action", "/board/list");
				} else if (operation === 'modify'){
					
				} else {
					return;
				}

				formObj.submit();
			});
						
			var bnoValue = '<c:out value="${board.bno}"/>';
			var replyUL = $(".chat");
			showList(1);
			
			function showList(page) {

				replyService.getList(
						{bno : bnoValue, page : page || 1},
								function(replyTotalCnt, list) {
										console.log("replyTotalCnt" + replyTotalCnt);
									
									if(page == -1){
										// 페이지 번호가 음수 값 이라면,
										
										pageNum = Math.ceil(replyTotalCnt / 10.0);
										// 덧글의 마지막 페이지 구하기. (올림)
										
										showList(pageNum);
										// 덧글 목록 새로고침(갱신)
										
										return;
									}

									var str = "";

									if (list == null || list.length == 0) {
										replyUL.html("");
										return;
									}// 예외 처리.

									for (var i = 0, len = list.length || 0; i < len; i++) {
										str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
										str += "<div><div class='header'><string class='primary-font'>" + list[i].replyer + "</strong>";
										str += "<small class='float-sm-right'>" + replyService.displayTime(list[i].replyDate) + "</small></div>";
										str += "<p>" + list[i].reply + "</p></div></li>";
									} // end for.

									replyUL.html(str);
									showReplyPage(replyTotalCnt);
								}); //end function
			} // end showList
			
			var pageNum = 1;
			var replyPageFooter = $(".panel-footer");
			       
			function showReplyPage(replyCnt){
			     var endNum = Math.ceil(pageNum / 10.0) * 10;
			     // pageNum : 1이라고 가정하면,
			     // Math.ceil(1/10.0) 처리하고 * 10, 즉 endNum : 10
			     var startNum = endNum - 9; // 나올지도..
			     var prev = startNum != 1; // false = (1 != 1)
			     var next = false;
			     // replyCnt : 384, endNum : 39
			     if(endNum * 10 >= replyCnt) { // 100 >= 384
			         endNum = Math.ceil(replyCnt / 10.0);
			     }
			     if(endNum * 10 < replyCnt){
			         next = true;
			     }
			     var str = "<ul class='pagination";
			     str+=" justify-content-center'>";
			     if(prev){
			         str += "<li class='page-item><a ";
			         str += "class='page-link' href='";
			         str += (startNum - 1);
			         str += "'>이전</a></li>";
			     }
			     for(var i = startNum; i <= endNum; i++){
			         var active = pageNum == i ? "active" : "";
			         str += "<li class='page-item " + active
			         +"'><a class='page-link' ";
			         str+="href='" + i + "'>"
			         + i + "</a></li>";
			     }
			     if(next){
			         str += "<li class='page-item'>";
			         str += "<a class='page=link' href='";
			         str += (endNum + 1) + "'>다음</a></li>";
			     }
			     str += "</ul>";
			     console.log(str);
			     replyPageFooter.html(str);
			 }
			 // 덧글 페이징 끝
				
			// 덧글 페이징 클릭시 처리.
		       replyPageFooter.on("click", "li a", function(e){
		       	e.preventDefault();
		       	var targetPageNum = $(this).attr("href");
		       	pageNum = targetPageNum;
		       	showList(pageNum);
		       });
			
		var modal = $("#myModal");
		// 덧글 용 모달.
		var modalInputReplydate = modal.find("input[name='replyDate']");
		// 덧글 작성일 항목.
		var modalRegisterBtn = $("#modalRegisterBtn");
		// 모달에서 표시되는 덧글쓰기 버튼.
		var modalInputReply = modal.find("input[name='reply']");
		// 덧글 내용
		var modalInputReplyer = modal.find("input[name='replyer']"); 
		// 덧글작성자
		
		let modalModBtn = $("#modalModBtn");
		let modalRemoveBtn = $("#modalRemoveBtn");
			
			
			// 덧글 입력 모달창 보이기
			$("#addReplyBtn").on("click", function(e){
				// 덧글 쓰기 버튼을 클릭한다면,
				modal.find("input").val("");
				// 모달의 모든 입력창을 초기화
				modalInputReplydate.closest("div").hide();
				// closest : 선택 요소와 가장 가까운 요소를 지정.
				// 즉, modalInputReplyDate 요소의 가장 가까운 div를 찾아서 숨김.(날짜창 숨김)
				modal.find("button[id != 'modalCloseBtn']").hide();
				// 모달창에 버튼이 4개 인데, 닫기 버튼을 제외하고 숨기기.
				modalRegisterBtn.show(); // 등록 버튼은 보여라.
				$("#myModal").modal("show"); // 모달 표시.
			});
			
			// 모달창 닫기
			$("#modalCloseBtn").on("click", function(e){
				modal.modal("hide");
				// 모달 닫기 라는 버튼을 클릭한다면 모달창을 숨김.
			});
			
			// 덧글 쓰기
			modalRegisterBtn.on("click", function(e){
				// 덧글 등록 버튼을 눌렀다면,
				var reply = {
						reply : modalInputReply.val(),
						replyer : modalInputReplyer.val(),
						bno : bnoValue
				}; // ajax로 전달할 reply 객체 선언 및 할당.
				replyService.add(reply, function(result){
					alert(result);
					// ajax 처리후 결과 리턴.
					modal.find("input").val("");
					// 모달창 초기화
					modal.modal("hide"); // 모달창 숨기기
				});
			});
			
			$(".chat").on("click","li",function(e){
				let rno = $(this).data("rno");
				
				replyService.get(rno, function(reply) {
					modalInputReply.val(reply.reply);
					modalInputReplyer.val(reply.replyer);
					let date = replyService.displayTime(reply.replyDate);
					modalInputReplydate.val(date).attr("readonly", "readonly");
					modal.data("rno", reply.rno);
					
					modal.find("button[id!='modalCloseBtn']").hide();
					modalModBtn.show();
	                modalRemoveBtn.show();
					
					$(".modal").modal("show");
				});
			});
			
			// 덧글 수정 처리 시작.
			modalModBtn.on("click", function(e) {
				var reply = {
						rno : modal.data("rno"),
						replyer : modalInputReplyer.val(),
						reply : modalInputReply.val()
				};
				replyService.update(reply, function(result){
					alert(result);
					modal.modal("hide");
					showList(1);
				});
			}); // 끝 덧글 수정.

		});
	</script>
	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-5">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">게시글 1개 조회</h1>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel heading">Board Read Page</div>
							<!-- ./panel-heading -->
							<div class="panel-body">

								<div class="form-group">
									<label>Bno</label> <input class="form-control" name='bno' value='<c:out value="${board.bno}"/>' readonly="readonly">
								</div>

								<div class="form-group">
									<label>Title</label> <input class="form-control" name='title' value='<c:out value="${board.title}"/>' readonly="readonly">
								</div>

								<div class="form-group">
									<label>Text area</label>
									<textarea rows="3" name="content" readonly="readonly" class="form-control"><c:out value="${board.content}"/></textarea>
								</div>

								<div class="form-group">
									<label>Writer</label> <input class="form-control" name='writer'
										value='<c:out value="${board.writer}"/>' readonly="readonly">
								</div>

								<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
								<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
								<button type="submit" data-oper='list' class="btn btn-info">List</button>

								<form id='operForm' action="/board/modify" method="get">
									<!-- get 방식 -->
									<input type='hidden' id='bno' name='bno'
										value='<c:out value="${board.bno}"/>'>
								</form>
							</div>
							<!-- end panel-body -->
						</div>
						<!-- end panel-body -->
					</div>
					<!-- end panel -->
				</div>

				<hr>
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<i class="fa fa-comments fa-fw"></i>덧글
								<button id="addReplyBtn" data-oper='newReply' class="btn btn-primary btn-xs float-right">새 덧글</button>
							</div>
							<br>
							<div class="panel-body">
								<ul class="chat">
									<li>good</li>
								</ul>
							</div>
							<div class="panel-footer"></div>
						</div>
					</div>
				</div>
				<!-- /.row -->
			</div>



			<!-- Nested Row within Card Body -->
		</div>
	</div>
	
	<%@include file="../include/replyModal.jsp" %>	
</body>

</html>