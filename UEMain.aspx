<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UEMain.aspx.vb" Inherits="UE.UEMain" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title></title>
    <script src="js/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="js/jquery.base64.js" type="text/javascript"></script>
    <style type="text/css">
        .main
        {
            margin: 15% auto;
            text-align: center;
        }
        .item
        {
            width: 50%;
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
            $("#url,#regex").bind("change", function () {
                //var name = this.name;
                //debugger;
                var url = $("#url").val();
                var regex = $("#regex").val();
                alert($.base64.btoa(regex));
                regex = $.base64.btoa(regex) 
                if (url && regex) {
                    $.post("UEHandler.ashx?Action=UE", { URL: url, Regex: regex }, function (data) {
                        $("#rzt").val(data)
                    });
                }
            })
        })
    </script>
</head>
<body>
    <div class="main">
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
        <div>
</body>
</html>
