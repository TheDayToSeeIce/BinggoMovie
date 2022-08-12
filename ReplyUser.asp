<%@ Language="javascript" CODEPAGE="65001"%>
<%Response.Charset="utf-8"%>

<%
  
   //获取表单
	var ReplyUserContent=Request.Form("ReplyUserContent");
    var ReplyUserReceiver=Request.Form("ReplyUserReceiver");
    var ReplyUseronComment=Request.Form("ReplyUseronComment");



   
    // 连接数据库
    var mycon = new ActiveXObject("ADODB.Connection");
    mycon.Open("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("./database/Binggo.accdb"));
 
    sql = "INSERT INTO Reply "
        + "(Content, UserReceiver, UserSender, onComment) "
        + "VALUES "
        + "('" + ReplyUserContent + "', '" + ReplyUserReceiver + "',  '" + Session("UserName") + "', '" + ReplyUseronComment + "')" ;
    mycon.Execute(sql);

    mycon.Close();
    //Response.Redirect("MovieItem.asp");
    Response.write("<script>window.location=document.referrer;</script>");
    
			

    
			
		
      

   
	
%>
