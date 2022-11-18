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
String NBID=request.getParameter("NetBankingId");%>
<%
session.setAttribute("Nbid",NBID);
%><% 
String Pass=request.getParameter("uPassword");
%>
<% String TicketMony=request.getParameter("upayment");
//int TicketPrice=Integer.parseInt(TicketMony);
%>
<%String FlightId = session.getAttribute("Id").toString(); %>
<%int us =(Integer) session.getAttribute("Amount");%>

<%
	
try {
	Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/fligh","root","Atulyadav123@");
Statement stmt=con.createStatement();
ResultSet	rs=stmt.executeQuery("select * from pessbankaccount");
while(rs.next())
{		
if(NBID.equals(rs.getString(1)) && Pass.equals(rs.getString(2)))
	{
		RequestDispatcher rd= request.getRequestDispatcher("TakeAmount.html");
		rd.forward(request, response);
	}else {
		out.print("<h5 style='color:red'>Sorry InValid Credentials....!</h5>");
		RequestDispatcher rd=request.getRequestDispatcher("Payment.jsp");
		rd.include(request, response);		
	}  }	 
stmt.close();
con.close();

} catch (Exception e) {
	System.err.println(e);	}	
%>
</body>
</html>