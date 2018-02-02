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
using System.Drawing;//引入命名空间

public partial class ValidateNum : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string validateNum = CreateRandomNum(4);//成生4位随机字符串
            CreateImage(validateNum);//将生成的随机字符串绘成图片
            Session["ValidateNum"] = validateNum;//保存验证码
        }
    }
    //生成随机字符串
    private string CreateRandomNum(int NumCount)
    {
        string allChar = "0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,W,X,Y,Z";
        string[] allCharArray = allChar.Split(',');//拆分成数组
        string randomNum = "";
        int temp = -1;//记录上次随机数的数值，尽量避免产生几个相同的随机数

        Random rand = new Random();
        for (int i = 0; i < NumCount; i++)
        {
            if (temp != -1)
            {
                rand = new Random(i * temp * ((int)DateTime.Now.Ticks));
            }
            int t = rand.Next(35);
            if (temp == t)
            {
                return CreateRandomNum(NumCount);
            }
            temp = t;
            randomNum += allCharArray[t];
        }
        return randomNum;
    }
    //生成图片
    private void CreateImage(string validateNum)
    {
        if (validateNum == null || validateNum.Trim() == String.Empty)
            return;
        //生成Bitmap图像
        System.Drawing.Bitmap image = new System.Drawing.Bitmap(validateNum.Length * 12 + 10, 22);
        Graphics g = Graphics.FromImage(image);

        try
        {
            //生成随机生成器 
            Random random = new Random();

            //清空图片背景色 
            g.Clear(Color.White);

            //画图片的背景噪音线 
            for (int i = 0; i < 25; i++)
            {
                int x1 = random.Next(image.Width);
                int x2 = random.Next(image.Width);
                int y1 = random.Next(image.Height);
                int y2 = random.Next(image.Height);

                g.DrawLine(new Pen(Color.Silver), x1, y1, x2, y2);
            }

            Font font = new System.Drawing.Font("Arial", 12, (System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic));
            System.Drawing.Drawing2D.LinearGradientBrush brush = new System.Drawing.Drawing2D.LinearGradientBrush(new Rectangle(0, 0, image.Width, image.Height), Color.Blue, Color.DarkRed, 1.2f, true);
            g.DrawString(validateNum, font, brush, 2, 2);

            //画图片的前景噪音点 
            for (int i = 0; i < 100; i++)
            {
                int x = random.Next(image.Width);
                int y = random.Next(image.Height);

                image.SetPixel(x, y, Color.FromArgb(random.Next()));
            }

            //画图片的边框线 
            g.DrawRectangle(new Pen(Color.Silver), 0, 0, image.Width - 1, image.Height - 1);

            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            //将图像保存到指定的流
            image.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
            Response.ClearContent();
            Response.ContentType = "image/Gif";
            Response.BinaryWrite(ms.ToArray());
        }
        finally
        {
            g.Dispose();
            image.Dispose();
        }
    }
}
