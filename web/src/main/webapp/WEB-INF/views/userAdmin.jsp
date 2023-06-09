<%--
  Created by IntelliJ IDEA.
  User: Professional
  Date: 12.04.2023
  Time: 0:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href=
            "https://unpkg.com/@primer/css@^18.0.0/dist/primer.css"/>
    <title>Car current</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        td {
            padding: 10px;
            border: 1px solid white;
        }

        th {
            padding: 10px;
            border: 1px solid white;
        }

        box {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 100px;

        }

        flex {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        div {
            padding-top: 80px;
            padding-left: 20px;
        }

    </style>
</head>
<body>
<%@include file="headerAdmin.jsp" %>
<div><a href="/admin">Home </a><a href="${pageContext.request.contextPath}/admin/users/user?id=${user.id}">/ edit</a>
</div>
<box>
    <form method="post" class="w3-card-4 w3-blue-grey w3-round-large w3-padding" style="width: 70%">
        <a style="font-size: 12px" href="${pageContext.request.contextPath}/admin/users/create_user">Create new user</a>
        <flex>
            <c:if test="${user_id == false}">
                <p class="w3-text-green"> This user ID doesn't exist</p>
            </c:if>
            <c:if test="${user_id == true || create_user == true}">
                <p style="font-size: 16px">
                <h1>${user.name} ${user.surname}</h1>
                <table>
                    <tr>
                        <th>User_id</th>
                        <th>Username</th>
                        <th>Surname</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>Delete</th>
                        <th>Edit</th>
                    </tr>
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.name}</td>
                        <td>${user.surname}</td>
                        <td>${user.email}</td>
                        <td>${user.password}</td>
                        <td><a href="${pageContext.request.contextPath}/admin/users/user/delete_user?id=${user.id}"
                               class="w3-text-red">DELETE</a></td>
                        <td><a href="${pageContext.request.contextPath}/admin/users/user/update_user?id=${user.id}"
                               class="w3-text-red">EDIT</a></td>
                    </tr>
                </table>
                </br>
                <p style="font-size: 16px"><a href="/admin/users">Back</a></p>
            </c:if>
        </flex>
    </form>
</box>
</body>
</html>