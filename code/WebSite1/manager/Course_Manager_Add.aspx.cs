using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class manager_Course_Manager_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {
            Response.Write("<script>alert('请先登录！');location='../login/login.aspx'</script>");
        }
    }
    protected void btnOk_Click(object sender, EventArgs e)
    {
        SqlDataSource1.InsertParameters.Clear();
        SqlDataSource1.InsertParameters.Add("cid", this.txtcid.Text);
        SqlDataSource1.InsertParameters.Add("cname", this.txtcname.Text);
        SqlDataSource1.InsertParameters.Add("ctime", this.txtctime.Text);
        SqlDataSource1.InsertParameters.Add("ckcxz", this.DropDownList1.SelectedValue);
        SqlDataSource1.InsertParameters.Add("class", this.txtclass.Text);
        SqlDataSource1.InsertParameters.Add("Tname", this.txttname.Text);
        SqlDataSource1.InsertParameters.Add("Regdate", DateTime.Now.ToString());
        SqlDataSource1.InsertParameters.Add("Remark", this.txtremark.Text);
        SqlDataSource1.Insert();
        Response.Write("<script>alert('录入课程信息成功');location='Course_Manager.aspx'</script>");
    }
}
