<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="po.Customer"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ page import="po.Mx"%>
<%@ page import="po.Customer"%>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Vi</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">
<!-- endinject -->
<!-- inject:css -->
<link rel="stylesheet" href="css/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="images/favicon.png" />

<style type="text/css">

	
	/*����div��ʽ�����岼��*/
	.page-icon{
		margin:20px 0 0 0;/*���þ��붥��20����*/
		font-size:0;/*�޸�����Ԫ��֮���϶���*/
		text-align:center;/*�������ݾ�����ʾ*/
	}
	
	/*���ù��еĵ���ʽ���֣���Ҫ�ǽ��д����Ż����������Ч��*/
	.page-icon a,.page-disabled,.page-next{
		border:1px solid #ccc;
		border-radius:3px;
		padding:4px 10px 5px;
		font-size:14PX;/*�޸�����Ԫ��֮���϶���*/
		margin-right:10px;
	}
	
	/*�� a ��ǩ������ʽ���� */
	.page-icon a{
		text-decoration:none;/*ȡ�����ӵ��»���*/
		color:#005aa0;
	}
	
	.page-current{
		color:#ff6600;
		padding:4px 10px 5px;
		font-size:14PX;/*�޸�����Ԫ��֮���϶���*/
	}
	
	.page-disabled{
		color:#ccc;
	}
	
	.page-next i,.page-disabled i{
		cursor:pointer;/*������꾭��ʱ����ʾ״̬���������õ�����ʾ״̬ΪС��״̬*/
		display:inline-block;/*������ʾ�ķ�ʽΪ���ڿ�Ԫ��*/
		width:5px;
		height:9px;
		background-image:url(http://img.mukewang.com/547fdbc60001bab900880700.gif);/*��ȡͼ��ı�������*/
	}
	.page-disabled i{
		background-position:-80px -608px;
		margin-right:3px;
	}
 
	.page-next i{
		background-position:-62px -608px;
		margin-left:3px;
	}

#menu-toggle {
	position: absolute;
	top: 10px;
	right: 20px;
}

#menu-check ~ ul {
	display: none;
}

#menu-check:checked ~ ul {
	display: block;
}

ul {
	list-style: none;
}

li {
	line-height: 36px;
}

#all_light { /*����������ҳ��*/
	opacity: 0.8; /*͸����*/
	position: absolute;
	top: 0;
	left: 0; /*��λ*/
	display: none; /*����*/
}

#contes { /* �����ҳ��*/
	width: 320px; /*����*/
	height: 500px; /*�߶�*/
	background: #abf; /*����ɫ*/
	display: none; /*����*/
	z-index: 2; /*����*/
	position: absolute;
	border-radius: 30px;
	top: 60px;
	left: 1130px; /* ��λ*/
}

input {
	margin-bottom: 10px;
}
</style>
</head>

<body>
	<%
		ArrayList stus = (ArrayList) request.getSession().getAttribute(
				"list");
		Customer cus = (Customer) request.getSession().getAttribute("cus1");
	%>
	<div class="container-scroller">
		<!-- partial:partials/_navbar.html -->
		<div class="container-scroller">
			<!-- partial:../../partials/_navbar.html -->

			<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
				<div class="navbar-brand-wrapper d-flex justify-content-center">
					<div
						class="navbar-brand-inner-wrapper d-flex justify-content-between align-items-center w-100">
						<a class="navbar-brand brand-logo"><img
							src="./images/logo.svg" alt="logo" /></a> <a
							class="navbar-brand brand-logo-mini"><img
							src="./images/logo-mini.svg" alt="logo" /></a>
						<button class="navbar-toggler navbar-toggler align-self-center"
							type="button" data-toggle="minimize">
							<span class="mdi mdi-sort-variant"></span>
						</button>
					</div>
				</div>
				<div
					class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
					<ul class="navbar-nav mr-lg-4 w-100">
						<li class="nav-item nav-search d-none d-lg-block w-100">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text" id="search"> <i
										class="mdi mdi-magnify"></i>
									</span>
								</div>
								<input type="text" class="form-control" placeholder="Search now"
									aria-label="search" aria-describedby="search">
							</div>
						</li>
					</ul>
					<ul class="navbar-nav navbar-nav-right">
						<li class="nav-item dropdown mr-1"><a
							class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center"
							id="messageDropdown" href="#" data-toggle="dropdown"> <i
								class="mdi mdi-message-text mx-0"></i> <span class="count"></span>
						</a>
						  <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="messageDropdown">
              <p class="mb-0 font-weight-normal float-left dropdown-header">Messages</p>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                    <img src="images/faces/face4.jpg" alt="image" class="profile-pic">
                </div>
                <div class="item-content flex-grow">
                  <h6 class="ellipsis font-weight-normal">David Grey
                  </h6>
                  <p class="font-weight-light small-text text-muted mb-0">
                    The meeting is cancelled
                  </p>
                </div>
              </a>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                    <img src="images/faces/face2.jpg" alt="image" class="profile-pic">
                </div>
                <div class="item-content flex-grow">
                  <h6 class="ellipsis font-weight-normal">Tim Cook
                  </h6>
                  <p class="font-weight-light small-text text-muted mb-0">
                    New product launch
                  </p>
                </div>
              </a>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                    <img src="images/faces/face3.jpg" alt="image" class="profile-pic">
                </div>
                <div class="item-content flex-grow">
                  <h6 class="ellipsis font-weight-normal"> Johnson
                  </h6>
                  <p class="font-weight-light small-text text-muted mb-0">
                    Upcoming board meeting
                  </p>
                </div>
              </a>
            </div>
						</li>
						<li class="nav-item dropdown mr-4"><a
							class="nav-link count-indicator dropdown-toggle d-flex align-items-center justify-content-center notification-dropdown"
							id="notificationDropdown" href="#" data-toggle="dropdown"> <i
								class="mdi mdi-bell mx-0"></i> <span class="count"></span>
						</a>
							<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
								aria-labelledby="notificationDropdown">
								<p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
								<a class="dropdown-item">
									<div class="item-thumbnail">
										<div class="item-icon bg-success">
											<i class="mdi mdi-information mx-0"></i>
										</div>
									</div>
									<div class="item-content">
										<h6 class="font-weight-normal">Application Error</h6>
										<p class="font-weight-light small-text mb-0 text-muted">
											Just now</p>
									</div>
								</a> <a class="dropdown-item">
									<div class="item-thumbnail">
										<div class="item-icon bg-warning">
											<i class="mdi mdi-settings mx-0"></i>
										</div>
									</div>
									<div class="item-content">
										<h6 class="font-weight-normal">Settings</h6>
										<p class="font-weight-light small-text mb-0 text-muted">
											Private message</p>
									</div>
								</a> <a class="dropdown-item">
									<div class="item-thumbnail">
										<div class="item-icon bg-info">
											<i class="mdi mdi-account-box mx-0"></i>
										</div>
									</div>
									<div class="item-content">
										<h6 class="font-weight-normal">New user registration</h6>
										<p class="font-weight-light small-text mb-0 text-muted">2
											days ago</p>
									</div>
								</a>
							</div></li>
						<li class="nav-item nav-profile dropdown"><a
							class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
							id="profileDropdown"> <img src="./images/faces/boy.jpg"
								alt="profile" /> <span class="nav-profile-name"><%=cus.getCname()%></span>
						</a>
							<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
								aria-labelledby="profileDropdown">
								<a class="dropdown-item" onclick="add()"> <i
									class="mdi mdi-settings text-primary"></i> ����
								</a> <a class="dropdown-item"
									onclick="document.getElementById('form1').submit();"> <i
									class="mdi mdi-logout text-primary"></i> �ǳ�
									<form action="logout.do" method="post" id="form1"></form>
								</a>
							</div></li>
					</ul>
					<button
						class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
						type="button" data-toggle="offcanvas">
						<span class="mdi mdi-menu"></span>
					</button>
				</div>
			</nav>

			<!-- partial -->
			<div class="container-fluid page-body-wrapper">
				<!-- partial:../../partials/_sidebar.html -->
				<nav class="sidebar sidebar-offcanvas" id="sidebar">
					<ul class="nav">
						<li class="nav-item"><a class="nav-link" href="menu.jsp">
								<i class="mdi mdi-home menu-icon"></i> <span class="menu-title">��ҳ</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="wdzh.jsp">
								<i class="mdi mdi-account menu-icon"></i> <span
								class="menu-title">�˻�</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="cunkuan.jsp">
								<i class="mdi mdi-chart-pie menu-icon"></i> <span
								class="menu-title">���</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="qukuan.jsp">
								<i class="mdi mdi-chart-pie menu-icon"></i> <span
								class="menu-title">ȡ��</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="zzhk.jsp">
								<i class="mdi mdi-file-document-box-outline menu-icon"></i> <span
								class="menu-title">ת�˻��</span>
						</a></li>

						<li class="nav-item"><a class="nav-link" href="tzlc.jsp">
								<i class="mdi mdi-grid-large menu-icon"></i> <span
								class="menu-title">Ͷ������</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="ejf.jsp">
								<i class="mdi mdi-emoticon menu-icon"></i> <span
								class="menu-title">e�ɷ�</span>
						</a></li>

					</ul>
				</nav>
				<!-- partial -->
				<div class="main-panel">
					<div class="content-wrapper">
						<div class="row">
							<div class="col-md-12 grid-margin">
								<div class="d-flex justify-content-between flex-wrap">
									<div class="d-flex align-items-end flex-wrap">
										<div class="mr-md-3 mr-xl-5">
											<h2>��ӭ�鿴</h2>
											<p class="mb-md-0">�����˺���֧��ϸ</p>
										</div>
										<div class="d-flex">
											<i class="mdi mdi-home text-muted hover-cursor"></i>
											<p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;Dashboard&nbsp;/&nbsp;</p>
											<p class="text-primary mb-0 hover-cursor">Analytics</p>
										</div>
									</div>
									<div
										class="d-flex justify-content-between align-items-end flex-wrap">
										<button type="button"
											class="btn btn-light bg-white btn-icon mr-3 d-none d-md-block ">
											<i class="mdi mdi-download text-muted"></i>
										</button>
										<button type="button"
											class="btn btn-light bg-white btn-icon mr-3 mt-2 mt-xl-0">
											<i class="mdi mdi-clock-outline text-muted"></i>
										</button>
										<button type="button"
											class="btn btn-light bg-white btn-icon mr-3 mt-2 mt-xl-0">
											<i class="mdi mdi-plus text-muted"></i>
										</button>
										<button class="btn btn-primary mt-2 mt-xl-0">���ر���</button>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 grid-margin stretch-card">
								<div class="card">
									<div class="card-body dashboard-tabs p-0">
										<ul class="nav nav-tabs px-4" role="tablist">
											<li class="nav-item"><a class="nav-link active"
												id="overview-tab" data-toggle="tab" href="#overview"
												role="tab" aria-controls="overview" aria-selected="true">Overview</a>
											</li>
											<li class="nav-item"><a class="nav-link" id="sales-tab"
												data-toggle="tab" href="#sales" role="tab"
												aria-controls="sales" aria-selected="false">Sales</a></li>
											<li class="nav-item"><a class="nav-link"
												id="purchases-tab" data-toggle="tab" href="#purchases"
												role="tab" aria-controls="purchases" aria-selected="false">Purchases</a>
											</li>
										</ul>
										<div class="tab-content py-0 px-0">
											<div class="tab-pane fade show active" id="overview"
												role="tabpanel" aria-labelledby="overview-tab">
												<div class="d-flex flex-wrap justify-content-xl-between">
													<div
														class="d-none d-xl-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
														<i
															class="mdi mdi-calendar-heart icon-lg mr-3 text-primary"></i>
														<div class="d-flex flex-column justify-content-around">
															<small class="mb-1 text-muted">��������</small>
															<div class="dropdown">
																<a
																	class="btn btn-secondary dropdown-toggle p-0 bg-transparent border-0 text-dark shadow-none font-weight-medium"
																	href="#" role="button" id="dropdownMenuLinkA"
																	data-toggle="dropdown" aria-haspopup="true"
																	aria-expanded="false">
																	<h5 class="mb-0 d-inline-block">26 Jul 2018</h5>
																</a>
																<div class="dropdown-menu"
																	aria-labelledby="dropdownMenuLinkA">
																	<a class="dropdown-item" href="#">12 Aug 2018</a> <a
																		class="dropdown-item" href="#">22 Sep 2018</a> <a
																		class="dropdown-item" href="#">21 Oct 2018</a>
																</div>
															</div>
														</div>
													</div>
													<div
														class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
														<i class="mdi mdi-currency-usd mr-3 icon-lg text-danger"></i>
														<div class="d-flex flex-column justify-content-around">
															<small class="mb-1 text-muted">����</small>
															<h5 class="mr-2 mb-0">$577545</h5>
														</div>
													</div>
													<div
														class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
														<i class="mdi mdi-eye mr-3 icon-lg text-success"></i>
														<div class="d-flex flex-column justify-content-around">
															<small class="mb-1 text-muted">�鿴</small>
															<h5 class="mr-2 mb-0">550</h5>
														</div>
													</div>
													<div
														class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
														<i class="mdi mdi-download mr-3 icon-lg text-warning"></i>
														<div class="d-flex flex-column justify-content-around">
															<small class="mb-1 text-muted">Downloads</small>
															<h5 class="mr-2 mb-0">2233783</h5>
														</div>
													</div>
													<div
														class="d-flex py-3 border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
														<i class="mdi mdi-flag mr-3 icon-lg text-danger"></i>
														<div class="d-flex flex-column justify-content-around">
															<small class="mb-1 text-muted">Flagged</small>
															<h5 class="mr-2 mb-0">3497843</h5>
														</div>
													</div>
												</div>
											</div>
											<div class="tab-pane fade" id="sales" role="tabpanel"
												aria-labelledby="sales-tab">
												<div class="d-flex flex-wrap justify-content-xl-between">
													<div
														class="d-none d-xl-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
														<i
															class="mdi mdi-calendar-heart icon-lg mr-3 text-primary"></i>
														<div class="d-flex flex-column justify-content-around">
															<small class="mb-1 text-muted">Start date</small>
															<div class="dropdown">
																<a
																	class="btn btn-secondary dropdown-toggle p-0 bg-transparent border-0 text-dark shadow-none font-weight-medium"
																	href="#" role="button" id="dropdownMenuLinkA"
																	data-toggle="dropdown" aria-haspopup="true"
																	aria-expanded="false">
																	<h5 class="mb-0 d-inline-block">26 Jul 2018</h5>
																</a>
																<div class="dropdown-menu"
																	aria-labelledby="dropdownMenuLinkA">
																	<a class="dropdown-item" href="#">12 Aug 2018</a> <a
																		class="dropdown-item" href="#">22 Sep 2018</a> <a
																		class="dropdown-item" href="#">21 Oct 2018</a>
																</div>
															</div>
														</div>
													</div>
													<div
														class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
														<i class="mdi mdi-download mr-3 icon-lg text-warning"></i>
														<div class="d-flex flex-column justify-content-around">
															<small class="mb-1 text-muted">Downloads</small>
															<h5 class="mr-2 mb-0">2233783</h5>
														</div>
													</div>
													<div
														class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
														<i class="mdi mdi-eye mr-3 icon-lg text-success"></i>
														<div class="d-flex flex-column justify-content-around">
															<small class="mb-1 text-muted">Total views</small>
															<h5 class="mr-2 mb-0">9833550</h5>
														</div>
													</div>
													<div
														class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
														<i class="mdi mdi-currency-usd mr-3 icon-lg text-danger"></i>
														<div class="d-flex flex-column justify-content-around">
															<small class="mb-1 text-muted">Revenue</small>
															<h5 class="mr-2 mb-0">$577545</h5>
														</div>
													</div>
													<div
														class="d-flex py-3 border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
														<i class="mdi mdi-flag mr-3 icon-lg text-danger"></i>
														<div class="d-flex flex-column justify-content-around">
															<small class="mb-1 text-muted">Flagged</small>
															<h5 class="mr-2 mb-0">3497843</h5>
														</div>
													</div>
												</div>
											</div>
											<div class="tab-pane fade" id="purchases" role="tabpanel"
												aria-labelledby="purchases-tab">
												<div class="d-flex flex-wrap justify-content-xl-between">
													<div
														class="d-none d-xl-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
														<i
															class="mdi mdi-calendar-heart icon-lg mr-3 text-primary"></i>
														<div class="d-flex flex-column justify-content-around">
															<small class="mb-1 text-muted">Start date</small>
															<div class="dropdown">
																<a
																	class="btn btn-secondary dropdown-toggle p-0 bg-transparent border-0 text-dark shadow-none font-weight-medium"
																	href="#" role="button" id="dropdownMenuLinkA"
																	data-toggle="dropdown" aria-haspopup="true"
																	aria-expanded="false">
																	<h5 class="mb-0 d-inline-block">26 Jul 2018</h5>
																</a>
																<div class="dropdown-menu"
																	aria-labelledby="dropdownMenuLinkA">
																	<a class="dropdown-item" href="#">12 Aug 2018</a> <a
																		class="dropdown-item" href="#">22 Sep 2018</a> <a
																		class="dropdown-item" href="#">21 Oct 2018</a>
																</div>
															</div>
														</div>
													</div>
													<div
														class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
														<i class="mdi mdi-currency-usd mr-3 icon-lg text-danger"></i>
														<div class="d-flex flex-column justify-content-around">
															<small class="mb-1 text-muted">Revenue</small>
															<h5 class="mr-2 mb-0">$577545</h5>
														</div>
													</div>
													<div
														class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
														<i class="mdi mdi-eye mr-3 icon-lg text-success"></i>
														<div class="d-flex flex-column justify-content-around">
															<small class="mb-1 text-muted">Total views</small>
															<h5 class="mr-2 mb-0">9833550</h5>
														</div>
													</div>
													<div
														class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
														<i class="mdi mdi-download mr-3 icon-lg text-warning"></i>
														<div class="d-flex flex-column justify-content-around">
															<small class="mb-1 text-muted">Downloads</small>
															<h5 class="mr-2 mb-0">2233783</h5>
														</div>
													</div>
													<div
														class="d-flex py-3 border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
														<i class="mdi mdi-flag mr-3 icon-lg text-danger"></i>
														<div class="d-flex flex-column justify-content-around">
															<small class="mb-1 text-muted">Flagged</small>
															<h5 class="mr-2 mb-0">3497843</h5>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">

							<div class="col-md-5 grid-margin stretch-card"></div>
						</div>
						<div class="row">
							<div class="col-md-12 stretch-card">
								<div class="card">
									<div class="card-body">
										<h3>
											���������
											<bean:write name="cus1" property="cbalance" />
											Ԫ!!
										</h3>
										<p class="card-title">��֧��ϸ</p>
										<div class="table-responsive">
										<%
										String pageno=request.getParameter("pageno");
									
										int pagesize = 6;
										int pagecount;
										int rowcount;
										int pagecurrent;
										int rowcurrent;
										
										if(pageno==null||pageno.trim().length()==0){
											pagecurrent=1;
										}
										else{
											pagecurrent=Integer.parseInt(pageno);
										}
										
										rowcurrent=(pagecurrent-1)*pagesize+1;
										
										rowcount=stus.size();
										pagecount=(rowcount+pagesize-1)/pagesize;
										
										if(pagecurrent>pagecount)
											pagecurrent=pagecount;
										if(pagecurrent<1)
											pagecurrent=1;
										%>
											<table id="recent-purchases-listing" class="table">

												<thead>
													<tr>
														<th>�˺�</th>

														<th>����</th>
														<th>��/֧</th>
														<th>���</th>
													</tr>
												</thead>
												<tbody>

													<tr>
														<%															
															for (int i=rowcurrent;i>(pagecurrent-1)*pagesize&&i<=pagecurrent*pagesize&&i<=stus.size(); i++) {
																Mx stu = (Mx) stus.get(i-1);
														%>
													
													<tr>
														<td><%=stu.getAccount()%></td>
														<td><%=stu.getTime()%></td>
														<td><%=stu.getZf()%></td>
														<td><%=stu.getHowmuch()%></td>

													</tr>
													<%
														}
													%>
												</tbody>
											</table>
											<p align="center">
											 ��<%=pagecount %>ҳ&nbsp;
		<div class="page-icon">									
		
			
			<%if(pagecurrent>1){ %>
			<a href="wdzh.jsp?pageno=1" class="page-next">��ҳ</a>
			<a href="wdzh.jsp?pageno=<%=pagecurrent-1 %>" class="page-next">��һҳ</a>
			<%} %><span class="page-current">��<%=pagecurrent %>ҳ</span>
			&nbsp;
			<%if(pagecurrent<pagecount){ %>
			<a href="wdzh.jsp?pageno=<%=pagecurrent+1 %>" class="page-next">��һҳ</a>
			<a href="wdzh.jsp?pageno=<%=pagecount %>" class="page-next">βҳ</a>
			<%} %>
			
		
		 </div>
		
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- content-wrapper ends -->
					<!-- partial:partials/_footer.html -->
					<footer class="footer">
						<div
							class="d-sm-flex justify-content-center justify-content-sm-between">
							<span
								class="text-muted text-center text-sm-left d-block d-sm-inline-block">2020@��������
								<a href="https://www.baidu.com/" target="_blank"></a>
							</span> <span
								class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">
								make in ����С��<i class="mdi mdi-heart text-danger"></i>
							</span>
						</div>
					</footer>
					<!-- partial -->
				</div>
				<!-- main-panel ends -->
			</div>
			<!-- page-body-wrapper ends -->
		</div>



		<div id="contes" class="col-lg-12 grid-margin stretch-card" style="">
			<div style="width:300px;height:40px;">

				<hr>
				<html:form action="/edit" method="post">
					<div class="form-group">
						<h4 class="card-title">�޸���Ϣ</h4>
						<input type="hidden" class="form-control form-control-lg"
							id="exampleInputEmail1" name="account"
							value=<%=cus.getAccount()%>>
					</div>
               ����
                <div class="form-group">
						<input type="text" class="form-control form-control-lg"
							id="exampleInputEmail1" name="password"
							value=<%=cus.getPassword()%> pattern="[0-9]{6}" title="������6λ����">
					</div>
                �û���
                 <div class="form-group">
						<input type="text" class="form-control form-control-lg"
							id="exampleInputEmail1" name="cname" value=<%=cus.getCname()%>>
					</div>
                ����
              <div class="form-group">
						<input type="text" class="form-control form-control-lg"
							id="exampleInputEmail1" name="email" value=<%=cus.getEmail()%>>
					</div>
					<input type="hidden" class="form-control form-control-lg"
						id="exampleInputEmail1" name="cbalance"
						value=<%=cus.getCbalance()%>>
					<div class="mt-3">
						<input
							class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn"
							type="submit" value="ȷ���޸�">
						<li class="nav-item"><a class="nav-link" href="menu.jsp">
								<i class="mdi mdi-logout text-primary"></i> <span>ȡ��</span>
						</a></li>
					</div>
				</html:form>
			</div>
		</div>
		<div id="all_light"></div>
</body>
<script>
	function add() {
		document.getElementById('all_light').style.display = 'block';
		document.getElementById('contes').style.display = 'block';
	}
</script>


<!-- container-scroller -->

<!-- plugins:js -->
<script src="vendors/base/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page-->
<script src="vendors/chart.js/Chart.min.js"></script>
<script src="vendors/datatables.net/jquery.dataTables.js"></script>
<script src="vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
<!-- End plugin js for this page-->
<!-- inject:js -->
<script src="js/off-canvas.js"></script>
<script src="js/hoverable-collapse.js"></script>
<script src="js/template.js"></script>
<!-- endinject -->
<!-- Custom js for this page-->
<script src="js/dashboard.js"></script>
<script src="js/data-table.js"></script>
<script src="js/jquery.dataTables.js"></script>
<script src="js/dataTables.bootstrap4.js"></script>
<!-- End custom js for this page-->
</body>

</html>
