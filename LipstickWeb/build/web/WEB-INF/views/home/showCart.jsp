<%-- 
    Document   : showCart
    Created on : Jun 21, 2022, 8:50:40 PM
    Author     : Acer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Lipstick shop</title>
</head>
<body>
<div class="container mt-3">
    <div class="row">
        <div class="col-md-6 p-2">
            <h2>Thông tin giao hàng</h2>
            <form action="<c:url value="/home/checkout.do"/>">
                <div class="mb-3"><label for="name">Họ tên:</label>
                    <input id="name"
                           class="form-control" type="text" value="${user.account}" placeholder="Họ tên" name="name"
                           required=""/>
                </div>
                <div class="mb-3">
                    <label class="info">Số điện thoại:</label>
                    <input class="form-control" type="text" value="${user.phone}" placeholder="Số điện thoại"
                           name="phone"
                           required=""/>
                </div>
                <div class="mb-3">
                    <label class="info">Email:</label>
                    <input class="form-control" type="text" value="${user.email}" placeholder="Email" name="email"
                           required=""/>
                </div>
                <div class="mb-3">
                    <label class="info">Địa chỉ:</label>
                    <input class="form-control" type="text" value="${user.location}" placeholder="Địa chỉ"
                           name="address"
                           required=""/>
                </div>
                <div class="mb-3">
                    <input type="submit" class="btn btn-primary" value="Xác nhận đơn hàng" ${cart == null || cart.getList().size()==0 ? "disabled":""}/>
                </div>
            </form>
        </div>

        <div class=" col-md-6 p-2">
            <div class="">
                <h2>Đơn hàng</h2>

            </div>

            <table class="table table-striped table-hover">
                <thead class="table-light">
                <tr>
                    <th>Tên sản phẩm</th>
                    <th>Đơn giá</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${cart.list}" var="p">
                    <tr>
                        <td>
                            <p>${p.product.name} x ${p.quantity}</p>
                        </td>
                        <td>
                            <span style="overflow: auto;
  white-space: nowrap;"><fmt:formatNumber
                                    value="${(p.product.price - p.product.price*(p.product.discount/100))*p.quantity}"
                                    pattern="#,### VND"/></span>
                        </td>
                        <td>
                            <a href="<c:url value="/home/showCart.do?productID=${p.product.productid}"/>"
                               class="btn btn-outline-danger"><i class="fa fa-trash"></i></a>
                        </td>
                    </tr>

                </c:forEach>

                <tr>
                    <td></td>
                    <td></td>
                    <td>
                        <a href="<c:url value="/home/homePage.do"/>"
                           class="btn btn-outline-secondary">
                            <i class="fa fa-plus"></i> </a></td>
                </tr>
                </tbody>

                <c:if test="${not empty cart.list}">
                    <tfoot>
                    <tr class="table-light">
                        <td class="fw-bold">Total</td>
                        <td class="fw-bold">
                            <span style="overflow: auto;
  white-space: nowrap;"><fmt:formatNumber value="${cart.sum()}" pattern="#,### VND"/></span>
                        </td>
                        <td>
                        </td>
                    </tr>
                    </tfoot>
                </c:if>
            </table>
            <!--<a href="<c:url value="/home/checkout.do"/>" class="btn btn-default confirm check-out "><i class="fa-solid fa-circle-check"></i> Xác nhận đơn hàng</a>-->
        </div>
    </div>
</div>
</body>
</html>
