<%@ page import="jdbc.ConnectorDB" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: yayayaka
  Date: 30-Mar-19
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Find By Name...</title>
    <link rel="stylesheet" href="use.css" type="text/css">
    <link rel="script" href="use.js">
</head>
<body>
<table align="center">
    <tr>
        <td class="a"><a href="index.jsp">Show All Employees</a></td>
        <td class="a"><a href="FindById.jsp">Find Employee By Id</a></td>
    </tr>
</table>
<div align="center">
    <form method="post" action="FindByName.jsp" name="findByName">
        <table align="center">
            <tr>
                <th colspan="3"><h4>Find Employee By Name</h4></th>
            </tr>
            <tr>
                <td class="td">Id</td>
                <td class="td"><input type="text" name="inputName" value="Searching Name..."
                                      onblur="if(document.findByName.inputName.value == '') document.findByName.inputName.value = 'Searching Name...'"
                                      onfocus="if(document.findByName.inputName.value == 'Searching Name...')document.findByName.inputName.value = ''"></td>
                <td class="td"><input class="button" type="submit" name="submitButton" value="Search"></td>
            </tr>
            <tr>
                <td class="td-bottom" colspan="3">&nbsp;</td>
            </tr>
        </table>
    </form>
    <table align="center">
        <%
            String stringName = request.getParameter("inputName");
            if (stringName == null || stringName.length() == 0) {
                return;
            }
            try(ConnectorDB connector = new ConnectorDB()) {
            Connection connection = connector.getConnection();
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT emp1.empno, emp1.ename, emp1.job, NVL(emp2.ename, 'GOD'), " +
                    "       emp1.hiredate, emp1.sal, NVL(emp1.comm, 0), emp1.deptno " +
                    "FROM emp emp1 " +
                    "JOIN emp emp2 ON emp1.mgr = emp2.empno(+) " +
                    "WHERE emp1.ename = ? ");
            statement.setString(1, stringName);
            statement.execute();
            %>
        <tr><th colspan="8"><h4>Searching Results</h4></th></tr>
        <tr>
        <td class="th">Emp#</td>
        <td class="th">Name</td>
        <td class="th">Job</td>
        <td class="th">Manager</td>
        <td class="th">Hiredate</td>
        <td class="th">Salary</td>
        <td class="th">Commission</td>
        <td class="th">Department No</td>
        </tr>
    <%
            ResultSet result = statement.getResultSet();
            while (result.next()) {
        %><tr><%
        for (int pointer = 1; pointer <= 8; pointer++) {
    %><td class="td"><%=result.getString(pointer)%></td><%
        }
    %></tr><%
        }
        }
        %>
        <tr><td class="td-bottom"colspan="8">&nbsp;</td></tr>
    </table>
</div>
</body>
</html>
