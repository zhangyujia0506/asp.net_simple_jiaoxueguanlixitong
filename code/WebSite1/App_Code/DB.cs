using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using System.Text;
using System.Security.Cryptography;//MD5加密需引入的命名空间
using System.Data.SqlClient;//数据库操作需引入的命名空间

/// <summary>
/// DB 的摘要说明
/// </summary>
public class DB
{
	public DB()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    /// <summary>
    /// 连接数据库
    /// </summary>
    /// <returns>返回SqlConnection对象</returns>
    public SqlConnection GetCon()
    {
        return new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"].ToString());
    }

    /// <summary>
    /// 执行SQL语句
    /// </summary>
    ///<param name="cmdstr">SQL语句</param>
    /// <returns>返回值为int型：成功返1，失败返回0</returns>
    public int sqlEx(string cmdstr)
    {
        SqlConnection con = GetCon();//连接数据库
        con.Open();//打开连接
        SqlCommand cmd = new SqlCommand(cmdstr, con);
        try
        {
            cmd.ExecuteNonQuery();//执行SQL 语句并返回受影响的行数
            return 1;//成功返回１
        }
        catch (Exception e)
        {
            return 0;//失败返回０
        }
        finally
        {
            con.Dispose();//释放连接对象资源
        }
    }
    
    /// <summary>
    /// 执行SQL查询语句
    /// </summary>
    /// <param name="cmdstr">查询语句</param>
    /// <returns>返回DataTable数据表</returns>
    public DataTable reDt(string cmdstr)
    {
        SqlConnection con =GetCon();
        SqlDataAdapter da = new SqlDataAdapter(cmdstr, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        return (ds.Tables[0]);
    }
    /// <summary>
    /// 执行SQL查询语句
    /// </summary>
    /// <param name="str">查询语句</param>
    /// <returns>返回SqlDataReader对象dr</returns>
    public SqlDataReader reDr(string str)
    {
        SqlConnection conn = GetCon();//连接数据库
        conn.Open();//并打开了连接
        SqlCommand com = new SqlCommand(str, conn);
        SqlDataReader dr = com.ExecuteReader(CommandBehavior.CloseConnection);
        return dr;//返回SqlDataReader对象dr
    }
    /// <summary>
    /// MD5加密
    /// </summary>
    /// <param name="strPwd">被加密的字符串</param>
    /// <returns>返回加密后的字符串</returns>
    public string GetMD5(string strPwd)
    {
        string pwd = "";
        //实例化一个md5对象
        MD5 md5 = MD5.Create();
        // 加密后是一个字节类型的数组，这里要注意编码UTF8/Unicode等的选择
        byte[] s = md5.ComputeHash(Encoding.UTF8.GetBytes(strPwd));
        //翻转生成的MD5码        
        s.Reverse();    
        //通过使用循环，将字节类型的数组转换为字符串，此字符串是常规字符格式化所得
        //只取MD5码的一部分，这样恶意访问者无法知道取的是哪几位
        for (int i = 3; i < s.Length - 1; i++) 
        {
            //将得到的字符串使用十六进制类型格式。格式后的字符是小写的字母，如果使用大写（X）则格式后的字符是大写字符
            //进一步对生成的MD5码做一些改造
            pwd = pwd + (s[i] < 198 ? s[i] + 28 : s[i]).ToString("X"); 
        }
        return pwd;
    }
}
