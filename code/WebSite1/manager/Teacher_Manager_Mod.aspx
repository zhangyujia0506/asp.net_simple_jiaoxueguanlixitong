<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Teacher_Manager_Mod.aspx.cs" Inherits="manager_Teacher_Manager_Mod" %>

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
<link rel="stylesheet" href="../css/Gr_Manager_style.css">
<meta charset="utf-8">
    <title>用户管理</title>
</head>
<body>
   <form id="form1" runat="server">
   <div class="login">
      <h1>教师信息管理</h1>
        <p align="center">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" 
                AutoGenerateColumns="False" DataKeyNames="Id" 
                DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" 
                GridLines="None" Width=788px OnRowDataBound="GridView1_RowDataBound">
            <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
            <Columns>
                <asp:BoundField DataField="Tid" HeaderText="工号" SortExpression="Tid" />
                <asp:BoundField DataField="Tname" HeaderText="姓名" SortExpression="Tname" />
                <asp:BoundField DataField="Tage" HeaderText="年龄" SortExpression="Tage" />
                <asp:BoundField DataField="Txl" HeaderText="学历" SortExpression="Txl" />
                <asp:BoundField DataField="TCo" HeaderText="所在学院" SortExpression="TCo" />
                <asp:BoundField DataField="TDe" HeaderText="所在院系" SortExpression="TDe" />
                <asp:BoundField DataField="Regdate" HeaderText="入职日期" 
                    SortExpression="Regdate" />
                <asp:BoundField DataField="Remark" HeaderText="备注" 
                    SortExpression="Remark" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    ShowSelectButton="True" HeaderText="操作" />
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
            <PagerStyle BackColor="#0ca3d2" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#0ca3d2" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"/>
            <EditRowStyle BackColor="#2461BF" HorizontalAlign="Center"/>
            <AlternatingRowStyle BackColor="White" HorizontalAlign="Center" />
            </asp:GridView>
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
        </p>
    </div>
    <div class="login-help">
     <p><a href=Manager.aspx>返回到管理页面</a></p>
     <p>Copyright © 2017 Zhangyj All Rights Reseved.</p>
     <p>辽ICP备16016442号</p>
    </div>
    </form>
</body>
</html>