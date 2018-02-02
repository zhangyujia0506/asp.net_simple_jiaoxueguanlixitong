using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class manager_Teacher_Manager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Write("<script>alert('请先登录！');location='../login/login.aspx'</script>");
        }
    }
    protected void Button_add_Click(object sender, EventArgs e)
    {
        Response.Redirect("Teacher_Manager_Add.aspx");
    }
    protected void Button_look_Click(object sender, EventArgs e)
    {
        Response.Redirect("Teacher_Manager_Mod.aspx");
    }
}
