<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga sarcina</title>
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
input[type=text] {
  padding: 12px 30px;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 10px;
  background-color: #f8f8f8;
  font-size: 16px;
  resize: none;
}
table{
margin:0 auto;}    
td{
color:#000080;
font-weight: bold;
width: 200px;
float: left;
}
.style{
color:#000080;
font-weight: bold;
width: 200px;

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
    <br>
    <body>
        <%
            String Sarcina, Dificultate;
            Sarcina = request.getParameter("Sarcina");
            Dificultate = request.getParameter("Dificultate");
            
            String IdSarcina=request.getParameter("primarykey");
            
            if (Sarcina != null) {
                jb.connect();
                String[] campuri={"sarcina","dificultate"};
                String[] valori={Sarcina, Dificultate};
                jb.modificaTabela("sarcini","idsarcina",Integer.parseInt(IdSarcina),campuri, valori);
                jb.disconnect();
        %>
        <h1 style="color:blue;" >Datele au fost adaugate.</h1><%
        } else {
        jb.connect();
        ResultSet rsSarcina = jb.intoarceLinieDupaId("sarcini","idsarcina",Integer.parseInt(IdSarcina));
        rsSarcina.next();
        ResultSet rsAngajat = jb.intoarceLinieDupaId("angajati", "idangajat", rsSarcina.getInt("idangajat"));
        rsAngajat.next();
        %>
        
        <form action="modificare_Sarcina_selectat.jsp" method="post">
           <table>
               
                <h1 align="center" style="color:blue;"> Modificati pentru:</h1>
             <div align="center" >
             <h3 class="style">Nume:<%=rsAngajat.getString("nume") %></h3>
             
             </div>
             <div align="center" ><h3 class="style">Prenume:<%=rsAngajat.getString("prenume") %></h3></div>
                <tr>
                    
                    <td align="right"><b>Sarcina</b></td>
                    <td><input type="text" name="Sarcina" size="30" value="<%=rsSarcina.getString("sarcina")%>"/><td>
                 </tr>
                 <tr>   
                    <td align="right"><b>Dificultate</b></td>
                     <td><input type="text" name="Dificultate" size="30" value="<%=rsSarcina.getString("dificultate")%>"/></td>
                </tr>
               </table>    
               <p align="center">   
               <input type="hidden" name="primarykey" value="<%=IdSarcina%>" />  
            <input type="submit" value="Adauga" />
            <input type="reset"/>
            </p>
        </form>
        <%
            }
        %>
        
    </body>
</html>
