using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class manager_User_Manager : System.Web.UI.Page
{
    public static string selVal;//设置查询条件
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
         
            if (Convert.ToBoolean(Session["Role"]))
            
                selVal = "";
                
            else
            {
                if (Session["UserID"] == null)
                {
                    Response.Write("<script>alert('请先登录！');location='../login/login.aspx'</script>");
                }
                else
                selVal = "where UserID=" + Session["UserID"].ToString();

            }
            DataListBind();
        }
    }

    //用于绑定DataList控件
    public void DataListBind()
    {
        //实例化公共类的对象
        DB db = new DB();
        //定义SQL语句
        string sqlstr = "select * from tb_User " + selVal;
        //实例化数据集DataTable用于存储查询结果
        DataTable dt = db.reDt(sqlstr);
        //绑定DataList控件
        DataList1.DataSource = dt;//设置数据源，用于填充控件中的项的值列表
        DataList1.DataBind();//将控件及其所有子控件绑定到指定的数据源
    }

    //显示EditTemplate模板
    protected void DataList1_EditCommand(object source, DataListCommandEventArgs e)
    {
        //设置DataList1控件的编辑项的索引为选择的当前索引
        DataList1.EditItemIndex = e.Item.ItemIndex;
        //数据绑定
        DataListBind();
    }

    //取消显示EditTemplate模板
    protected void DataList1_CancelCommand(object source, DataListCommandEventArgs e)
    {
        //设置DataList1控件的编辑项的索引为－1，即取消编辑
        DataList1.EditItemIndex = -1;
        //数据绑定
        DataListBind();
    }

    //修改用户密码
    protected void DataList1_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        //实例化公共类的对象
        DB db = new DB();
        //取得文本框中输入的内容
        string userName = ((Label)e.Item.FindControl("lblUserName_Mod_Pwd")).Text;
        string oldpassWord = ((TextBox)e.Item.FindControl("txtOldpwd")).Text;
        string newpassWord = ((TextBox)e.Item.FindControl("txtNewpwd")).Text;
        if (db.GetMD5(oldpassWord) == e.CommandArgument.ToString())
        {
            string sqlStr = "update tb_User set PassWord='" + db.GetMD5(newpassWord) + "'where UserName='" + userName + "'";
            //更新数据库，变量reValue用于保存执行Sql语句的返回值，成功为１，失败为０
            int reValue = db.sqlEx(sqlStr);

            if (reValue == 0)
                Response.Write("<script>alert('密码修改失败！');</script>");
            else
                Response.Write("<script>alert('密码修改成功！');</script>");
            //取消编辑状态
            DataList1.EditItemIndex = -1;
            DataListBind();
        }
        else
        {
            Response.Write("<script>alert('密码更改失败，请检查原始密码是否输入正确！');</script>");
        }
    }

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        //实例化公共类的对象
        DB db = new DB();
        //显示selectTemplate模板
        if (e.CommandName == "select")
        {
            //设置选中行的索引为当前选择行的索引
            DataList1.SelectedIndex = e.Item.ItemIndex;
            //数据绑定
            DataListBind();
        }
        //对selectTemplate模板中的用户名及Email信息进行更改
        if (e.CommandName == "updateName")
        {
            string UserName = ((Label)e.Item.FindControl("lblUserName_Mod_Infor")).Text;
            string Userxm = ((TextBox)e.Item.FindControl("txtUserxm")).Text;
            string Email = ((TextBox)e.Item.FindControl("txtEmail")).Text;
            string Mobi = ((TextBox)e.Item.FindControl("txtMobi")).Text;
            string Co = ((TextBox)e.Item.FindControl("txtCo")).Text;
            string De = ((TextBox)e.Item.FindControl("txtDe")).Text;
            string Regdate = ((Label)e.Item.FindControl("lbRegdate")).Text;
            string UserID = e.CommandArgument.ToString();
            string sqlStr = "update tb_User set Userxm='" + Userxm + "',Email='" + Email + "',Mobi='" + Mobi + "',Co='" + Co + "',De='" + De + "' where UserID=" + UserID;
            //更新数据库，变量reValue用于保存执行Sql语句的返回值，成功为１，失败为０
            int reValue = db.sqlEx(sqlStr);
            if (reValue == 0)
                Response.Write("<script>alert('用户信息修改失败！');</script>");

            //取消选择状态
            DataList1.SelectedIndex = -1;
            DataListBind();
        }
        //取消显示selectTemplate模板
        if (e.CommandName == "cancel")
        {
            //设置选中行的索引为-1,取消该数据项的选择
            DataList1.SelectedIndex = -1;
            //数据绑定
            DataListBind();
        }
        //设置用户的管理员权限
        if (e.CommandName == "setRole")
        {
            string userID = e.CommandArgument.ToString();
            string roleText = ((Button)e.Item.FindControl("btnSetRole")).Text;
            bool role = (roleText == "取消管理员权限" ? false : true);
            string sqlStr = "update tb_User set Role='" + role + "'where UserID=" + userID;
            //更新数据库，变量reValue用于保存执行Sql语句的返回值，成功为１，失败为０
            int reValue = db.sqlEx(sqlStr);

            if (reValue == 0)
                Response.Write("<script>alert('管理员设置失败！');</script>");
            //重新绑定
            DataListBind();
        }
    }
    //删除该条记录
    protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        //实例化公共类的对象
        DB db = new DB();
        string userID = e.CommandArgument.ToString();
        string sqlStr = "delete from tb_User where UserID=" + userID;
        //更新数据库，变量reValue用于保存执行Sql语句的返回值，成功为１，失败为０
        int reValue = db.sqlEx(sqlStr);
        if (reValue == 0)
            Response.Write("<script>alert('删除失败！');</script>");
        //重新绑定
        DataListBind();
    }
    //删除记录前显示提示信息
    protected void btnDelete_Load(object sender, EventArgs e)
    {
        ((Button)sender).Attributes["onclick"] = "javascript:return confirm('你确认要删除该条记录吗？')";
    }

    //根据用户权限判断该用户是否可以设置管理员
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (!Convert.ToBoolean(Session["Role"]))
        {
            switch (e.Item.ItemType)
            {
                case ListItemType.Item:
                    ((Button)e.Item.FindControl("btnSetRole")).Enabled = false;
                    break;
                case ListItemType.AlternatingItem:
                    ((Button)e.Item.FindControl("btnSetRole")).Enabled = false;
                    break;
            }
        }
    }
}
