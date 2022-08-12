<%@ Language="javascript" CODEPAGE="65001"%>
<%Response.Charset="utf-8"%>
<%
    // 获取表单账号密码
    var email = Request.Form("txtEmail").Item;
    var pwd = Request.Form("txtPassword").Item;
    
   //连接数据库
    var mycon = new ActiveXObject("ADODB.Connection");
    mycon.Open("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("./database/Binggo.accdb"));
    //数据库查询语句，验证账号密码
    var sql = "SELECT * FROM Users WHERE Email = '" + email + "' AND Password2 = '" + pwd + "'";
    //创建数据库记录集
    var recUser = new ActiveXObject("ADODB.Recordset");
    recUser.Open(sql, mycon);
    if (recUser.EOF)
    {
        //没有找到数据
        recUser.Close();
        mycon.Close();
        Session("RefUser") = "";
        Session("UserName")="";
        Session("MESSAGE") = "账号或秘密不正确!";
        Response.write(" <script> alert('用户或密码不正确，请重新输入.');this.location.href='login.asp';</script>");
        
    }
    else
    {
        if(recUser.Fields("isDeleted").Value){
            Session("MESSAGE") = "您的账号已被封禁，请联系管理员处理"; 
            Response.write("<script>alert('您的账号已被封禁，请联系管理员处理');</script>");
            Response.Redirect("login.asp");
            
        }else
        // Session存用户信息
        Session("RefUser") = recUser.Fields("RefUser").Value;
        Session("UserName")= recUser.Fields("UserName").Value;
        Session("isALimited")= recUser.Fields("isALimited").Value;
        Session("isBLimited")= recUser.Fields("isBLimited").Value;
        Session("BlackBlock")= recUser.Fields("BlackBlock").Value;
        Session("MESSAGE") = "";
    }
    // 关闭数据集合数据库连接
    recUser.Close();
    mycon.Close();
    // 跳转页面
    Response.Redirect("binggohome.asp");
%>
