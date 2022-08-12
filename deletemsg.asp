<%@ Language="javascript" %>
<!-- #include file="checkSession.asp" -->
<%
    var ref = Request.QueryString("refM");

    var mycon = new ActiveXObject("ADODB.Connection");
    mycon.Open("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("./database/Binggo.accdb"));

    var sql = "DELETE FROM Messages WHERE RefMessage=" + ref;
    
    mycon.Execute(sql);
    mycon.Close();
    Response.Redirect("messages.asp");
%>
