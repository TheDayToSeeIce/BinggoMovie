<%
    
    if (typeof Session("RefUser") === "undefined" || Session("RefUser") == "")
    {
        Session("MESSAGE") = "请登录.";
        Response.Redirect("login.asp");
    }
    else
    {
        Session("MESSAGE") = "";
    }
%>
