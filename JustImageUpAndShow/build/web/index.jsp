<%-- 
    Document   : AddShow
    Created on : Mar 22, 2019, 2:24:45 AM
    Author     : shaarif
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>IMAGE UPLOAD</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <link href="css/all.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/fontawesome.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/bootstrap.css">

        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.js"></script>
        <script src="js/bootstrap.min.js"></script>



        <script src="resources/bootstrap.min.js" type="text/javascript"></script>
        <script src="resources/angular.min.js" type="text/javascript"></script>


        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/fontawesome.min.css">

        <script src="js/jquery-3.3.1.min.js"></script>

    </head>
  <body ng-app="simpleApp" ng-controller="simpleCtrl">

        {{7 * 5}}
        <!--FORMS*******************-->
    <center>
        <div class="row">
            <div class="col-md-4">
                <h1>CHOOSE IMAGE</h1>
                <form action="fileUpload.htm" method="POST" enctype="multipart/form-data">
                    <input type="file" name="imageFile" class="btn btn-info px-3"><br><br/>
                    <input type="submit" value="SELECT" class="btn btn-primary px-4"/>
                </form>
                
                 <form action="saveData.htm">
                    <input type="hidden" name="name" value="Images Name" placeholder="NAME">
                    <input type="hidden" name="image" value="${img}"><br/>
                    <input type="submit" class="btn btn-danger" value="CONFIRM" style="margin-bottom: 100px;">
                </form>
            </div>
            <div class="col-md-4">       
                <h1 class="text-danger">
                    <c:out value="${msg}"></c:out>
                </h1>
            </div>
            <div class="col-md-4 mt-5">
                <a href="showImage.htm" class="btn btn-info btn-block">DISPLAY</a> 
            </div>
        </div>
      

        <h1>GALLERY</h1>
        <hr/>       
        <div class="row">
            <c:forEach items="${imageList}" var="gal">                           
                <div class="col-md-4">
                    <h1 class="text-primary   ">
                        Profile
                        <a href="deleteImage.htm?id=${gal.id}"><i class="fa fa-close fa-1x text-danger m-2" style="margin-top: 25px;"></i></a>
                    </h1>
                   
                    <img src="img/${gal.image}" height="250px" width="250px"/>
                </div>
            </c:forEach>
        </div>
    </center>
 <script>
                var app = angular.module("simpleApp", []);
                app.controller("simpleCtrl", function ($scope, $http) {

                });
    </script>
</body>
</html>