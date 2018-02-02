<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Teacher_Manager_Add.aspx.cs" Inherits="manager_Teacher_Manager_Add" %>
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
    <title>录入教师信息</title>
</head>
<body>
   <form id="form1" runat="server">
   <div class="login">
      <h1>录入教师信息</h1>
        <p><asp:TextBox ID="txttid" runat="server" placeholder="工号"></asp:TextBox></p>
        <p><asp:TextBox ID="txttname" runat="server" placeholder="姓名"></asp:TextBox></p>
        <p><asp:TextBox ID="txtage" runat="server" placeholder="年龄"></asp:TextBox></p>
        <p><asp:TextBox ID="txtxl" runat="server" placeholder="学历"></asp:TextBox></p>
        <p><asp:TextBox ID="txtco" runat="server" placeholder="学院"></asp:TextBox></p>
        <p><asp:TextBox ID="txtde" runat="server" placeholder="系别"></asp:TextBox></p>
        <p><asp:TextBox ID="txtremark" runat="server" placeholder="备注"></asp:TextBox></p>
        <p align=center>备注信息可不填写</p>
        <p class="submit"><asp:button ID="btnOk" runat="server" text="录入教师信息" 
                onclick="btnOk_Click"/></p>
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
           ConflictDetection="CompareAllValues" 
           ConnectionString="<%$ ConnectionStrings:db_StudentConnectionString01 %>" 
           DeleteCommand="DELETE FROM [tb_Teacher] WHERE [Id] = @original_Id AND [Tid] = @original_Tid AND [Tname] = @original_Tname AND [Tage] = @original_Tage AND [Txl] = @original_Txl AND [TCo] = @original_TCo AND [TDe] = @original_TDe AND [Regdate] = @original_Regdate AND (([Remark] = @original_Remark) OR ([Remark] IS NULL AND @original_Remark IS NULL))" 
           InsertCommand="INSERT INTO [tb_Teacher] ([Tid], [Tname], [Tage], [Txl], [TCo], [TDe], [Regdate], [Remark]) VALUES (@Tid, @Tname, @Tage, @Txl, @TCo, @TDe, @Regdate, @Remark)" 
           OldValuesParameterFormatString="original_{0}" 
           SelectCommand="SELECT * FROM [tb_Teacher]" 
           
           
               UpdateCommand="UPDATE [tb_Teacher] SET [Tid] = @Tid, [Tname] = @Tname, [Tage] = @Tage, [Txl] = @Txl, [TCo] = @TCo, [TDe] = @TDe, [Regdate] = @Regdate, [Remark] = @Remark WHERE [Id] = @original_Id AND [Tid] = @original_Tid AND [Tname] = @original_Tname AND [Tage] = @original_Tage AND [Txl] = @original_Txl AND [TCo] = @original_TCo AND [TDe] = @original_TDe AND [Regdate] = @original_Regdate AND (([Remark] = @original_Remark) OR ([Remark] IS NULL AND @original_Remark IS NULL))">
           <DeleteParameters>
               <asp:Parameter Name="original_Id" Type="Int32" />
               <asp:Parameter Name="original_Tid" Type="String" />
               <asp:Parameter Name="original_Tname" Type="String" />
               <asp:Parameter Name="original_Tage" Type="String" />
               <asp:Parameter Name="original_Txl" Type="String" />
               <asp:Parameter Name="original_TCo" Type="String" />
               <asp:Parameter Name="original_TDe" Type="String" />
               <asp:Parameter Name="original_Regdate" Type="String" />
               <asp:Parameter Name="original_Remark" Type="String" />
           </DeleteParameters>
           <UpdateParameters>
               <asp:Parameter Name="Tid" Type="String" />
               <asp:Parameter Name="Tname" Type="String" />
               <asp:Parameter Name="Tage" Type="String" />
               <asp:Parameter Name="Txl" Type="String" />
               <asp:Parameter Name="TCo" Type="String" />
               <asp:Parameter Name="TDe" Type="String" />
               <asp:Parameter Name="Regdate" Type="String" />
               <asp:Parameter Name="Remark" Type="String" />
               <asp:Parameter Name="original_Id" Type="Int32" />
               <asp:Parameter Name="original_Tid" Type="String" />
               <asp:Parameter Name="original_Tname" Type="String" />
               <asp:Parameter Name="original_Tage" Type="String" />
               <asp:Parameter Name="original_Txl" Type="String" />
               <asp:Parameter Name="original_TCo" Type="String" />
               <asp:Parameter Name="original_TDe" Type="String" />
               <asp:Parameter Name="original_Regdate" Type="String" />
               <asp:Parameter Name="original_Remark" Type="String" />
           </UpdateParameters>
           <InsertParameters>
               <asp:Parameter Name="Tid" Type="String" />
               <asp:Parameter Name="Tname" Type="String" />
               <asp:Parameter Name="Tage" Type="String" />
               <asp:Parameter Name="Txl" Type="String" />
               <asp:Parameter Name="TCo" Type="String" />
               <asp:Parameter Name="TDe" Type="String" />
               <asp:Parameter Name="Regdate" Type="String" />
               <asp:Parameter Name="Remark" Type="String" />
           </InsertParameters>
       </asp:SqlDataSource>
    </div>
    <div class="login-help">
    <span style="color:red">以上内容请正确填写，否则无法完成教师信息录入</span>
      <p><a href=Manager.aspx>返回到管理页面</a></p>
      <p>Copyright © 2017 Zhangyj All Rights Reseved.</p>
      <p>辽ICP备16016442号</p>
    </div>
    </form>
</body>
</html>
