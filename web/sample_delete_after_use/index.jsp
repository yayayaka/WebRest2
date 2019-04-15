<%--<%@ page import="jdbc.ConnectorDB" %>--%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %><%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="errorPage.jsp" %>
<html>
  <head>
    <title></title>
      <link rel="stylesheet" type="text/css" href="use.css">
  </head>
  <body>
  <table align="center">
    <tr>
      <td class="a"><a href="FindById.jsp">Find Employee By Id</a></td>
      <td class="a"><a href="FindByName.jsp">Find Employee By Name</a></td>
    </tr>
  </table>
  <table align="center">
    <tr><th colspan="8" class="th"><h4>Employee table</h4></th></tr>
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
//  try (ConnectorDB connector = new ConnectorDB()) {
//  Connection connection = connector.getConnection();
//  Statement statement = connection.createStatement();
//  statement.execute("" +
//            "SELECT emp1.empno, emp1.ename, emp1.job, NVL(emp2.ename, 'GOD'), " +
//            "       emp1.hiredate, emp1.sal, NVL(emp1.comm, 0), emp1.deptno " +
//            "FROM emp emp1 " +
//            "JOIN emp emp2 ON emp1.mgr = emp2.empno(+) ");
//  ResultSet result = statement.getResultSet();
//  while (result.next()) {
      <%--%><tr><%--%>
    <%--for (int pointer = 1; pointer <= 8; pointer++) {--%>
        <%--%><td class="td"><%=result.getString(pointer)%></td><%--%>
    <%--}--%>
      <%--%></tr><%--%>
  <%--}--%>
    <%--}--%>
%>
    <tr><td class="td-bottom" colspan="8">&nbsp;</td></tr>
  </table>
  </body>
</html>