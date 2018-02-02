<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="login_register" %>
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
    <title>用户注册</title>
</head>
<body>
   <form id="form1" runat="server">
   <div class="login">
      <h1>用户注册</h1>
        <p><asp:TextBox ID="txtUserName" runat="server" placeholder="用户名"></asp:TextBox></p>
        <p><asp:LinkButton ID="lnkbtnCheck" runat="server" CausesValidation="False" 
                onclick="lnkbtnCheck_Click">检测用户名是否被注册</asp:LinkButton>&nbsp&nbsp&nbsp&nbsp<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" ErrorMessage="请输入用户名"></asp:RequiredFieldValidator></p>
        <p><asp:TextBox ID="txtUserxm" runat="server" placeholder="姓名"></asp:TextBox></p>
        <p><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUserxm" ErrorMessage="请输入姓名"></asp:RequiredFieldValidator></p>
        <p><asp:TextBox ID="txtPwd" runat="server" TextMode=Password placeholder="密码"></asp:TextBox></p>
        <p><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPwd" ErrorMessage="请输入密码"></asp:RequiredFieldValidator></p>
        <p><asp:TextBox ID="txtRepwd" runat="server" TextMode=Password placeholder="确认密码"></asp:TextBox></p>
        <p><asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPwd" ControlToValidate="txtRepwd" ErrorMessage="两次输入密码不一致"></asp:CompareValidator></p>
        <p><asp:TextBox ID="txtEmail" runat="server" placeholder="电子邮箱"></asp:TextBox></p>
        <p><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="电子邮箱格式不正确" ValidationExpression="^[0-9a-z_]+@(([0-9a-z]+)[.]){1,2}[a-z]{2,3}$"></asp:RegularExpressionValidator></p>
        <p><asp:TextBox ID="txtMobi" runat="server" placeholder="手机号"></asp:TextBox></p>
        <p><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"  ControlToValidate="txtMobi" ErrorMessage="手机号格式不正确"  ValidationExpression="^1\d{10}$"></asp:RegularExpressionValidator></p>
        <p><asp:TextBox ID="txtCo" runat="server" placeholder="学院"></asp:TextBox></p>
        <p><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCo" ErrorMessage="请输入您的所在学院"></asp:RequiredFieldValidator></p>
        <p><asp:TextBox ID="txtDe" runat="server" placeholder="系别"></asp:TextBox></p>
        <p><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDe" ErrorMessage="请输入您的所在系别"></asp:RequiredFieldValidator></p>
        <p class="submit"><asp:button ID="btnOk" runat="server" text="注册" onclick="btnOk_Click"/></p>
    </div>
    <div class="login-help">
    <span style="color:red">以上内容为必填项，请正确填写，否则无法完成注册</span>
      <p><a href="login.aspx">返回到登录页</a></p>
      <p>Copyright © 2017 Zhangyj All Rights Reseved.</p>
      <p>辽ICP备16016442号</p>
    </div>
    </form>
</body>
</html>
