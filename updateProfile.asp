
<%@ Language="javascript" CODEPAGE="65001"%>
<%Response.Charset="utf-8"%>
<!-- #include file="checkSession.asp" -->
<%
    var mycon = new ActiveXObject("ADODB.Connection");
    mycon.Open("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("./database/Binggo.accdb"));

    var name = Request.Form("txtName");
    var sex = Request.Form("cboSex");
    var tel = Request.Form("txttel");
   
    var city = Request.Form("txtCity");
   
    var pwd = Request.Form("txtpwd1");
    var about = Request.Form("txtAbout");
    
    

    var sql = "";
    sql = "UPDATE Users "
        + "SET UserName = '" + name + "', "
        + "Sex = '" + sex + "', "
        + "telephone = '" + tel + "', "
        + "city = '" + city + "', "        
        + "Password2 = '" + pwd + "', "
        + "AboutMe = '" + about + "' "   
        + "WHERE RefUser = " + Session("RefUser");
    + "Password2 = '" + pwd + "', "
    mycon.Execute(sql);
    
    mycon.Close();
    //Response.Redirect("binggohome.asp");
    Response.write("<script >alert('信息修改成功！'); setTimeout(function(){history.go(-1); },1000)</script>")
%>
