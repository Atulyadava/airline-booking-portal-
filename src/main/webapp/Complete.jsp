<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<%int M=0; %>
<%
String id=session.getAttribute("Id").toString();
%>
<%
String name=session.getAttribute("Name").toString();
%>
<%
String persons=session.getAttribute("SEATS").toString();
%>
<%
String date=session.getAttribute("Date").toString();
%>
<%
String from=session.getAttribute("From").toString();
%>
<%
String to=session.getAttribute("To").toString();
%>
<%
int a=(Integer)session.getAttribute("Amount");
 %>
 <%
String sid=session.getAttribute("Nbid").toString();
%>
<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/fligh","root","Atulyadav123@");
	PreparedStatement pst=con.prepareStatement("insert into TicketBooked values(?,?,?,?,?,?)");
	pst.setString(1, id);
	pst.setString(2, name);
	pst.setString(3, persons);
	pst.setString(4, date);
	pst.setString(5, from);
	pst.setString(6, to);
	pst.execute();
	pst.close();
	Statement st=con.createStatement();
	ResultSet res=st.executeQuery("select * from  pessbankaccount where NetBankingId='"+sid+"'");
	while(res.next()){
		String R=res.getString(1);
		 M=res.getInt(5);
	}
	int d=M-a;
	PreparedStatement pst1=con.prepareStatement("update pessbankaccount set TotalAmount=? where NetBankingId=?");
	pst1.setInt(1, d);
	pst1.setString(2,sid);
	pst1.execute();
	st.close();
	
	con.close();
out.print("<h3 style='color:green'> congratulation.. you tickets are booked!!!!</h3>");	
out.print("******Thank you for using Our Application****");
	
}catch(Exception e){
	System.out.println(e);
}
%>
</center>
</body>
</html>