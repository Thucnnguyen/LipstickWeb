<%-- 
    Document   : homepage
    Created on : Jun 12, 2022, 2:41:33 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lipstick shop</title>
    </head>
    <body>
        <div class="container">

            <div class="pt-3 align-items-center justify-content-center d-flex">
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" style=" color: #555555 !important; border-color: #e3d4a2;background: #fcecb4; border-style: solid;" type="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                        Danh mục sản phẩm
                    </button>
                    <ul class="dropdown-menu">
                        <c:forEach items="${listBrand}" var="brand">
                            <li><a class="dropdown-item"
                                   href="<c:url value="/home/homePage.do?brandID=${brand.branID}"/>">${brand.brandName}</a></li>
                            </c:forEach>
                        <li><a class="dropdown-item" href="<c:url value="/home/homePage.do"/>">Show All</a></li>
                    </ul>
                </div>
                <form action="<c:url value="/home/search.do"/>" class="d-flex w-50 m-3">
                    <div class="input-group flex-nowrap">
                        <span class="input-group-text" id="addon-wrapping"> <i class="fa fa-search"></i></span>
                        <input class="form-control me-2"  placeholder="Nhập thông tin.." type="search" name="Search"
                               value="${Search}"/>
                    </div>
                    <button class="btn btn-success" style=" color: #555555 !important; border-color: #e3d4a2;background: #fcecb4; border-style: solid;" type="submit">
                        Search
                    </button>
                </form>
            </div>
            <div class=" ">
                <div class="row row-cols-3">
                    <c:forEach items="${listProduct}" var="product">
                        <div class="col p-2">
                            <div class="card ">
                                <div class="card-img-top">
                                    <a href="<c:url value="/home/detail.do?productid=${product.productid}"/>">
                                        <img src="<c:url value="/${product.images}"/>" class="w-100">
                                    </a>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">${product.name}</h5>
                                    <p class="card-text">
                                        <span class="">Discount: <fmt:formatNumber
                                                value="${product.discount}" pattern="0"/>%   </span> <br/>
                                        <span style="font-weight: bold"><fmt:formatNumber
                                                value="${product.price - product.price * (product.discount/100)}"
                                                pattern="#,### VND"/></span>
                                        <span style="color: dimgray; text-decoration-line: line-through"><fmt:formatNumber
                                                value="${product.price}" pattern="#,### VND"/></span>
                                    </p>
                                    <a href="<c:url value="/home/buy.do?productID=${product.productid}"/>"
                                       class="text-decoration-none">
                                        <button class="btn btn-outline-success">
                                            <i class="fa fa-cart-plus"></i>
                                            Thêm vào giỏ hàng
                                        </button>
                                    </a>
                                </div>
                            </div>
                        </div>

                    </c:forEach>
                </div>

            </div>
            <a href="<c:url value="/home/showCart.do"/>" class="text-decoration-none">
                <div class="cart shadow-sm rounded-3">
                    <div class="quantity text-center">
                        <i class="fa fa-cart-arrow-down me-1"></i>
                        <span>
                            <c:if test="${empty cart}">
                                0
                            </c:if>
                            <c:if test="${not empty cart}">
                                ${quantity}
                            </c:if>
                        </span>
                    </div>
                </div>
            </a>

            <nav aria-label="Page navigation example" class="d-flex align-items-end justify-content-center">
                <ul class="pagination">
                    <c:forEach begin="1" end="${endPages}" var="i">
                        <li class="page-item">
                            <c:if test="${ empty Search}">
                                <c:if test="${empty brandID}">
                                    <a class="page-link" href="<c:url value="/home/homePage.do?index=${i}"/>">${i}</a>
                                </c:if>
                                <c:if test="${not empty brandID}">
                                    <a class="page-link"
                                       href="<c:url value="/home/homePage.do?index=${i}&brandID=${ brandID}"/>">${i}</a>
                                </c:if>
                            </c:if>
                            <c:if test="${not empty Search}">
                                <a class="page-link"
                                   href="<c:url value="/home/search.do?index=${i}&Search=${Search}"/>">${i}</a>
                            </c:if>
                        </li>
                    </c:forEach>
                </ul>
            </nav>


        </div>

    </body>
</html>
