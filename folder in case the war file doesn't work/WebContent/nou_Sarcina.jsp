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
float: left;}
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
            int idangajat, idreview,Rating,Experienta;
        float Salariu;
            String id1, id2, NumeAngajat, PrenumeAngajat, Functie, Comentariu, Data, Sarcina, Dificultate;
            id1 = request.getParameter("idangajat");
            id2 = request.getParameter("idreview");
            Sarcina = request.getParameter("Sarcina");
            Dificultate = request.getParameter("Dificultate");
            
            if (id1 != null) {
                jb.connect();
                jb.adaugaSarcina(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2), Sarcina, Dificultate);
                jb.disconnect();
        %>
        <h1 style="color:blue;" >Datele au fost adaugate.</h1><%
        } else {
        jb.connect();
        ResultSet rs1 = jb.vedeTabela("angajati");
        ResultSet rs2 = jb.vedeTabela("reviewuri");
        %>
        
        <form action="nou_Sarcina.jsp" method="post">
           <table>
                <tr>
                    <td align="right"><b>Angajat</b></td>
                   <td>           
			<select name="idangajat">
                                <%
                                    while(rs1.next()){
                                    	idangajat = rs1.getInt("idangajat");
                                        NumeAngajat = rs1.getString("Nume");
                                        PrenumeAngajat = rs1.getString("Prenume");
                                        Functie = rs1.getString("Functie");
                                        Experienta = rs1.getInt("Experienta");
                                        Salariu = rs1.getFloat("Salariu");
                                %>
                                    <OPTION value="<%= idangajat%>"><%= NumeAngajat%>-<%=PrenumeAngajat%>-<%=Functie%></OPTION>
                                <%
                                    }
                                %>
			</select>
                   </td>             
                </tr>
                <tr>
                    <td align="right"><b>Review</b></td>
                    
                   
                <td>      
			<select name="idreview">
				<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
                                <%
                                    while(rs2.next()){
                                    	idreview = rs2.getInt("idreview");
                                    	Rating = rs2.getInt("Rating");
                                    	Comentariu = rs2.getString("Comentariu");
                                        Data= rs2.getString("Data");
                                %>
                                    <OPTION VALUE="<%= idreview%>">Rating:<%= Rating%>(<%=Data%>)</OPTION>
                                <%
                                    }
                                %>
			</select>
               </td>
                </tr>
                <tr>
                    
                    <td align="right"><b>Sarcina</b></td>
                    <td><input type="text" name="Sarcina" size="30" /><td>
                 </tr>
                 <tr>   
                    <td align="right"><b>Dificultate</b></td>
                     <td><input type="text" name="Dificultate" size="30" /></td>
                </tr>
               </table>    
               <p align="center">     
            <input type="submit" value="Adauga" />
            <input type="reset"/>
            </p>
        </form>
        <%
            }
        %>
        
    </body>
</html>
