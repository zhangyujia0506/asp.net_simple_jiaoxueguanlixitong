<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Manager.aspx.cs" Inherits="manager_Manager" %>

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
    <title>管理界面</title>
</head>
<body>
   <form id="form1" runat="server">
   <div class="login">
      <h1>请选择</h1>
        <p align=center><asp:Button ID="Button_User" runat="server" Text="用户管理" 
                onclick="Button_User_Click" /></p>
        <p align=center><asp:Button ID="Button_Teacher" runat="server" Text="教师管理" 
                onclick="Button_Teacher_Click" /></p>
        <p align=center><asp:Button ID="Button_Course" runat="server" Text="课程管理" 
                onclick="Button_Course_Click" /></p>
    </div>
    <div class="login-help">
      <p><asp:LinkButton ID="lnkbtnExit" runat="server" OnClick="lnkbtnExit_Click">退出登录</asp:LinkButton></p>
      <p>Copyright © 2017 Zhangyj All Rights Reseved.</p>
      <p>辽ICP备16016442号</p>
    </div>
    </form>
</body>
</html>
