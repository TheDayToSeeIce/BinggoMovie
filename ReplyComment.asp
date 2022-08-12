<%@ Language="javascript" CODEPAGE="65001"%>
<%Response.Charset="utf-8"%>

<%
  
   //获取表单
	var ReplyCommentContent=Request.Form("ReplyCommentContent");
    var ReplyCommentReceiver=Request.Form("ReplyCommentReceiver");
    var ReplyCommentonComment=Request.Form("ReplyCommentonComment");



   
    // 连接数据库
    var mycon = new ActiveXObject("ADODB.Connection");
    mycon.Open("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("./database/Binggo.accdb"));
 
    sql = "INSERT INTO Reply "
        + "(Content, UserReceiver, UserSender, onComment) "
        + "VALUES "
        + "('" + ReplyCommentContent + "', '" + ReplyCommentReceiver + "',  '" + Session("UserName") + "', '" + ReplyCommentonComment + "')" ;
    mycon.Execute(sql);

    mycon.Close();
    Response.write("<script>window.location=document.referrer;</script>");
    
			

    
			
		
      

   
	
%>