<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>添加</title>
    <!-- <link href="https://cdn.bootcss.com/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.min.js"></script> -->
    <link rel="stylesheet" href="statics/css/bootstrap.min.css">
    <script src="statics/js/jquery-3.3.1.min.js"></script>
    <script src="statics/js/bootstrap.min.js"></script>
    <style>
        h1 {
            margin: 50px auto;
            text-align: center;
        }

        .main {
            margin: 6px 489px;
        }
        .form-box{
            margin-bottom: 10px;
        }
        a{
            text-decoration : none;
            color: #fff;
        }
        a:hover{
            color: limegreen;
        }
        .btns{
            margin: 16px 10px 10px 44px;
            padding-right: 10px;
        }
    </style>
</head>

<body>
    <h1>客户信息添加页面</h1>
</body>
    <div class="main">
        <div class="row">
            <form class="form-horizontal" role="form" id="userForm" method="post">
                <div class="input-group form-box">
                    <label>客户名字：</label>
                     <input type="text" class="form-control" id="name">
                </div>
                <div class="input-group form-box">
                    <label>客户电话：</label>
                    <input type="text" class="form-control" id="phone">
                </div>
                <div class="input-group form-box">
                    <label>客户住址：</label>
                    <input type="text" class="form-control" id="address">
                </div>
                <div class="input-group form-box">
                    <label>客户备注：</label>
                    <input type="text" class="form-control" id="remark">
                </div>
               
                <div class="btns">
                    <button type="submit" class="btn btn-info" id="submit">提交</button>
                    <button type="button" class="btn btn-info"><a href="#">重置</a></button>
                </div>
            </form>
        </div>
    </div>

    <script type="text/javascript">
        $(function () {
            $("#submit").click(function () {
                var json = {
                    "name": $("#name").val(),
                    "phone": $("#phone").val(),
                    "address": $("#address").val(),
                    "remark": $("#remark").val()
                };
                console.log(json);
                $.ajax({
                    url: "<%=request.getContextPath()%>/toAdd",
                    type: "POST",
                    contentType : 'application/json',
                    dataType : 'json',
                    data: JSON.stringify(json),
                    success: function (data) {
                        console.log(data);
                    },
                    error: function (data) {
                        alert(data)
                    }
                })
            })
        })
    </script>
    
</html>