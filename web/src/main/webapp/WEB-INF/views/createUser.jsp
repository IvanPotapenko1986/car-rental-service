<%@ page import="by.potapenko.database.entity.Car" %>
<%@ page import="java.util.Optional" %>
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
    <title>Create new car</title>
    <style>
        box {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 50px;
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

        select {
            width: 250px;
            height: 30px;
            font-size: 14px;
        }

        input {
            width: 250px;
            height: 30px;
            font-size: 14px;
        }

    </style>
</head>
<body>
<%@include file="headerAdmin.jsp" %>
<div><a href="/admin">Home </a>/ create new user</div>
<box>
    <form method="post" class="w3-card-4 w3-blue-grey w3-round-large w3-padding" style="width: 50%">
        <flex>

            <c:if test="${create_user == null}">
                <h1>User</h1><br>
                <label for="name">Name</label>
                <input class="w3-round-large"
                       type="text"
                       maxlength="20"
                       placeholder="Enter your name"
                       name="name"
                       id="name"
                       required/><br>
                <label for="surname">Surname</label>
                <input class="w3-round-large"
                       type="text"
                       maxlength="20"
                       placeholder="Enter your surname"
                       name="surname"
                       id="surname"
                       required/><br>

                <label for="email">Email</label>
                <input class="w3-round-large"
                       type="email"
                       maxlength="20"
                       placeholder="Enter your email"
                       name="email"
                       id="email"
                       required/><br>
                <label for="pwd">Password</label>
                <input class="w3-round-large"
                       maxlength="20"
                       type="password"
                       placeholder="Enter your password"
                       name="password"
                       id="pwd"
                       required/></p><br>
                <button class="w3-btn w3-white w3-round-large" type="submit">Create</button>
                </br>
                <p style="font-size: 16px"><a href="/admin/users">Back</a></p>
            </c:if>
            <c:if test="${create_user == false}">
                <p style="font-size: 20px" class="w3-text-red"> Sorry! Creating doesn't possible now, please try
                    again </p>
                <a href="/admin/users/create_user" class="w3-text-blue">Create new user</a><br>
            </c:if>
        </flex>
    </form>
</box>
</body>
</html>