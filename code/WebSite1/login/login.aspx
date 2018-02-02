<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login_login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<!--兼容性问题-->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en"> <!--<![endif]-->
<!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<head runat="server">
<link rel="stylesheet" href="../css/style.css">
<meta charset="utf-8">
    <title>用户登录</title>
</head>
<body>
   <form id="form1" runat="server">
   <div class="login">
      <h1>用户登录</h1>
        <p><asp:TextBox ID="txtUserName" runat="server" placeholder="用户名"></asp:TextBox></p>
        <p><asp:TextBox ID="txtPwd" runat="server" TextMode=Password placeholder="密码"></asp:TextBox></p>
        <p><asp:TextBox ID="txtValidateNum" runat="server" placeholder="验证码"></asp:TextBox></p>
        <p><asp:Image ID="Image2" runat="server" Height="22px" Width="58px" ImageUrl="ValidateNum.aspx" /></p>
        <p class="submit"><asp:button ID="btnLogin" runat="server" text="登录" onclick="btnLogin_Click" /></p>
    </div>
    
    <div class="login-help">
      <p><a href="../index.aspx">返回到首页</a></p>
      <p>Copyright © 2017 Zhangyj All Rights Reseved.</p>
      <p>辽ICP备16016442号</p>
    </div>
    
    </form>
</body>
</html>
