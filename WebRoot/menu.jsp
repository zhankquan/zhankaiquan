<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
 <%@ page import="po.Customer" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ page import="po.Tz" %>
<%@ page import="po.New" %>
<%@ page import="po.Apply" %>
<%@ page import="po.Friend" %>
<html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Vi</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- inject:css -->
   <link rel="stylesheet" href="vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="images/favicon.png" />
  <style type="text/css">
  
  .zhezhao{
				position: fixed;
				left: 0px;
				top: 0px;
				width: 100%;
				height: 100%;
				opacity: 1;
			}
			.tankuang{
				border-color:red;
				border:3px;
				position: relative;
				background: #ffe;
				width: 25%;
				height:20%;
				border-radius: 15px;
				margin: 5% auto;
			}
			.tankuang2{
				border-color:red;
				border:3px;
				position: relative;
				background: #ffe;
				width: 25%;
				
				border-radius: 15px;
				margin: 5% auto;
			}
			#b1{
				
			}
			#header{
				height: 40px;
			}
			#header-right{
				position: absolute;
				width: 25px;
				height: 25px;
				border-radius: 5px;
				background: red;
				color: #fff;
				right: 5px;
				top: 5px;
				text-align: center;
			}
        #all_light { /*整个弹窗的页面*/
            opacity: 0.8; /*透明度*/
            position: absolute;
            top: 0;
            left: 0; /*定位*/
            display: none; /*隐藏*/
            
        }
        #contes { /* 弹框的页面*/
            width: 320px; /*宽度*/
            height: 500px; /*高度*/
            background:#abf;/*背景色*/
            display: none; /*隐藏*/
            z-index: 2; /*覆盖*/
            position: absolute;
            border-radius: 30px;
            top: 60px;
            left: 1130px; /* 定位*/
        }
        input{
            margin-bottom: 10px;
        }
    </style>
</head>

<body>
 <%
 ArrayList stus1=(ArrayList)request.getSession().getAttribute("list4");
 ArrayList newlist=(ArrayList)request.getSession().getAttribute("newlist");
 ArrayList applylist=(ArrayList)request.getSession().getAttribute("applylist");
 ArrayList friendlist=(ArrayList)request.getSession().getAttribute("friendlist");
  Customer cus=(Customer)request.getSession().getAttribute("cus1");
  Customer searchcustomer=(Customer)request.getSession().getAttribute("searchcustomer");
%>
<%!
Tz tz=new Tz();
New systemnew=new New();
Apply apply=new Apply();
Friend friend=new Friend();
%>
  <div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->
    
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
            <div class="navbar-brand-wrapper d-flex justify-content-center">
        <div class="navbar-brand-inner-wrapper d-flex justify-content-between align-items-center w-100">  
          <a class="navbar-brand brand-logo" ><img src="./images/logo.svg" alt="logo"/></a>
          <a class="navbar-brand brand-logo-mini" ><img src="./images/logo-mini.svg" alt="logo"/></a>
          <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
            <span class="mdi mdi-sort-variant"></span>
          </button>
        </div>  
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <ul class="navbar-nav mr-lg-4 w-100">
          <li class="nav-item nav-search d-none d-lg-block w-100">
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text" id="search">
                  <i class="mdi mdi-magnify"></i>
                </span>
              </div>
             
              <input type="text" class="form-control" placeholder="Search now" aria-label="search" aria-describedby="search" name="search">
             
            </div>
          </li>
        </ul>
        <ul class="navbar-nav navbar-nav-right">
          <li class="nav-item dropdown mr-1">
            <a class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center" id="messageDropdown" href="#" data-toggle="dropdown">
              <i class="mdi mdi-message-text mx-0"></i>
              <span class="count"></span>
            </a>
             <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="messageDropdown">
              <p class="mb-0 font-weight-normal float-left dropdown-header">聊天</p>
               <%
							for(int i=0;i<friendlist.size();i++){
								friend=(Friend)friendlist.get(i);
 						   %>
              <a class="dropdown-item" onclick="document.getElementById('form<%=i+4%>').submit();">
                <div class="item-thumbnail" >
                <form action="chat.do" method="post" id="form<%=i+4%>">
                	<input type="hidden" name="account" value=<%=cus.getAccount()%>>
                	<input type="hidden" name="friendaccount" value=<%=friend.getFriendaccount()%>>
                	<input type="hidden" name="friendname" value=<%=friend.getFriendname() %>>
                </form>
                
                    <img src="images/faces/face<%=i+1 %>.jpg" alt="image" class="profile-pic">
                </div>
                <div class="item-content flex-grow">
                  <h6 class="ellipsis font-weight-normal"><%=friend.getFriendname() %>
                  </h6>
                  <p class="font-weight-light small-text text-muted mb-0">
                   
                  </p>
                </div>
              </a>
              <%
							}
              %>            
            </div>
          </li>
          <li class="nav-item dropdown mr-4">
            <a class="nav-link count-indicator dropdown-toggle d-flex align-items-center justify-content-center notification-dropdown" id="notificationDropdown" href="#" data-toggle="dropdown">
              <i class="mdi mdi-bell mx-0"></i>
              <span class="count"></span>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="notificationDropdown">
              <p class="mb-0 font-weight-normal float-left dropdown-header">消息</p>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                  <div class="item-icon bg-success">
                    <i class="mdi mdi-information mx-0"></i>
                  </div>
                </div>
                <div class="item-content">
                  <h6 class="font-weight-normal" onclick="dianwo()">系统消息</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    <%=newlist.size() %>条公告
		
                  </p>
                </div>
              </a>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                  <div class="item-icon bg-warning">
                    <i class="mdi mdi-settings mx-0"></i>
                  </div>
                </div>
                <div class="item-content">
                  <h6 class="font-weight-normal" onclick="dianwo2()">添加好友</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    搜索添加
                  </p>
                </div>
              </a>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                  <div class="item-icon bg-info">
                    <i class="mdi mdi-account-box mx-0"></i>
                  </div>
                </div>
                <div class="item-content">
                  <h6 class="font-weight-normal" onclick="dianwo3()">申请消息</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                   <%=applylist.size() %>条申请
                  </p>
                </div>
              </a>
            </div>
          </li>
          <li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
              <img src="./images/faces/boy.jpg" alt="profile"/>
              <span class="nav-profile-name"><%=cus.getCname() %></span>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
              <a class="dropdown-item"  onclick="add()">
                <i class="mdi mdi-settings text-primary"></i>
                	设置
              </a>
            <a class="dropdown-item" onclick="document.getElementById('form1').submit();">
                <i class="mdi mdi-logout text-primary" ></i>
             	登出 <form  action="logout.do" method="post" id="form1">
　　　　		</form>          
			 </a>
            </div>
          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="mdi mdi-menu"></span>
        </button>
      </div>
    </nav>
    
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
    
      <!-- partial:../../partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
        <li class="nav-item">
            <a class="nav-link" href="menu.jsp">
              <i class="mdi mdi-home menu-icon"></i>
              <span class="menu-title">首页</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link"  href="wdzh.jsp" >
              <i class="mdi mdi-account menu-icon" ></i>
              <span class="menu-title" >账户</span>
            </a>
           
          </li>
          <li class="nav-item">
            <a class="nav-link" href="cunkuan.jsp">
              <i class="mdi mdi-chart-pie menu-icon"></i>
              <span class="menu-title">存款</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="qukuan.jsp">
              <i class="mdi mdi-chart-pie menu-icon"></i>
              <span class="menu-title">取款</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="zzhk.jsp">
              <i class="mdi mdi-file-document-box-outline menu-icon"></i>
              <span class="menu-title">转账汇款</span>
            </a>
          </li>
         
          <li class="nav-item">
            <a class="nav-link" href="tzlc.jsp">
              <i class="mdi mdi-grid-large menu-icon"></i>
              <span class="menu-title">投资理财</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="ejf.jsp">
              <i class="mdi mdi-emoticon menu-icon"></i>
              <span class="menu-title">e缴费</span>
            </a>
          </li>
          
         
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
                    <h2>欢迎查看</h2>
                    <p class="mb-md-0">您的账号收支明细</p>
                  </div>
                  <div class="d-flex">
                    <i class="mdi mdi-home text-muted hover-cursor"></i>
                    <p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;Dashboard&nbsp;/&nbsp;</p>
                    <p class="text-primary mb-0 hover-cursor">Analytics</p>
                  </div>
                </div>
                <div class="d-flex justify-content-between align-items-end flex-wrap">
                  <button type="button" class="btn btn-light bg-white btn-icon mr-3 d-none d-md-block ">
                    <i class="mdi mdi-download text-muted"></i>
                  </button>
                  <button type="button" class="btn btn-light bg-white btn-icon mr-3 mt-2 mt-xl-0">
                    <i class="mdi mdi-clock-outline text-muted"></i>
                  </button>
                  <button type="button" class="btn btn-light bg-white btn-icon mr-3 mt-2 mt-xl-0">
                    <i class="mdi mdi-plus text-muted"></i>
                  </button>
                  <button class="btn btn-primary mt-2 mt-xl-0">下载表单</button>
                </div>
              </div>
            </div>
          </div>
            <div class="row">
            <div class="col-md-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body dashboard-tabs p-0">
                  <ul class="nav nav-tabs px-4" role="tablist">
                    <li class="nav-item">
                      <a class="nav-link active" id="overview-tab" data-toggle="tab" href="#overview" role="tab" aria-controls="overview" aria-selected="true">Overview</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" id="sales-tab" data-toggle="tab" href="#sales" role="tab" aria-controls="sales" aria-selected="false">Sales</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" id="purchases-tab" data-toggle="tab" href="#purchases" role="tab" aria-controls="purchases" aria-selected="false">Purchases</a>
                    </li>
                  </ul>
                  <div class="tab-content py-0 px-0">
                    <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview-tab">
                      <div class="d-flex flex-wrap justify-content-xl-between">
                        <div class="d-none d-xl-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                          <i class="mdi mdi-calendar-heart icon-lg mr-3 text-primary"></i>
                          <div class="d-flex flex-column justify-content-around">
                            <small class="mb-1 text-muted">创建日期</small>
                            <div class="dropdown">
                              <a class="btn btn-secondary dropdown-toggle p-0 bg-transparent border-0 text-dark shadow-none font-weight-medium" href="#" role="button" id="dropdownMenuLinkA" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <h5 class="mb-0 d-inline-block">26 Jul 2020</h5>
                              </a>
                              <div class="dropdown-menu" aria-labelledby="dropdownMenuLinkA">
                                <a class="dropdown-item" href="#">12 Aug 2020</a>
                                <a class="dropdown-item" href="#">22 Sep 2020</a>
                                <a class="dropdown-item" href="#">21 Oct 2020</a>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                          <i class="mdi mdi-currency-usd mr-3 icon-lg text-danger"></i>
                          <div class="d-flex flex-column justify-content-around">
                            <small class="mb-1 text-muted">增加</small>
                            <h5 class="mr-2 mb-0">$577545</h5>
                          </div>
                        </div>
                        <div class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                          <i class="mdi mdi-eye mr-3 icon-lg text-success"></i>
                          <div class="d-flex flex-column justify-content-around">
                            <small class="mb-1 text-muted">查看</small>
                            <h5 class="mr-2 mb-0">550</h5>
                          </div>
                        </div>
                        <div class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                          <i class="mdi mdi-download mr-3 icon-lg text-warning"></i>
                          <div class="d-flex flex-column justify-content-around">
                            <small class="mb-1 text-muted">Downloads</small>
                            <h5 class="mr-2 mb-0">2233783</h5>
                          </div>
                        </div>
                        <div class="d-flex py-3 border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                          <i class="mdi mdi-flag mr-3 icon-lg text-danger"></i>
                          <div class="d-flex flex-column justify-content-around">
                            <small class="mb-1 text-muted">Flagged</small>
                            <h5 class="mr-2 mb-0">3497843</h5>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="tab-pane fade" id="sales" role="tabpanel" aria-labelledby="sales-tab">
                      <div class="d-flex flex-wrap justify-content-xl-between">
                        <div class="d-none d-xl-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                          <i class="mdi mdi-calendar-heart icon-lg mr-3 text-primary"></i>
                          <div class="d-flex flex-column justify-content-around">
                            <small class="mb-1 text-muted">Start date</small>
                            <div class="dropdown">
                              <a class="btn btn-secondary dropdown-toggle p-0 bg-transparent border-0 text-dark shadow-none font-weight-medium" href="#" role="button" id="dropdownMenuLinkA" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <h5 class="mb-0 d-inline-block">26 Jul 2018</h5>
                              </a>
                              <div class="dropdown-menu" aria-labelledby="dropdownMenuLinkA">
                                <a class="dropdown-item" href="#">12 Aug 2018</a>
                                <a class="dropdown-item" href="#">22 Sep 2018</a>
                                <a class="dropdown-item" href="#">21 Oct 2018</a>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                          <i class="mdi mdi-download mr-3 icon-lg text-warning"></i>
                          <div class="d-flex flex-column justify-content-around">
                            <small class="mb-1 text-muted">Downloads</small>
                            <h5 class="mr-2 mb-0">2233783</h5>
                          </div>
                        </div>
                        <div class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                          <i class="mdi mdi-eye mr-3 icon-lg text-success"></i>
                          <div class="d-flex flex-column justify-content-around">
                            <small class="mb-1 text-muted">Total views</small>
                            <h5 class="mr-2 mb-0">9833550</h5>
                          </div>
                        </div>
                        <div class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                          <i class="mdi mdi-currency-usd mr-3 icon-lg text-danger"></i>
                          <div class="d-flex flex-column justify-content-around">
                            <small class="mb-1 text-muted">Revenue</small>
                            <h5 class="mr-2 mb-0">$577545</h5>
                          </div>
                        </div>
                        <div class="d-flex py-3 border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                          <i class="mdi mdi-flag mr-3 icon-lg text-danger"></i>
                          <div class="d-flex flex-column justify-content-around">
                            <small class="mb-1 text-muted">Flagged</small>
                            <h5 class="mr-2 mb-0">3497843</h5>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="tab-pane fade" id="purchases" role="tabpanel" aria-labelledby="purchases-tab">
                      <div class="d-flex flex-wrap justify-content-xl-between">
                        <div class="d-none d-xl-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                          <i class="mdi mdi-calendar-heart icon-lg mr-3 text-primary"></i>
                          <div class="d-flex flex-column justify-content-around">
                            <small class="mb-1 text-muted">Start date</small>
                            <div class="dropdown">
                              <a class="btn btn-secondary dropdown-toggle p-0 bg-transparent border-0 text-dark shadow-none font-weight-medium" href="#" role="button" id="dropdownMenuLinkA" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <h5 class="mb-0 d-inline-block">26 Jul 2018</h5>
                              </a>
                              <div class="dropdown-menu" aria-labelledby="dropdownMenuLinkA">
                                <a class="dropdown-item" href="#">12 Aug 2018</a>
                                <a class="dropdown-item" href="#">22 Sep 2018</a>
                                <a class="dropdown-item" href="#">21 Oct 2018</a>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                          <i class="mdi mdi-currency-usd mr-3 icon-lg text-danger"></i>
                          <div class="d-flex flex-column justify-content-around">
                            <small class="mb-1 text-muted">Revenue</small>
                            <h5 class="mr-2 mb-0">$577545</h5>
                          </div>
                        </div>
                        <div class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                          <i class="mdi mdi-eye mr-3 icon-lg text-success"></i>
                          <div class="d-flex flex-column justify-content-around">
                            <small class="mb-1 text-muted">Total views</small>
                            <h5 class="mr-2 mb-0">9833550</h5>
                          </div>
                        </div>
                        <div class="d-flex border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
                          <i class="mdi mdi-download mr-3 icon-lg text-warning"></i>
                          <div class="d-flex flex-column justify-content-around">
                            <small class="mb-1 text-muted">下载表单</small>
                            <h5 class="mr-2 mb-0">2233783</h5>
                          </div>
                        </div>
                        <div class="d-flex py-3 border-md-right flex-grow-1 align-items-center justify-content-center p-3 item">
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
            <div class="col-md-7 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-title">资金情况</p>
                  
                  <div id="cash-deposits-chart-legend" class="d-flex justify-content-center pt-3"></div>
                  <canvas id="cash-deposits-chart"></canvas>
                </div>
              </div>
            </div>
            <div class="col-md-5 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-title">历年对比</p>
                  <h1>$ 28835</h1>
                  <h4>多年来的资金总额</h4>
                  <p class="text-muted"> </p>
                  <div id="total-sales-chart-legend"></div>                  
                </div>
                <canvas id="total-sales-chart"></canvas>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12 stretch-card">
              <div class="card">
                <div class="card-body">
                  <p class="card-title">可投资工作室</p>
                  <div class="table-responsive">
                    <table id="recent-purchases-listing" class="table">
                      <thead>
                        <tr>
                            <th>创始人</th>
                            <th>状态</th>
                            <th>工作室</th>
                            <th>创建日期</th>
                            <th>价格</th>  
                            <th>
              						<span >投资</span>          						
         					 </th>
                        </tr>
                      </thead>
                         <tbody>
                      
       
                          <%
							for(int i=0;i<stus1.size();i++){
								tz=(Tz)stus1.get(i);
 						   %>
							<tr>
                            <th><%=tz.getName() %></th>
                            <th><%=tz.getStatus() %></th>
                            <th><%=tz.getOffice() %></th>
                            <th><%=tz.getDate() %></th>
                     	    <th><%=tz.getPrice() %></th>
                            <th>                      
                             <li>
           						 <a href="buy.jsp?name=<%=tz.getName() %>&office=<%=tz.getOffice() %>&price=<%=tz.getPrice() %>&status=<%=tz.getStatus() %>&date=<%=tz.getDate() %>">
              						<span >投资</span>
           						 </a>
         					 </li> 
         					 </th>
                        </tr>
                      	  <%
								}
							%>         
                      </tbody>
                       
                      
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
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
  <div id="contes" class="col-lg-12 grid-margin stretch-card" style="">
    <div style="width:300px;height:40px;">
     
        <hr>
         <html:form action="/edit" method="post">
               <div class="form-group">
		  <h4 class="card-title">修改信息</h4>
                  <input type="hidden" class="form-control form-control-lg" id="exampleInputEmail1"  name="account" value=<%=cus.getAccount() %> >
                </div>
               密码
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="exampleInputEmail1" name="password" value=<%=cus.getPassword() %> pattern="[0-9]{6}" title="请输入6位数字">
                </div>
                用户名
                 <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="exampleInputEmail1"  name="cname" value=<%=cus.getCname() %>>
                </div>
                邮箱
              <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="exampleInputEmail1"  name="email" value=<%=cus.getEmail() %>>
                </div>
                 <input type="hidden" class="form-control form-control-lg" id="exampleInputEmail1"  name="cbalance" value=<%=cus.getCbalance() %>>
                <div class="mt-3" >
                <input class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" type="submit" value="确定修改">
                 <li class="nav-item">
            <a class="nav-link" href="menu.jsp">
             <i class="mdi mdi-logout text-primary" ></i>
              <span >取消</span>
            </a>
            
          </li>
                </div>
              </html:form>
    </div>
</div>
<div class="zhezhao" id='zhezhao'>
			<div class="tankuang">
				<div id="header">
			
					 <table id="recent-purchases-listing" class="table">
                  
                         <tbody>
                      
       
                          <%
							for(int i=0;i<newlist.size();i++){
								systemnew=(New)newlist.get(i);
 						   %>
							<tr>
                            <th><span>发布时间：<%=systemnew.getTime() %></span></th>
                            </tr>
                            <tr>
                            <th><span><%=systemnew.getText() %><br>
                            <HR style="FILTER: progid:DXImageTransform.Microsoft.Glow(color=#987cb9,strength=10)" width="80%" color=#987cb9 SIZE=1>
                            </span></th>
                             </tr>
                          
                      	  <%
								}
							%>    
							     
                      </tbody>
                       
                      
                    </table>
					<div id="header-right" onclick="hidder()">x</div>
				</div>
			</div>
		</div>
		<div class="zhezhao" id='zhezhao2' >
			<div class="tankuang">
				<div id="header">
	
					<div id="header-right" onclick="hidder2()">x</div>
					 <ul class="navbar-nav mr-lg-4 w-100">
					 <span style="padding-left: 50px;padding-top: 20px;"><h6></h6></span>
	 <div style="padding-left: 5px;padding-top: 20px;">
         <html:form action="/searchmenu" method="post">
            <li class="nav-item nav-search d-none d-lg-block w-100">
              <div class="input-group" style="
          width: 300px;
          padding-left: 22px;
          border:2px;
      ">
                <div class="input-group-prepend" style="left: 275px;position: relative;">
                  <button class="input-group-text" id="search">
                    <i class="mdi mdi-magnify"></i>
                  </button>
                </div >
                <input type="text" class="form-control" placeholder="账号搜索" aria-label="search" aria-describedby="search" name="account" >
              </div>
            </li>
          </html:form>
          </div>
        </ul>
        <div class="form-group">
       
              </div>
				</div>
			</div>
		</div>
		<div class="zhezhao" id='zhezhao3' >
			<div class="tankuang2">
				
	
	<div id="header-right" onclick="hidder3()">x</div>
	<div style="padding:20px;">
	<table>
	<%
		for(int i=0;i<applylist.size();i++){
			apply=(Apply)applylist.get(i);
	   %>

        <tr>
		<td><ul class="navbar-nav navbar-nav-right">
          <li class="nav-item dropdown mr-1">
           
             <div  aria-labelledby="messageDropdown">
         
              <a class="dropdown-item">
                <div class="item-content flex-grow">
                  <h6 class="ellipsis font-weight-normal"><%=apply.getSender() %>
                  </h6>
                  <p class="font-weight-light small-text text-muted mb-0">
                    <%=apply.getMessage() %>
                  </p>
                </div>
              </a>
            </div>
          </li>
        </ul>
        </td>
        <td>
          
        </td>
        <td width="20%">
         <form action="agree.do" method="post" id="form2">
         <input type="hidden" name="sender" value=<%=apply.getSender() %>>
          <input type="hidden" name="receiver" value=<%=apply.getReceiver() %>>
           <input type="hidden" name="sendername" value=<%=apply.getSendername() %>>
           <input type="hidden" name="receivername" value=<%=cus.getCname()%>>
         </form>
        	<button type="button" class="btn btn-primary btn-sm" onclick="document.getElementById('form2').submit();">
        		同意
        	</button>
        </td>
        </tr>
        <%
		}
        %>
        </table>
        </div>
				
			</div>
		</div>
		<script type="text/javascript">
			document.getElementById('zhezhao').style.display="none";
			document.getElementById('zhezhao2').style.display="none";
			document.getElementById('zhezhao3').style.display="none";
			function dianwo(){
				document.getElementById('zhezhao').style.display="";
			}
			function hidder(){
				document.getElementById('zhezhao').style.display="none";
			}
			document.getElementById('zhezhao').style.display="none";
			function dianwo2(){
				document.getElementById('zhezhao2').style.display="";
			}
			function hidder2(){
				document.getElementById('zhezhao2').style.display="none";
			}
			function dianwo3(){
				document.getElementById('zhezhao3').style.display="";
			}
			function hidder3(){
				document.getElementById('zhezhao3').style.display="none";
			}
		</script>

<div id="all_light">
</div>

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

