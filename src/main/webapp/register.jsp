<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f8ff; /* AliceBlue background */
        padding: 20px;
        text-align: center;
    }

    h1 {
        color: #4caf50; /* Green color for headings */
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

    h2 {
        color: #f44336; /* Red color for error message */
        margin-top: 20px;
    }
</style>
</head>
<body>

<h1>Register</h1>
<form action="register" method="post">
    <input type="text" name="username" placeholder="Enter your name"><br>
    <input type="email" name="email" placeholder="Enter your email"><br>
    <input type="password" name="password" placeholder="Enter your password"><br>
    <input type="submit" value="Register">
</form>

<% String message = (String) request.getAttribute("message"); %>
<% if (message != null) { %>
    <h2><%= message %></h2>
<% } %>

</body>
</html>
