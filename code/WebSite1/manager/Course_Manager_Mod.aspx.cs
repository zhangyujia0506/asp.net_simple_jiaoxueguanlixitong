using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class manager_Course_Manager_Mod : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Write("<script>alert('请先登录！');location='../login/login.aspx'</script>");
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if ((e.Row.RowState == (DataControlRowState.Edit | DataControlRowState.Alternate)) || (e.Row.RowState == DataControlRowState.Edit))
        {
            TextBox curText;
            for (int i = 0; i < 8; i++)
            {
                curText = (TextBox)e.Row.Cells[i].Controls[0];
                curText.Width = Unit.Pixel(50);
                curText.Height = Unit.Pixel(20);
                curText.Font.Size = FontUnit.Small;
            }
        }
    }
}
