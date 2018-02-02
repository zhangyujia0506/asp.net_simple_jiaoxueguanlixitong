<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Course_Manager_Add.aspx.cs" Inherits="manager_Course_Manager_Add" %>
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
    <title>录入课程信息</title>
</head>
<body>
   <form id="form1" runat="server">
   <div class="login">
      <h1>录入课程信息</h1>
        <p><asp:TextBox ID="txtcid" runat="server" placeholder="课程编号"></asp:TextBox></p>
        <p><asp:TextBox ID="txtcname" runat="server" placeholder="课程名称"></asp:TextBox></p>
        <p><asp:TextBox ID="txtctime" runat="server" placeholder="学时"></asp:TextBox></p>
        <p>课程性质<asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Value="必修">必修</asp:ListItem>
            <asp:ListItem Value="选修">选修</asp:ListItem>
            </asp:DropDownList>
        </p>
        <p><asp:TextBox ID="txtclass" runat="server" placeholder="授课班级"></asp:TextBox></p>
        <p><asp:TextBox ID="txttname" runat="server" placeholder="授课教师"></asp:TextBox></p>
        <p><asp:TextBox ID="txtremark" runat="server" placeholder="备注"></asp:TextBox></p>
        <p align=center>备注信息可不填写</p>
        <p class="submit"><asp:button ID="btnOk" runat="server" text="录入课程信息" 
                onclick="btnOk_Click"/></p>
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
         
    </div>
   
    <div class="login-help">
    <span style="color:red">以上内容请正确填写，否则无法完成课程信息录入</span>
      <p><a href=Manager.aspx>返回到管理页面</a></p>
      <p>Copyright © 2017 Zhangyj All Rights Reseved.</p>
      <p>辽ICP备16016442号</p>
    </div>
    </form>
</body>
</html>
