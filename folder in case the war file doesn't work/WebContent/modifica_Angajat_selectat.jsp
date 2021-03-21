<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga Angajat</title>
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
input[type=number] {

width:120px;
  padding: 12px 12px;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 10px;
  background-color: #f8f8f8;
  font-size: 16px;
  resize: none;
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
            String Nume = request.getParameter("Nume");
            String IdAngajat=request.getParameter("primarykey");
            //if(Nume!= null && !Nume.isEmpty()){
            if (Nume != null) {
            	String Prenume = request.getParameter("Prenume");
            	String Functie = request.getParameter("Functie");
            	int Experienta = Integer.parseInt(request.getParameter("Experienta"));
            	float Salariu= Float.parseFloat(request.getParameter("Salariu"));
                jb.connect();
                String[] campuri={"nume","prenume","functie","experienta","salariu"};
                String[] valori={Nume,Prenume,Functie,String.valueOf(Experienta),String.valueOf(Salariu)};
                jb.modificaTabela("angajati","idangajat", Integer.parseInt (IdAngajat),campuri,valori);
                jb.disconnect();
        %>
        <h1 style="color:blue;" >Ati modificat un angajat.</h1><%
        } else {
        
       jb.connect();
       ResultSet rsAngajat = jb.intoarceLinieDupaId("angajati","idangajat",Integer.parseInt(IdAngajat));
       rsAngajat.next();
       %>
        <h2 style="color:red;"> Va rugam introduceti datele corect!</h2>
        <form action="modifica_Angajat_selectat.jsp" method="post">
           
           <label >Nume:</label><br>
           <input type="text" name="Nume" size="30" value="<%=rsAngajat.getString("nume")%>"/><br>
           <label >Prenume:</label><br>
           <input type="text" name="Prenume" size="30" value="<%=rsAngajat.getString("prenume")%>"/><br>
           <label >Functie:</label><br>
           <input type="text" name="Functie" size="30" value="<%=rsAngajat.getString("functie")%>"/><br>
           <label >Experienta [ani]:</label><br>
           <input type="number" name="Experienta" size="30" value="<%=rsAngajat.getInt("experienta")%>"/><br>
           <label >Salariu [$]:</label><br>
           <input type="number" name="Salariu" size="30" value="<%=rsAngajat.getInt("salariu")%>"/><br>
           <br>
           <input type="hidden" name="primarykey" value="<%=IdAngajat%>"></input>
            <input type="submit" value="Adauga" />
             <input type="reset"/>
        </form>
        <%
        rsAngajat.close();
        jb.disconnect();
        }
        %>
        
    </body>
</html>
