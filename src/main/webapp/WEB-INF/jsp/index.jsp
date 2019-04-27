<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>主页</title>
    <!-- <link href="https://cdn.bootcss.com/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.min.js"></script> -->
    <link rel="stylesheet" href="statics/css/bootstrap.min.css">
    <link rel="stylesheet" href="statics/font-awesome-4.7.0/css/font-awesome.min.css">
    <script src="statics/js/jquery-3.3.1.min.js"></script>
    <script src="statics/js/bootstrap.min.js"></script>

    <style>
        h1{
            margin: 50px auto;
            text-align: center;
        }
        .main{
            margin: 50px 50px;
        }
        .table{
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <h1>客户列表信息页面</h1>

    <div class="main">
        <div class="row box">
            <div class="col-lg-6">
                <div class="input-group">
                    客户姓名：
                    <input type="text" class="form-control" id="name"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;客户电话：
                    <input type="text" class="form-control" id="phone">
                </div>
            </div>
        
            <div class="col-lg-6">
                <button class="btn btn-info" id="search">查询</button>
                <button class="btn btn-danger">重置</button>
            </div>
        </div>

        <div class="bs-example" data-example-id="table-within-panel">
            <div class="panel panel-default">
        
                <!-- Table -->
                <table class="table">
                    <thead>
                        <tr>
                            <th>客户编号</th>
                            <th>客户姓名</th>
                            <th>客户电话</th>
                            <th>客户地址</th>
                            <th>客户备注</th>
                            <th>客户操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${users}" var="user">
                        <tr>
                            <th scope="row" id="userId">${user.id}</th>
                            <td>${user.name}</td>
                            <td>${user.phone}</td>
                            <td>${user.address}</td>
                            <td>${user.remark}</td>
                            <td>
                                <a href="/edit?userId=${user.id}"><i class="fa fa-edit fa-lg"></i></a>
                                <a href="/del?userId=${user.id}"><i class="fa fa-trash fa-lg"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(function () {
            $("#delUser").click(function () {
                $.ajax({
                    url: "/search",
                    type: "POST",
                    // contentType : 'application/json',
                    // dataType : 'json',
                    data: $("#userId").val(),
                    success: function (data) {
                        console.log(data);
                    },
                    error: function (data) {
                        alert("删除失败");
                    }
                })
            });

            $("#search").click(function () {
                var name = $("#name").val();
                var phone = $("#phone").val();
                $.ajax({
                    url: "/search?name=" + name + "&phone=" + phone,
                    type: "GET",
                    success: function (data) {
                        console.log(data);
                    },
                    error: function (data) {
                        alert("删除失败");
                    }
                })
            })
        })
    </script>
</body>
</html>