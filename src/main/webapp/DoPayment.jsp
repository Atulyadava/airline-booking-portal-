<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
    String InputAmount= request.getParameter("dAmount");
    %><%int I=Integer.parseInt(InputAmount); %>
 <%
int a=(Integer)session.getAttribute("Amount");
 %><%
 if(I==a){
	 RequestDispatcher rd=request.getRequestDispatcher("Complete.jsp");
	 rd.forward(request, response);
 }
 else{ 
	 out.print(" click here for Enter <a href=TakeAmount.html>amount</a> again");  
 }
 %>
</body>
</html>