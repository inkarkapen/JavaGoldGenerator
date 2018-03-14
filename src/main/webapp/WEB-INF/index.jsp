<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
      .building {
          width: 200px;
          height: 150px;
          display: inline-block;
          border: 2px solid black;
          padding: 10px;
          margin: 10px;
      }
  </style>
<body>
      <div class ='building'>
          <h4>FARM</h4>
          <p>earns 2-5 golds</p>
          <form action = "/process_money" method =  "POST">
          <input type = "hidden" name = "building" value = "farm"/>
          <input type = "hidden" name = "min" value = "2"/>
          <input type = "hidden" name = "max" value = "5"/>
          <input type = "submit" value = "Find Gold"/>
          </form>
      </div>
      <div class ='building'>
          <h4>CAVE</h4>
          <p>earns 5-10 golds</p>
          <form action = '/process_money' method =  "POST">
              <input type = "hidden" name = "building" value = "cave"/>
              <input type = "hidden" name = "min" value = "5"/>
          	  <input type = "hidden" name = "max" value = "10"/>
              <input type = "submit" value = "Find Gold"/>
          </form>
      </div>
      <div class ='building'>
          <h4>HOUSE</h4>
          <p>earns 7-15 golds</p>
          <form method =  "POST" action = '/process_money'>
              <input type = "hidden" name = "building" value = "house"/>
              <input type = "hidden" name = "min" value = "7"/>
          	  <input type = "hidden" name = "max" value = "15"/>
              <input type = "submit" value = "Find Gold"/>
          </form>
      </div>
      <div class ='building'>
          <h4>CASINO</h4>
          <p>earns/loses up to 100 golds</p>
          <form action = '/process_money' method =  "POST">
              <input type = "hidden" name = "building" value = "casino"/>
              <input type = "hidden" name = "min" value = "-100"/>
          	  <input type = "hidden" name = "max" value = "100"/>
              <input type = "submit" value = "Find Gold"/>
          </form>
      </div>
      <h3>Your total is: ${total}</h3>
      <c:forEach var = "activity" items = "${activities}">
      	<p>${activity}</p>
      </c:forEach>
  </body>
</html>