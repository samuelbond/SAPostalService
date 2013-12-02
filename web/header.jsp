<%-- 
    Document   : header
    Created on : Oct 10, 2013, 1:01:26 PM
    Author     : samuelbond
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="assets/ico/favicon.png">

    <title>SA POSTAL SERVICE</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="assets/js/html5shiv.js"></script>
      <script src="assets/js/respond.min.js"></script>
    <![endif]-->

    <!-- Custom styles for this template -->
    <link href="css/carousel.css" rel="stylesheet">
  </head>
<!-- NAVBAR
================================================== -->
  <body>
      
    <div class="navbar-wrapper">
      <div class="container">

        <div class="navbar navbar-inverse navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="#"><img src="images/logo2.png" /></a>
            </div>
              <div class="navbar-collapse collapse" style="margin-top:7px;">
              <ul class="nav navbar-nav">
                <li><a href="home">Home</a></li>
                <li><a href="trackpackage">Track Package</a></li>
                <li><a href="login">Shipping</a></li>
                <li><a href="#">Contact</a></li>
              </ul>
                
            </div>
              <c:if test="<%= Boolean.valueOf((String) request.getAttribute("isUser")).booleanValue() %>">
             <a class="btn" href="account"  style="position:absolute; top:10px; right:150px;">Account |</a>
            <a class="btn" href="login?logout=true"  style="position:absolute; top:10px; right:100px;">Logout</a>
        </c:if>
            <c:if test="<%= Boolean.valueOf((String) request.getAttribute("notUser")).booleanValue() %>">
                <a href="login"  style="text-decoration:none; color:#fff; position:absolute; top:20px; right:150px;">Login <i class="glyphicon glyphicon-lock"></i></a>
                 <a href="register"  style="text-decoration:none; color:#fff; position:absolute; top:20px; right:60px;">Sign Up <i class="glyphicon glyphicon-user"></i></a>
        </c:if>
          </div>
        </div>
        
          
      </div>
        
    </div>
      
      