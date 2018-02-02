<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Course_Manager_Mod.aspx.cs" Inherits="manager_Course_Manager_Mod" %>

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
    <title>课程信息管理</title>
</head>
<body>
   <form id="form1" runat="server">
   <div class="login">
      <h1>课程信息管理</h1>
        <p align="center">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" 
                AutoGenerateColumns="False" DataKeyNames="id" 
                DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" 
                GridLines="None" Width=788px OnRowDataBound="GridView1_RowDataBound">
            <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
            <Columns>
                <asp:BoundField DataField="cid" HeaderText="课程号" SortExpression="cid" />
                <asp:BoundField DataField="cname" HeaderText="课程名" SortExpression="cname" />
                <asp:BoundField DataField="ctime" HeaderText="学时" SortExpression="ctime" />
                <asp:BoundField DataField="ckcxz" HeaderText="课程性质" SortExpression="ckcxz" />
                <asp:BoundField DataField="class" HeaderText="授课班级" SortExpression="class" />
                <asp:BoundField DataField="Tname" HeaderText="授课教师" 
                    SortExpression="Tname" />
                <asp:BoundField DataField="Regdate" HeaderText="录入日期" 
                    SortExpression="Regdate" />
                <asp:BoundField DataField="Remark" HeaderText="备注" 
                    SortExpression="Remark" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    ShowSelectButton="True"  HeaderText="操作"/>
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
                ConnectionString="<%$ ConnectionStrings:db_StudentConnectionString02 %>" 
                DeleteCommand="DELETE FROM [tb_Course] WHERE [id] = @original_id AND [cid] = @original_cid AND [cname] = @original_cname AND [ctime] = @original_ctime AND [ckcxz] = @original_ckcxz AND [class] = @original_class AND [Tname] = @original_Tname AND [Regdate] = @original_Regdate AND (([Remark] = @original_Remark) OR ([Remark] IS NULL AND @original_Remark IS NULL))" 
                InsertCommand="INSERT INTO [tb_Course] ([cid], [cname], [ctime], [ckcxz], [class], [Tname], [Regdate], [Remark]) VALUES (@cid, @cname, @ctime, @ckcxz, @class, @Tname, @Regdate, @Remark)" 
                OldValuesParameterFormatString="original_{0}" 
                SelectCommand="SELECT * FROM [tb_Course]" 
                
                
                UpdateCommand="UPDATE [tb_Course] SET [cid] = @cid, [cname] = @cname, [ctime] = @ctime, [ckcxz] = @ckcxz, [class] = @class, [Tname] = @Tname, [Regdate] = @Regdate, [Remark] = @Remark WHERE [id] = @original_id AND [cid] = @original_cid AND [cname] = @original_cname AND [ctime] = @original_ctime AND [ckcxz] = @original_ckcxz AND [class] = @original_class AND [Tname] = @original_Tname AND [Regdate] = @original_Regdate AND (([Remark] = @original_Remark) OR ([Remark] IS NULL AND @original_Remark IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_id" Type="Int32" />
                    <asp:Parameter Name="original_cid" Type="String" />
                    <asp:Parameter Name="original_cname" Type="String" />
                    <asp:Parameter Name="original_ctime" Type="String" />
                    <asp:Parameter Name="original_ckcxz" Type="String" />
                    <asp:Parameter Name="original_class" Type="String" />
                    <asp:Parameter Name="original_Tname" Type="String" />
                    <asp:Parameter Name="original_Regdate" Type="String" />
                    <asp:Parameter Name="original_Remark" Type="String" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="cid" Type="String" />
                    <asp:Parameter Name="cname" Type="String" />
                    <asp:Parameter Name="ctime" Type="String" />
                    <asp:Parameter Name="ckcxz" Type="String" />
                    <asp:Parameter Name="class" Type="String" />
                    <asp:Parameter Name="Tname" Type="String" />
                    <asp:Parameter Name="Regdate" Type="String" />
                    <asp:Parameter Name="Remark" Type="String" />
                    <asp:Parameter Name="original_id" Type="Int32" />
                    <asp:Parameter Name="original_cid" Type="String" />
                    <asp:Parameter Name="original_cname" Type="String" />
                    <asp:Parameter Name="original_ctime" Type="String" />
                    <asp:Parameter Name="original_ckcxz" Type="String" />
                    <asp:Parameter Name="original_class" Type="String" />
                    <asp:Parameter Name="original_Tname" Type="String" />
                    <asp:Parameter Name="original_Regdate" Type="String" />
                    <asp:Parameter Name="original_Remark" Type="String" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="cid" Type="String" />
                    <asp:Parameter Name="cname" Type="String" />
                    <asp:Parameter Name="ctime" Type="String" />
                    <asp:Parameter Name="ckcxz" Type="String" />
                    <asp:Parameter Name="class" Type="String" />
                    <asp:Parameter Name="Tname" Type="String" />
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