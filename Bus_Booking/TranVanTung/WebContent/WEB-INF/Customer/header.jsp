<%@page import="model.Users"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!doctype html>
<html lang="en">
  <head>
  	<title>Bus Ticket</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resouce/cus/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resouce/cus/css/assets/owl.carousel.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resouce/cus/css/assets/owl.theme.default.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resouce/cus/css/main.css"/>
  </head>
  <body>
  	<div class="header">
  		<div class="container">
  			<div class="header_content ">
  				Ticketing System
  			</div>
  			<div class="main_nav">
  				<ul class="nav nav-pills pull-left">
  				
  				<c:if test="${USER.getUsername()==null}">
						<li  class="nav-item"><a href="${pageContext.request.contextPath}/cus/purchase" class="nav-link">Purchase Ticket</a></li>
						<li  class="nav-item"><a href="${pageContext.request.contextPath}/cus/login" class="nav-link">Login</a></li>
 				</c:if>
 				<c:if test="${USER.getUsername()!=null}">
						<li  class="nav-item"><a href="${pageContext.request.contextPath}/cus/dashboard" class="nav-link">Dashboard</a></li>
						<li  class="nav-item"><a href="${pageContext.request.contextPath}/cus/purchase" class="nav-link">Purchase Ticket</a></li>
						<li class="nav-item"><a href="${pageContext.request.contextPath}/cus/dashboard?logout=1" class="nav-link">Logout</a></li>		
				</c:if>
  				</ul>
  			</div>
  		</div>
  	</div>
  	<section class="main_contents">
  		<div class="container">
  		<div class="main_contents_inner" >
