<%@ page import="com.example.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f0f8ff; /* AliceBlue background for the body */
    }

    nav {
        background-color: #455a64; /* Blue Grey background for the nav */
        overflow: hidden;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 14px 20px;
        color: #eceff1; /* Light Grey color for text */
    }

    nav div {
        font-size: 24px;
        font-weight: bold;
        color: #8bc34a; /* Light Green color for the title */
    }

    nav .nav-links {
        display: flex;
        gap: 10px;
    }

    nav a {
        color: #eceff1; /* Light Grey color for links */
        text-align: center;
        padding: 10px 20px;
        text-decoration: none;
        font-size: 18px;
        background-color: #4caf50; /* Green color for links */
        border-radius: 4px;
    }

    nav a:hover {
        background-color: #388e3c; /* Darker Green color for hover effect */
        color: #fff; /* White text color on hover */
    }

    nav a.logout {
        background-color: #388e3c; /* Darker Green color for the Logout button */
    }

    nav a.logout:hover {
        background-color: #4caf50; /* Green color for Logout hover effect */
    }

    @media (max-width: 600px) {
        nav div, nav .nav-links, nav a {
            display: block;
            text-align: center;
            padding: 10px;
            font-size: 16px;
        }

        nav .nav-links {
            justify-content: center;
        }
    }
</style>
</head>
<body>
<%
User user2 = (User) session.getAttribute("user");
String name = user2 != null ? user2.getUsername() : "not found";
%>

<nav>
    <div>Contact-Management-System</div>
    <div class="nav-links">
    <%
    if (user2 == null) {
    %>
        <a href="register.jsp">Register</a>
        <a href="login.jsp">Login</a>
    <% } else { %>
        <a href="logout" class="logout">Logout</a>
    <% } %>
    </div>
</nav>

</body>
</html>
