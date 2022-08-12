<%@ Language="javascript" CODEPAGE="65001"%>
<%Response.Charset="utf-8"%>
<%
    var sql = "";
    var mycon = new ActiveXObject("ADODB.Connection");
    mycon.Open("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("./database/Binggo.accdb"));
    //获取表单数据
    var name = Request.Form("txtName");
	var sex = Request.Form("cboSex");
	var city = Request.Form("txtCity");
	var birthDateYMD = Request.Form("txtBirthdateYMD");
	var email = Request.Form("txtEmail");
	var pwd = Request.Form("txtPassword");
    var tel = Request.Form("txtTel");
	var about = Request.Form("txtAbout");
	var recCheckUser = new ActiveXObject("ADODB.Recordset");
    var recCheckUser2 = new ActiveXObject("ADODB.Recordset");
    //将表单数据插入数据库语句
	sql = "SELECT Email FROM Users WHERE Email='" + email + "' and isDeleted=false";
    sql2 = "SELECT UserName FROM Users WHERE UserName='" +name + "' and isDeleted=false";

    recCheckUser.Open(sql, mycon);
    recCheckUser2.Open(sql2, mycon);
    if (!recCheckUser.EOF)
    {
        recCheckUser.Close();
        mycon.Close();
        Response.write(" <script> alert('邮箱已被注册，请登录,或者账号被封禁');this.location.href='login.asp';</script>");
       
       
       
    }
    if (!recCheckUser2.EOF)
    {
        recCheckUser2.Close();
        mycon.Close();
        Response.write(" <script> alert('用户名已经存在，请登录,或者账号被封禁');this.location.href='login.asp';</script>");
       
       
       
    }

   sql = "INSERT INTO Users "
        + "(UserName, Sex,  City,  BirthDate, Email, Password2, AboutMe,telephone) "
        + "VALUES "
        + "('" + name + "', '" + sex + "',  '" + city + "', '" + birthDateYMD + "', '" + email + "', '" + pwd + "', '" + about + "','"+tel+"')";
    mycon.Execute(sql);


    recCheckUser.Close();
    mycon.Close();
    Response.Redirect("index.asp");
%>