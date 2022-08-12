<%@ Language="javascript" CODEPAGE="65001"%>
<%Response.Charset="utf-8"%>

<%
  
    var sech=Request.Form("intro");
    var page=parseInt(Request.QueryString("page"));
	var sqlMatches;
	var SearchPage=(page-1)*10;
    // 连接数据库
    var mycon = new ActiveXObject("ADODB.Connection");
    mycon.Open("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("./database/Binggo.accdb"));
    
  sqlMatches = "SELECT * from MovieLists where MovieName like  '"+"%"+sech+"%"+"'" ;
  Response.write(sqlMatches);
   
    //创建数据集
	var recMatches = new ActiveXObject("ADODB.Recordset");
    recMatches.Open(sqlMatches, mycon);

    
   
   
	
%>

<!DOCTYPE html>
<html>
 <head>
 <title> tt</title>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 </head>
 <body>
    <% while(!recMatches.EOF) { %>
        <h1><%= unescape(recMatches.Fields("MovieName").Value) %></h1>

        <% recMatches.MoveNext(); %>
                    <% } %>
                    <% recMatches.Close(); %>
 </body>
</html>

