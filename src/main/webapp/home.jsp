<%@ page import="com.example.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="Stylesheets/home.css">
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f0f8ff; /* AliceBlue background for the body */
        text-align: center;
    }

    .content {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    h1 {
        color: #4a4a4a; /* Dark grey color */
        margin-top: 20px;
    }

    p {
        color: #666; /* Slightly darker grey for text */
        font-size: 18px;
        margin-top: 10px;
    }

    .button-container {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 20px;
    }

    a.button {
        display: inline-block;
        color: #fff; /* White text color */
        text-decoration: none;
        padding: 12px 24px;
        background-color: #4caf50; /* Green color */
        border-radius: 4px;
        transition: background-color 0.3s;
        margin: 10px;
    }

    a.button:hover {
        background-color: #388e3c; /* Darker green color on hover */
    }
</style>
</head>
<body>

<div class="content">
    <h1>Welcome back</h1>

    <%
    User user = (User) session.getAttribute("user");

    String addContact = user != null ? "addcontact.jsp" : "login.jsp";
    String manageContact = user != null ? "manage-contact.jsp" : "login.jsp";
    String manageProfile = user != null ? "manageprofile.jsp" : "login.jsp";
    %>

    <div class="button-container">
        <a href="<%= addContact %>" class="button">Add Contact</a>
        <a href="<%= manageContact %>" class="button">Manage Contact</a>
        <a href="<%= manageProfile %>" class="button">Manage Profile</a>
    </div>
</div>

</body>
</html>
