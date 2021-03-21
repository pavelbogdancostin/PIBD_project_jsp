<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Adauga Review</title>
   <style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #111;
}
body {
  background-color: #FFFAF0;
}
input[type=text] {
  width: 100%;
  height: 50px;
  padding: 12px 30px;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 10px;
  background-color: #f8f8f8;
  font-size: 16px;
  resize: none;
}
input[type=date]{
width:180px;
  padding: 12px 30px;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 10px;
  background-color: #f8f8f8;
  
}
input[type=submit] {
  background-color: #1E90FF;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #87CEFA;
}
input[type=reset] {
  background-color: #1E90FF;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=reset]:hover {
  background-color: #87CEFA;
}
label{
color:#000080;
font-weight: bold;
width: 200px;
float: left;
}

</style>
    </head>
    <body>
        
<ul>
	<li><a href="index.html"><strong>Home</strong></a> </li>
	<li><a href="tabela_Angajati.jsp"><strong>Angajati</strong></a> </li>
	<li> <a href="tabela_Reviewuri.jsp"><strong>Reviewuri</strong></a> </li>
	<li> <a href="tabela_Sarcina.jsp"><strong>Sarcini</strong></a> </li>
</ul>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            //int Rating = Integer.parseInt(request.getParameter("Rating"));
            	String Comentariu = request.getParameter("Comentariu");
                
            	if (Comentariu != null) {
            	int Rating = Integer.parseInt(request.getParameter("Rating"));
            	String Data = request.getParameter("Data");
                jb.connect();
                jb.adaugaReview(Rating, Comentariu ,Data);
                jb.disconnect();
        %>
        <h1 style="color:blue;" >Ati adaugat un review.</h1><%
        } else { 
        jb.connect();
        ResultSet rs1 = jb.vedeTabela("angajati");
        %>
        <h2 style="color:red;"> Va rugam fiti sinceri!</h2>
        <form action="nou_Review.jsp" method="post">
            <div align="left">
            
            <label >Rating Review:</label><br>
            <select name="Rating">
                    <option value="1">1 </option>
                    <option  value="2">2 </option>
                    <option value="3">3 </option>
                    <option value="4">4 </option>
                    <option value="5">5 </option> 
            </select>
            
           
            <br>
            
             <label >Comentariu Review:</label><br>  
             <input  type="text" name="Comentariu"  /><br>  
            
             <label >Data:</label><br>  
             <input type="date" name="Data" size="30" /><br>  
            <br>
            <input type="submit" value="Adauga" />
            <input type="reset"/>
        </form>
        <%
            }
        %>
        
    </body>
</html>
