<%-- 
    Document   : main
    Created on : Jun 12, 2022, 2:05:06 PM
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
        <jsp:include page="/WEB-INF/Layers/header.jsp"></jsp:include>

        </head>
        <body>

            <div class="navbar bg-light">
                <div class="container-fluid p-2 ">
                    <div class="brand-logo-full ">
                        <a class="navbar-brand text-dark text-light text-decoration-none"
                           href="${pageContext.request.contextPath}/home/homePage.do">
                        <i class="ms-2 fa fa-paint-brush brand-icon"></i>
                        <span class="ms-2">PRJ Cosmetic</span>
                    </a>
                </div>
                <div class=" text-center text-dark  "><h1>LipStick</h1></div>
                <form class="d-flex " role="search">
                    <%--            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">--%>
                    <%--            <button class="btn btn-outline-success" type="submit">Search</button>--%>

                    <c:if test="${empty user }">
                        <a href="<c:url value="/user/login.do"/>" class="btn-outline-success text-center btn me-2  btn-pink">Login</a>
                        <a href="<c:url value="/user/register.do"/>"
                           class="btn-outline-success text-center btn me-2  btn-pink">Register</a>
                    </c:if>
                    <c:if test="${not empty user }">
                        <a class="btn-outline-success text-center btn me-2 btn-pink" style="cursor: pointer"
                           href="<c:url value="/user/about.do?account=${user.account}"/>">${user.account}</a>
                        <a href="<c:url value="/user/logout.do"/>" class="btn-outline-success text-center btn me-2  btn-pink">Logout</a>
                    </c:if>
                </form>
            </div>
        </div>
        <div >

            <div class="alert alert-warning m-2" role="alert">
                <h4 class="alert-heading">A lifetime of discounts? It's Genius</h4>
                <p>Great rewarded for your travel- unlock instant savings of 10% or more with a free
                    Lipstick account </p>
            </div>

            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                            aria-current="true" aria-label="Slide 1"></button>

                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                            aria-label="Slide 2"></button>

                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                            aria-label="Slide 3"></button>

                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3"
                            aria-label="Slide 4"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100 promo-graphic-img" src=" <c:url value="/images/sale-lipstick.png"/>">

                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100 promo-graphic-img" src=" <c:url value="/images/lipstick.jpg"/>">

                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100 promo-graphic-img" src=" <c:url value="/images/lipstick-2.jpg"/>">

                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100 promo-graphic-img" src=" <c:url value="/images/lipstick-3.jpg"/>">

                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>

        <div class="main-body">
            <jsp:include page="/WEB-INF/views/${controller}/${action}.jsp"/>
        </div>

        <div class="bg-light fixed-bottom text-center p-3">
            <div class="">
                <span class="small">Copyrights &COPY; By Lipstick Shop. All Rights Reserved.</span>
            </div>
        </div>

        <jsp:include page="/WEB-INF/Layers/footer_script.jsp"></jsp:include>
        <script>

            document.body.onload = ev => {
                var myCarousel = document.querySelector('#carouselExampleIndicators')
                var carousel = new bootstrap.Carousel(myCarousel, {
                    interval: 2000,
                    wrap: false
                })


                const dropdownElementList = document.querySelectorAll('.dropdown-toggle')
                console.log(dropdownElementList)
                const dropdownList = [...dropdownElementList].map(dropdownToggleEl => new bootstrap.Dropdown(dropdownToggleEl))
            }
        </script>
    </body>
</html>
