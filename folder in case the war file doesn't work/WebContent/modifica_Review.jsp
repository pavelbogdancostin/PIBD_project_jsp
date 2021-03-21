<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Tabela Reviewuri</title>
    <style>
    * {
  box-sizing: border-box;
}

/* Create two unequal columns that floats next to each other */
.column {
  float: left;
  padding: 10px;
  
}

.left {
  width: 25%;
}

.right {
  width: 75%;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}
body {
  background-color: #FFFAF0;
}
    img {
  border-radius: 10px;
}
 .btn-group .button {
  background-color: #1E90FF; /* Green */
  border: 1px solid;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  cursor: pointer;
  float: left;
  border-radius: 4px;}
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
table { 
  
  border-collapse: collapse;
  width: 50%;
}

 th,td {
  text-align: left;
  padding: 8px;
}

td {
  background-color:#1E90FF ; 
  color: black;
  }
th {
  background-color: #F5F5F5;
  color: black;
}
table.center {
  margin-left: 30%; 
  margin-right: 30%;
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
.style{
color:red;
text-align:center;
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
    <div class="row">
    
  <div class="column left" >
<img src="E:/ETTI/ETTI an 3/PIBD/Reviews.jpg"  width="245" height="150">
  <div class="btn-group">
        
       <a href="nou_Review.jsp" class="button"><b>Adauga</b></a> 
        
    
       </div>
 </div>   
     <div class="column right" > 
     <h1 class="style">Selectati pentru a modifica</h1>
        <form action="modifica_Review_selectat.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b></b></td>
                    <td><b>Id</b></td>
                    <td><b>Rating:</b></td>
                    <td><b>Comentariu:</b></td>
                    <td><b>Data:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("reviewuri");
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idreview");
                %>
                <tr>
                    <th><input type="radio" name="primarykey" value="<%= x%>" /></th>
                    <th><%= x%></th>
                    <th><%= rs.getInt("Rating")%></th>
                    <th><%= rs.getString("Comentariu")%></th>
                    <th><%= rs.getDate("Data")%></th>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" value="Modifica">
                <input type="reset"/>
            </p>
        </form>
        </div>
       </div>
        <%
    jb.disconnect();%>
        
    </body>
</html>
