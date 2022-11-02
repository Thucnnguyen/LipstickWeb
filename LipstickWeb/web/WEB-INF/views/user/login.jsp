<%-- 
    Document   : Login
    Created on : Jun 18, 2022, 9:14:51 PM
    Author     : Acer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lipstick shop</title>
    </head>
    <body>

        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="card login-container mt-5">
                <div class="card-header text-center login-title">Login Form</div>
                <div class="card-body">
                    <form action="<c:url value="/user/checkLogin.do"/>">
                        <div class="input-group mb-3">
                            <span class="input-group-text"> <i class="fa fa-user-circle"></i></span>
                            <input type="text" name="account" id="account" value="${account}"
                                   class="form-control" placeholder="Username">
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text"><i class="fa fa-key"></i></span>
                            <input type="password" name="password" id="pass"
                                   placeholder="Password"
                                   class="form-control">
                        </div>
                        <div class="row">
                            <div class="col text-center">
                                <input type="submit" value="Login" class="btn btn-primary login-btn">
                            </div>
                        </div>
                    </form>
                    <p class="text-muted mt-3 text-center">You don't have an account? <a
                            href="<c:url value="/user/register.do"/>">Register</a>
                    </p>
                    <div class="message">${message} </div>
                </div>
            </div>
        </div>
    </body>
</html>
