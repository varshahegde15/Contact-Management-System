<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f8ff; /* AliceBlue background */
        padding: 20px;
    }

    form {
        max-width: 400px;
        margin: 0 auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

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
        background-color: #4caf50; /* Green background */
        color: white;
        border: none;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #45a049; /* Darker green on hover */
    }

    h1 {
        color: #f44336; /* Red color for error message */
        text-align: center;
        margin-top: 20px;
    }
</style>
</head>
<body>

<form action="login" method="post">
    <input type="email" name="email" placeholder="Enter your email"><br>
    <input type="password" name="password" placeholder="Enter your password"><br>
    <input type="submit" value="Login">
</form>

<% String message = (String) request.getAttribute("error"); %>
<% if (message != null) { %>
    <h1><%= message %></h1>
<% } %>

</body>
</html>
