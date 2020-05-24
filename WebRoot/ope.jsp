<%@ page language="java" pageEncoding="GB18030"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<html> 
	<head>
		<title>Vi</title>
	</head>
	<body>
		欢迎<bean:write name="cus1" property="cname"/>来到银行;
		您的余额是<bean:write name="cus1" property="cbalance"/>元!!
		<HR>
		<html:link page="/cunkuan.jsp">存款</html:link><BR>
		<html:link page="/qukuan.jsp">取款</html:link><BR>
		<html:link page="/menu.jsp">退出</html:link><BR>
	</body>
</html>