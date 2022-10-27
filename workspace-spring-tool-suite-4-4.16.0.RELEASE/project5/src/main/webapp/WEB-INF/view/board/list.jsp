<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<%@include file ="../include/header.jsp" %>

<head>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript">

	replyService.getList({bno:16, page:1}, function (list) {
		
		for(var i=0, len=list.length||0;i<len;i++){
			console.log(list[i]);
		}
	});

</script>

</head>



<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
     	<%@include file ="../include/sidebar.jsp" %>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">


		<%@include file ="../include/content.jsp" %>
		<%@include file ="../include/footer.jsp" %>



        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

	<%@include file="../include/modal.jsp" %>
</body>

</html>