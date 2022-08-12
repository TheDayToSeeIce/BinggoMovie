<%@ Language="javascript" CODEPAGE="65001"%>
<%Response.Charset="utf-8"%>

<%
    var mycon = new ActiveXObject("ADODB.Connection");
    mycon.Open("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("./database/Binggo.accdb"));
	
    //var title = escape(Request.Form("txtSubject"));
    var message = escape(Request.Form("txtMessage"));
    var sender = Session("RefUser");
    var receiver = Request.Form("cboReceiver");

    var sql = "insert into Messages(Message,Sender,Receiver,New) values('" + message + "'," + sender + "," + receiver + ",1 )";

    mycon.Execute(sql);
    
    Session("MESSAGE") = "信息已经发送!";
    Response.write("<script >alert('信息已经发送！'); setTimeout(function(){history.go(-1); },1000)</script>")
    //Response.Redirect("sen");
%>
