<%@ page language="java" pageEncoding="GB18030"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
 
<html> 
	<head>
	 <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- inject:css -->
  <link rel="stylesheet" href="css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="images/favicon.png" />
		<title>Vi</title>
	</head>
	<body>
	<%
	String office=new String(request.getParameter("office").getBytes("ISO-8859-1"),"GB18030"); 
	String price=new String(request.getParameter("price").getBytes("ISO-8859-1"),"GB18030"); 
	%>
	<a class="dropdown-item" onclick="document.getElementById('form1').submit();">
                <i class="mdi mdi-logout text-primary" ></i>
             	 <button type="submit" class="btn btn-primary mr-2">确定出售</button>
        <form action="sale.do" method="post" id="form1">
		<input type="hidden" name="office" value=<%=office %>><br>
		<input type="hidden" name="price" value=<%=price %> ><br>
		</form>      
			 </a>
  <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">2020@软件构造 <a href="https://www.baidu.com/" target="_blank"></a></span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> make in 精神小伙<i class="mdi mdi-heart text-danger"></i></span>
          </div>
        </footer>
        
        
        
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="vendors/base/vendor.bundle.base.js"></script>
  <!-- endinject -->
    <!-- Plugin js for this page-->
    <script src="vendors/chart.js/Chart.min.js"></script>
    <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/template.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="js/chart.js"></script>
  <!-- End custom js for this page-->
</body>

</html>
 


