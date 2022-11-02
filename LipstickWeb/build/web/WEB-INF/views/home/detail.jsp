<%-- 
    Document   : detail
    Created on : Jul 19, 2022, 9:17:07 PM
    Author     : luffy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="<c:url value="/css/styleDetail.css"/>" rel="stylesheet" type="text/css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <title>JSP Page</title>
</head>
<body>
<div class="product-detail-container container pt-5">
    <div class="row">
        <div class="col-md-4">
            <img src="<c:url value="/${product.images}" />" class="w-100">
        </div>
        <div class="col-md-8">
            <div class="detail-info">
                <h1 class="name">${product.name}</h1><br/>
                <p class="detail">${product.detail}</p>
                <hr/>
                <p class="discount"> Discount: <fmt:formatNumber value="${product.discount}" pattern="0"/>%</p>
                <h3 class="price">
                    <fmt:formatNumber value="${product.price - product.price * (product.discount/100)}"
                                      pattern="#,### VND"/>
                    <span style="color: dimgray; text-decoration-line: line-through"><fmt:formatNumber
                            value="${product.price}" pattern="#,### VND"/></span>
                </h3><br/>
                <a href="<c:url value="/home/buy.do?productID=${product.productid}"/>">
                    <button class="btn btn-primary">
                      <i class="fa fa-cart-plus"></i>  Thêm vào giỏ hàng
                    </button>
                </a>
            </div>
        </div>
    </div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>
</html>
