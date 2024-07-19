<%@page import="com.example.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update User</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f8ff; /* AliceBlue background */
        padding: 20px;
        text-align: center;
    }

    form {
        max-width: 400px;
        margin: 0 auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    input[type="text"],
    input[type="email"],
    input[type="password"],
    input[type="number"],
    input[type="submit"] {
        width: 100%;
        padding: 10px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    input[type="submit"] {
        background-color: #4caf50; /* Green background for submit button */
        color: white;
        border: none;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #45a049; /* Darker green on hover */
    }
</style>
</head>
<body>

<%
User user = (User) session.getAttribute("user");
int userId = user != null ? user.getUserId() : 0;
String userName = user != null ? user.getUsername() : "";
String email = user != null ? user.getEmail() : "";
String password = user != null ? user.getPassword() : "";
%>

<h1>Update User</h1>
<form action="updateUser" method="post">
    <input type="number" name="userId" value="<%= userId %>" hidden="true">
    <input type="text" name="username" value="<%= userName %>" placeholder="Enter your name"><br><br>
    <input type="email" name="email" value="<%= email %>" placeholder="Enter your email"><br><br>
    <input type="password" name="password" value="<%= password %>" placeholder="Enter your password"><br><br>
    <input type="submit" value="Confirm">
</form>

</body>
</html>
