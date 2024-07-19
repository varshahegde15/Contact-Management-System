<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f8ff; /* AliceBlue background */
        padding: 20px;
        text-align: center;
    }

    p {
        margin-bottom: 10px;
    }

    span {
        font-weight: bold;
        color: #333; /* Dark grey text color */
    }

    a {
        display: inline-block;
        margin-top: 10px;
        padding: 10px 20px;
        background-color: #4caf50; /* Green background */
        color: white;
        text-decoration: none;
        border-radius: 4px;
        transition: background-color 0.3s ease;
    }

    a:hover {
        background-color: #45a049; /* Darker green on hover */
    }
</style>
</head>
<body>

<%
User user = (User) session.getAttribute("user");
String userName = user != null ? user.getUsername() : "";
String email = user != null ? user.getEmail() : "";
String password = user != null ? user.getPassword() : "";
%>

<h2>User Profile</h2>
<p><span>Username:</span> <%= userName %></p>
<p><span>Email:</span> <%= email %></p>
<p><span>Password:</span> <%= password %></p>
<a href="update_profile.jsp">Update Profile</a>
<a href="delete">Delete Profile</a>


<% String message = (String) request.getAttribute("error"); %>
<% if (message != null) { %>
    <h1><%= message %></h1>
<% } %>
</body>
</html>
