<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UEMain.aspx.vb" Inherits="UE.UEMain" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title></title>
    <link href="style/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/jquery.base64.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <style type="text/css">
        .main
        {
            margin: 5% auto;
            text-align: center;
        }
        .item
        {
            width: 95%;
            margin: 0 auto 15px auto;
        }
        
        .title
        {
            display: inline;
            float: left;
            text-align: right;
            width: 20%;
        }
        
        span
        {
            width: 30%;
        }
        
        input, textarea
        {
            width: 70%;
            margin-left: -35px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            UE();
            UET();
        })

        function UE() {
            $("#url,#regex").bind("blur", function () {
                var url = $("#url").val();
                var regex = $("#regex").val();
                regex = $.base64.btoa(regex)
                if (url && regex) {
                    $.post("UEHandler.ashx?Action=UE", { URL: url, Regex: regex }, function (data) {
                        $("#rzt").val(data)
                    });
                }
            })
        }


        function UET() {
            $("#Source,#sregex").bind("blur", function () {
                var sc = $("#Source").val();
                var reg = $("#sregex").val();
                reg = $.base64.btoa(reg)
                if (sc && reg) {
                    $.post("UEHandler.ashx?Action=UET", { Source: sc, Regex: reg }, function (data) {
                        $("#srzt").val(data)
                    });
                }
            });
        }

    </script>
</head>
<body>
    <div class="main">
        <div class="container ">
            <div class="row clearfix">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#UE" data-toggle="tab">UE</a></li>
                    <li><a href="#UET" data-toggle="tab">UET</a></li>
                </ul>
                <div class="tab-content">
                    <div id="UE" class="active tab-pane">
                        <div class="item">
                            <div class="title">
                                URL:</div>
                            <input id="url" name="url" value="" />
                        </div>
                        <div class="item">
                            <div class="title">
                                Regex:</div>
                            <input id="regex" name="regex" value='' />
                        </div>
                        <div class="item">
                            <div class="title">
                                Result:</div>
                            <textarea id="rzt" name="rzt" style="height: 200px;"></textarea>
                        </div>
                    </div>
                    <div id="UET" class="tab-pane">
                        <div class="item">
                            <div class="title">
                                Source:</div>
                            <textarea id="Source" name="Source" style="height: 100px;"></textarea>
                        </div>
                        <div class="item">
                            <div class="title">
                                Regex:</div>
                            <input id="sregex" name="sregex" value='' />
                        </div>
                        <div class="item">
                            <div class="title">
                                Result:</div>
                            <textarea id="srzt" name="srzt" style="height: 200px;"></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
</body>
</html>
