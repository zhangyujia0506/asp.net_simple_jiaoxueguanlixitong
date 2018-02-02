using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class manager_Manager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Write("<script>alert('请先登录！');location='../login/login.aspx'</script>");
        }
    }
    protected void lnkbtnExit_Click(object sender, EventArgs e)
    {
        //清空Session中的内容,并停止Session
        Session["ValidateNum"] = null;
        Session["Role"] = null;
        Session["UserID"] = null;
        Session.Clear();
        Session.Abandon();
        //跳转到登录页
        Response.Redirect("../index.aspx");

    }
    protected void Button_User_Click(object sender, EventArgs e)
    {
        Response.Redirect("User_Manager.aspx");
    }
    protected void Button_Teacher_Click(object sender, EventArgs e)
    {
        Response.Redirect("Teacher_Manager.aspx");
    }
    protected void Button_Course_Click(object sender, EventArgs e)
    {
        Response.Redirect("Course_Manager.aspx");
    }
}
