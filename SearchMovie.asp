<%@ Language="javascript" %>
<%Response.Charset="gb2312"%>
<%
    
    var mycon = new ActiveXObject("ADODB.Connection");
    mycon.Open("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("./database/Binggo.accdb"));

    
    var searchName = escape(Request.Form("searchName"));
   
    
    

    var sql = "";
    sql = "select * from MovieLists where MovieName = '"+searchName+"'";

    var recMatches = new ActiveXObject("ADODB.Recordset");
    recMatches.Open(sql, mycon);

        
        //Response.Redirect("movieItem.asp?mid="+recMatches.Fields("MovieId").Value);
    
    
    
    
        Response.write(recMatches.Fields("MovieId").Value);
    //Response.Redirect("binggohome.asp");
    mycon.Close();
%>
