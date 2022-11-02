<%-- 
    Document   : about
    Created on : Jul 19, 2022, 6:26:42 PM
    Author     : luffy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Information</title>
</head>
<body>
<div class="container mt-3">
    <h1 class="about-h1">User Information</h1>
    <table class="table table-striped">
        <tbody>
        <tr>
            <td>Account</td>
            <td> ${user.account}</td>
        </tr>
        <tr>
            <td>Email</td>
            <td>${user.email}</td>
        </tr>
        <tr>
            <td>Phone Number</td>
            <td>${user.phone}</td>
        </tr>
        </tr>
        <tr>
            <td>Location</td>
            <td>${user.location}</td>
        </tr>
        </tbody>
    </table>
</div>
</body>

</html>
