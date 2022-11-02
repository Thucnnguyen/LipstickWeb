<%-- 
    Document   : show
    Created on : Jun 18, 2022, 8:18:11 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%--    <link href="<c:url value="/css/styleShow.css"/>" rel="stylesheet" type="text/css"/>--%>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <jsp:include page="header.jsp"></jsp:include>
            <title>Lipstick shop</title>
        </head>

        <body>

            <div class="navbar bg-light " >
                <div class="container-fluid p-2">
                    <div class="brand-logo-full">
                        <a class="navbar-brand text-dark text-light text-decoration-none"
                           href="${pageContext.request.contextPath}/home/homePage.do">
                        <i class="ms-2 fa fa-paint-brush brand-icon"></i>
                        <span class="ms-2">PRJ Cosmetic</span>
                    </a>

                </div>
                        


            </div>


        </div>

        <div class="body">
            <jsp:include page="/WEB-INF/views/${controller}/${action}.jsp"/>
        </div>

        <div class="bg-light fixed-bottom text-center p-3">
            <div class="">
                <span class="small">Copyrights &COPY; By Lipstick Shop. All Rights Reserved.</span>
            </div>
        </div>

        <jsp:include page="footer_script.jsp"/>
    </body>

</html>
