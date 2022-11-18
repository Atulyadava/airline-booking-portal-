<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor=yellow>
<h1>Available flights for your trip </h1>
	<%	
	String from = request.getParameter("fromcity");
	String to = request.getParameter("tocity");
	String d= request.getParameter("udate");
	String t= request.getParameter("utime");%>
	<%
    session.setAttribute("Date", d);
        %>
        <%
    session.setAttribute("From", from);
        %>
        <%
    session.setAttribute("To", to);
        %>
	
	<% 
	try {
		  Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/fligh","root","Atulyadav123@");
		Statement st=con.createStatement();
        ResultSet res=st.executeQuery("select * from flight where fromcity='"+from+"' and tocity='"+to +"'");
        while(res.next())
        {
        	out.print("Flight Id "+res.getInt(1)+" : "+"Flight Name "+res.getString(2)+" : "+res.getString(3)
        	+" -To- "+res.getString(4)+" : "+" Date "+res.getDate(5)+" : "+" Time "+res.getTime(6)+" : "+" price of one ticket: "+res.getInt(7));
        	out.print("<form action='register.html'><input type='submit' value='booking'></form>");
        	out.print("<br>");	
        	
        }
	     out.print("Click hear to go to <a href='Homepage.html'>Home page </a>");
		st.close(); 
		
		con.close();
	} catch (Exception e) {
		System.out.println(e);
	}

	%>
<form action="register.html"></form>	
</body>
</html>