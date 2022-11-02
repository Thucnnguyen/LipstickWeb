<%-- 
    Document   : register
    Created on : Jun 23, 2022, 3:26:40 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="<c:url value="/images/download.png"/>"/>
    </head>
    <body>


        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="card login-container mt-5">
                <div class="card-header text-center login-title">Register Form</div>
                <div class="card-body">

                    <form action="<c:url value="/user/checkRegister.do"/>">
                        <div class=" mb-3">
                            <label for="account">Account:</label>

                            <input class="form-control" type="text" name="account" id="account" value="${account}">
                        </div>
                        <div class="inputbox">
                            <label for="password">Password:</label>
                            <input class="form-control" type="password" name="password" value="${password}">
                            <br/>
                        </div>
                        <div class="inputbox">
                            <label for="checkPassword">Check Password:</label>
                            <input class="form-control" type="password" name="checkPassword" id="pass">
                            <br/>
                        </div>
                        <div class=" mb-3">
                            <label for="email">Email:</label>
                            <input class="form-control" type="text" name="email" id="email" value="${email}" required="">
                        </div>
                        <div class=" mb-3">
                            <label for="phone">Phone Number:</label>
                            <input class="form-control" type="text" name="phone" id="phone" value="${phone}" required="">
                        </div>
                        <div class=" mb-3">
                            <label for="location">Location:</label>
                            <input class="form-control" type="text" name="location" id="location" value="${location}"
                                   required="">
                        </div>

                        <div class="row">
                            <div class="col text-center">
                                <input type="submit" value="Register" class="btn btn-primary login-btn">
                            </div>
                        </div>

                    </form>
                    <div class=" mt-4">
                        <p class="link-login">Already have an account? <a href="<c:url value="/user/login.do"/>">Login</a> 
                        <div class="message"> ${message}</div>
                        </p>
                    </div>


                    <br/>
                </div>

            </div>

        </div>

    </body>

</html>
