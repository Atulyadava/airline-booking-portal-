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
		String uname=request.getParameter("uname");
		String upass=request.getParameter("upass");	
		try {
			Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/fligh","root","Atulyadav123@");
		Statement stmt=con.createStatement();
	 ResultSet	rs=stmt.executeQuery("select * from login");
	 while(rs.next())
	 {		
		if(uname.equalsIgnoreCase(rs.getString(1)) && upass.equalsIgnoreCase(rs.getString(2)))
			{
				RequestDispatcher rd= request.getRequestDispatcher("Welcomepage.html");
				rd.forward(request, response);
			}else {
				out.print("<h5 style='color:red'>Sorry InValid Credentials....!</h5>");
				RequestDispatcher rd=request.getRequestDispatcher("Login.html");
				rd.include(request, response);		
			}  }	 
		stmt.close();
		con.close();
		
		} catch (Exception e) {
			System.err.println(e);	}
		%>

</body>
</html>