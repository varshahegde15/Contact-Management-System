<%@page import="com.example.entity.Contact"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Contact</title>
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
Contact contact = (Contact) request.getAttribute("contact");
%>

<h1>Update Contact</h1>
<form action="saveUpdatedContact" method="post">
    <input type="number" name="contactId" value="<%= contact.getContactId() %>" hidden="true" readonly="true">
    <input type="text" name="contactName" value="<%= contact.getContactName() %>" placeholder="Enter contact name"><br><br>
    <input type="number" name="contactNumber" value="<%= contact.getContactNumber() %>" placeholder="Enter contact number"><br><br>
    <input type="submit" value="Update">
</form>

<% String message = (String) request.getAttribute("error"); %>
<% if (message != null) { %>
    <h1><%= message %></h1>
<% } %>

</body>
</html>
