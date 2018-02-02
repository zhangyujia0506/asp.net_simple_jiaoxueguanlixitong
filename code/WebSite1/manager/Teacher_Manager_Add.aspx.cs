using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class manager_Teacher_Manager_Add : System.Web.UI.Page
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
        SqlDataSource1.InsertParameters.Add("Tid", this.txttid.Text);
        SqlDataSource1.InsertParameters.Add("Tname", this.txttname.Text);
        SqlDataSource1.InsertParameters.Add("Tage", this.txtage.Text);
        SqlDataSource1.InsertParameters.Add("Txl", this.txtxl.Text);
        SqlDataSource1.InsertParameters.Add("TCo", this.txtco.Text);
        SqlDataSource1.InsertParameters.Add("TDe", this.txtde.Text);
        SqlDataSource1.InsertParameters.Add("Regdate", DateTime.Now.ToString());
        SqlDataSource1.InsertParameters.Add("Remark", this.txtremark.Text);
        SqlDataSource1.Insert();
        Response.Write("<script>alert('录入教师信息成功');location='Teacher_Manager.aspx'</script>");
    }
}
