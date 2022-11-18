<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration page</title>
</head>
<body bgcolor="yellow">
<center>
<%
	String FlightId=request.getParameter("flightId");
	String Name=request.getParameter("uname");
	String Age=request.getParameter("uage");
	String Address=request.getParameter("uAddress");
	String Phone=request.getParameter("uphone");
	String Aadhar=request.getParameter("uAadhar");
	String Seats=request.getParameter("useats");
	int Money=Integer.parseInt(Seats);
	%>
	<%
    session.setAttribute("Id", FlightId);
        %>
        <%
    session.setAttribute("Name", Name);
        %>
        <%
    session.setAttribute("SEATS", Seats);
        %>
	<% 
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/fligh","root","Atulyadav123@");
		PreparedStatement pst=con.prepareStatement("insert into registration values(?,?,?,?,?,?,?)");
		pst.setString(1,null);
		pst.setString(2,Name);
		pst.setString(3,Age);
		pst.setString(4, Address);
		pst.setString(5,Phone);
		pst.setString(6, Aadhar);
		pst.setString(7, FlightId);
		pst.execute();
		pst.close();
		
		out.print("<h2 style='color:green'>registation completed please complete your payment</h2>");
		out.print("<br>");
		Statement st=con.createStatement();
		ResultSet res=st.executeQuery("select * from flight where id='"+FlightId+"' ") ;		
		while(res.next()){%><% 
			int Amount=(Money)*res.getInt(7);%>
			 <%
             session.setAttribute("Amount", Amount);
             %><% 
			out.print("<h3 style='color:red'>here is your flight details</h3>");
			out.print("Flight Id :"+res.getInt(1)+" <br> "+"Flight Name :"+res.getString(2)+" <br> "+"Trip :"+res.getString(3)
        	+" -To- "+res.getString(4)+" <br> "+" Date : "+res.getDate(5)+" <br> "+" Time : "+res.getTime(6)+" <br> "+" price of "+
					Seats +" tickets := "+(Money)*res.getInt(7));
			out.print("<br>");
		}	
		out.print("<br>");
		out.print("<form action='Payment.jsp'><br><input type='submit' value='Payment Process'></form>");
		
		con.close();
	}catch(Exception e){
		System.err.println(e);
	}

%>

</center>
</body>
</html>