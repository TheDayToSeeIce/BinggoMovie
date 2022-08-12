<%@ Language="javascript" %>
<%
    Session("RefUser") = "";
    Session("MESSAGE") = "";
    Session("UserName") = "";
    Session("isALimited") = "";
    Session("isBLimited") = "";
    Response.Redirect("index.asp");
%>
