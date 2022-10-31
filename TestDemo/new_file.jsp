<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>计算器</title>
</head>
<body style="text-align:center;">
<%
  String firstNum=request.getParameter("firstNum");
  String secondNum=request.getParameter("secondNum");
  String str=request.getParameter("operator");
  if(firstNum==null||secondNum==null)
  {firstNum="0";secondNum="0";
    str="+";
  }
  float first=Float.parseFloat(firstNum);
  float second=Float.parseFloat(secondNum);


  char operator=str.charAt(0);
  String result="";


  switch (operator) {
    case '+':{
      result=(first+second)+"";
      break;
    }
    case '-':{
      result=(first-second)+"";
      break;
    }
    case '*':{
      result=(first*second)+"";
      break;
    }
    case '/':{
      if(second==0){
        out.println("被除数不能为0；");//throw new RuntimeException("被除数不能为0；");
      }
      else
        result=(first/second)+"";
      break;
    }
    default:
      throw new RuntimeException("运算符有误！");
  }
%>
<br/>*********************************<br/>
计算结果是：
<%=first %><%=operator %><%=second %>
=
<%=result %>

<br/>*********************************
<br>
<br/>
<form action="/calculator.jsp" method="post">
  <center>
    <table  width="60%" border="1" >
      <tr>
        <td colspan="2">简单计算器(JSP)</td>

      </tr>
      <tr>
        <td>第一个参数</td>
        <td>
          <input type="text" name="firstNum">
        </td>
      </tr>
      <tr>
        <td>操作符</td>
        <td>
          <select name="operator">
            <option value="+">+</option>
            <option value="-">-</option>
            <option value="*">*</option>
            <option value="/">/</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>第二个参数</td>
        <td>
          <input type="text" name="secondNum">
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="submit" value="计算">
        </td>

      </tr>

    </table>
  </center>
</form>
</body>
</html>