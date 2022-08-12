<%@ Language="javascript" CODEPAGE="65001"%>
<%Response.Charset="utf-8"%>

<%
var email = Request.Form("email");
var password = Request.Form("password");
var tel = Request.Form("tel");

    var mycon = new ActiveXObject("ADODB.Connection");
    mycon.Open("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("./database/Binggo.accdb"));
    
    var valisql = "select * FROM Users WHERE Email='"+email+"'and telephone='"+tel+"'";
    

    var recUser = new ActiveXObject("ADODB.Recordset");
    recUser.Open(valisql, mycon);

    if (recUser.EOF)
    {
        //没有找到数据
        recUser.Close();
        
       
        Response.write(" <script> alert('邮箱和手机不匹配，请重新输入.');this.location.href='resetPassword.asp';</script>");
        mycon.Close();
    }


    var sql = "UPDATE Users SET Password2='"+password+"'  WHERE telephone='" +tel+"'and Email='"+email+"'";
    
    Response.write("修改密码成功！");

    
    mycon.Execute(sql);
    mycon.Close();
    Response.Redirect("login.asp");
%>