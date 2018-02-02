<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_Manager.aspx.cs" Inherits="manager_User_Manager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<!--兼容性问题-->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en"> <!--<![endif]-->
<!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<head id="Head1" runat="server">
<link rel="stylesheet" href="../css/Manager_style.css">
<meta charset="utf-8">
    <title>用户管理</title>
</head>
<body>
   <form id="form1" runat="server">
   <div class="login">
      <h1>用户管理</h1>
        <p align="center">
        <table style="font-size: 9pt; width: 620px;  border-right: #0ca3d2 1px;border-left: #0ca3d2 1px; text-align: center; border-top:#0ca3d2 1px; border-bottom:#0ca3d2 1px;" cellpadding="0" cellspacing="0">
            <tr>
                <td style="height: auto">
                
                    <asp:DataList ID="DataList1" runat="server" CellPadding="4" ForeColor="#333333" OnEditCommand="DataList1_EditCommand" OnCancelCommand="DataList1_CancelCommand" OnUpdateCommand="DataList1_UpdateCommand" OnDeleteCommand="DataList1_DeleteCommand" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound" Font-Size="9pt">
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                       <ItemTemplate>
                            <table style="width: 620px; font-size: 9pt;">
                                <tr>
                                    <td style="width: 124px">
                                        <asp:LinkButton ID="lnkbtnUserName" runat="server" CommandName="select" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'></asp:LinkButton></td>
                                    <td style="width: 124px">
                                        <asp:Label ID="Label2" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"Email")%>'></asp:Label></td>
                                    <td style="width: 124px">
                                        <asp:CheckBox ID="chkRole" Checked ='<%#DataBinder.Eval(Container.DataItem,"Role")%>' runat="server" Enabled="False" /></td>
                                    <td style="width: 124px">
                                        <asp:Button ID="btnEdit" runat="server" CommandName="edit" Text="修改密码" />
                                       
                                        <asp:Button ID="btnDelete" runat="server" CommandName="delete" Text="删除用户" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"UserID") %>' OnLoad="btnDelete_Load" /></td>
                                    <td style="width: 124px">
                                        <asp:Button ID="btnSetRole" runat="server" CommandName="setRole" Text='<%# (bool) DataBinder.Eval(Container.DataItem,"Role")==true?"取消管理员权限":"设为管理员权限" %>' CommandArgument = '<%# DataBinder.Eval(Container.DataItem,"UserID") %>'/></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        
                        <EditItemTemplate>
                             <table style="width: 620px; font-size: 9pt;">
                                <tr>
                                    <td style="width: 75px; height: 19px;">
                                        用户名：</td>
                                    <td style="height: 19px;" colspan="2">
                                        <asp:Label ID="lblUserName_Mod_Pwd" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 75px">
                                        请输入原始密码：</td>
                                    <td colspan="2">
                                        <asp:TextBox ID="txtOldpwd" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                                        </td>
                                </tr>
                                <tr>
                                    <td style="width: 75px">
                                        请输入新密码：</td>
                                    <td colspan="2">
                                        <asp:TextBox ID="txtNewpwd" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                                        </td>
                                </tr>
                                <tr>
                                    <td style="width: 75px">
                                        请再次输入新密码：</td>
                                    <td colspan="2">
                                        <asp:TextBox ID="txtRepwd" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                                        </td>
                                </tr>
                                <tr>
                                    <td style="width: 75px">
                                    </td>
                                    <td style="width: 131px">
                                        <asp:Button ID="btnUpdate" runat="server" CommandName="update" CommandArgument = '<%#DataBinder.Eval(Container.DataItem,"PassWord")%>' Text="确定" />
                                        <asp:Button ID="btnCancel" runat="server" CommandName="cancel" Text="取消" CausesValidation="False" /></td>
                                    <td style="width: 95px">
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                        
                        <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                        
                        <ItemStyle BackColor="#EBF6FD" ForeColor="#333333" />
                        
                        <HeaderTemplate>
                            <table style="width: 620px; font-size: 9pt;">
                                <tr>
                                    <td style="width: 124px">
                                        用户名</td>
                                    <td style="width: 124px">
                                        电子邮件</td>
                                    <td style="width: 124px">
                                        是否为管理员</td>
                                    <td style="width: 124px;">
                                        操作</td>
                                    <td style="width: 124px">
                                        管理员设置</td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        
                        <HeaderStyle BackColor="#0ca3d2" Font-Bold="True" ForeColor="White" />
                        
                        <SelectedItemTemplate>
                           <table style="width: 620px;font-size: 9pt;">
                                <tr>
                                    <td>
                                        用户名：</td>
                                    <td>
                                        <asp:Label ID="lblUserName_Mod_Infor" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>
                                        姓名：</td>
                                    <td>
                                        <asp:TextBox ID="txtUserxm" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Userxm") %>'
                                            Width="150px"></asp:TextBox>
                                        </td>
                                </tr>
                                <tr>
                                   <td>
                                        电子邮箱：</td>
                                   <td>
                                        <asp:TextBox ID="txtEmail" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Email") %>'
                                            Width="150px"></asp:TextBox>
                                        </td>
                                </tr>
                                <tr>
                                    <td>
                                        手机：</td>
                                    <td>
                                        <asp:TextBox ID="txtMobi" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Mobi") %>'
                                            Width="150px"></asp:TextBox>
                                        </td>
                                </tr>
                                <tr>
                                   <td>
                                        学院：</td>
                                    <td>
                                        <asp:TextBox ID="txtCo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Co") %>'
                                            Width="150px"></asp:TextBox>
                                        </td>
                                </tr>
                                <tr>
                                    <td>
                                        系别：</td>
                                    <td>
                                        <asp:TextBox ID="txtDe" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"De") %>'
                                            Width="150px"></asp:TextBox>
                                        </td>
                                </tr>
                                 <tr>
                                    <td>
                                        注册时间：</td>
                                    <td>
                                        <asp:Label ID="lbRegdate" runat="server" 
                                            Text='<%# DataBinder.Eval(Container.DataItem,"Regdate") %>'></asp:Label>
                                        </td>
                                </tr>
                                <tr>
                                    <td style="width: 58px">
                                    </td>
                                    <td style="width: 131px">
                                        <asp:Button ID="btnUpdateName" runat="server" CommandName="updateName" CommandArgument = '<%# DataBinder.Eval(Container.DataItem,"UserID") %>' Text="确定" Width="84px" />
                                        <asp:Button ID="btnCancel" runat="server" CommandName="cancel" Text="取消" CausesValidation="False" /></td>
                                </tr>
                            </table>
                        </SelectedItemTemplate>
                        
                    </asp:DataList></td>
            </tr>

        </table>
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
