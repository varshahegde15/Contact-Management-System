<%@page import="com.example.entity.Contact"%>
<%@page import="java.util.List"%>
<%@page import="com.example.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Contacts</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f8ff; /* AliceBlue background */
        padding: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #4caf50; /* Green background for table header */
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2; /* Light grey background for even rows */
    }

    tr:hover {
        background-color: #ddd; /* Darker grey background on hover */
    }

    a {
        text-decoration: none;
        color: #2196f3; /* Blue color for links */
    }

    a:hover {
        text-decoration: underline;
    }

    h1 {
        color: #f44336; /* Red color for error message */
        text-align: center;
        margin-top: 20px;
    }
</style>
</head>
<body>

<%
User user = (User) session.getAttribute("user");
List<Contact> contacts = user.getContacts();
%>

<table>
<thead>
    <tr>
        <th>Contact Name</th>
        <th>Contact Number</th>
        <th>Update</th>
        <th>Delete</th>
    </tr>
</thead>
<tbody>
<%
for (Contact contact : contacts) {
%>
    <tr>
        <td><%= contact.getContactName() %></td>
        <td><%= contact.getContactNumber() %></td>
        <td><a href="manage-contact?contactId=<%= contact.getContactId() %>">Update</a></td>
        <td><a href="delete-contact?contactId=<%= contact.getContactId() %>">Delete</a></td>
    </tr>
<%
}
%>
</tbody>
</table>

<% String message = (String) request.getAttribute("error"); %>
<% if (message != null) { %>
    <h1><%= message %></h1>
<% } %>

</body>
</html>
