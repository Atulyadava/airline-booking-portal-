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
String uName=request.getParameter("userName");
String NewPass=request.getParameter("upassword");
%>
<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/fligh","root","Atulyadav123@");
	PreparedStatement pst=con.prepareStatement("update login set Password=? where `User name`=?");
	pst.setString(1, NewPass);
	pst.setString(2,uName);
	pst.execute();
	pst.close();	
	con.close();
	out.print("<h3 style='color:green'> congratulation.. your Passwprd has been changed !!!!</h3>");
	out.print(" click here for <a href=Login.html>login</a> again with new password");
	
}catch(Exception e){
	System.out.println(e);
}
%>
</body>
</html>