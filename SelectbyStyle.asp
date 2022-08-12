<%@ Language="javascript" %>
<%
    var sql = "";
    //连接数据库
    var mycon = new ActiveXObject("ADODB.Connection");
    mycon.Open("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("./database/Binggo.accdb"));

    //获取表单数据
    var place = Request.Form("place");
    var isPlot= Request.Form("isPlot");
    var isComedy= Request.Form("isComedy");
    var isRomantic= Request.Form("isRomantic");
    var isMove= Request.Form("isMove");
    var isTerror= Request.Form("isTerror");
    var isFiction= Request.Form("isFiction");
    var isWar= Request.Form("isWar");
    var isAnime= Request.Form("isAnime");
    var isBiography= Request.Form("isBiography");
    var isHistory= Request.Form("isHistory");
    var isAdventrue= Request.Form("isAdventrue");

    sql="SELECT * FROM MovieLists";
    //按表单数据设计sql语句

    if (place != "")
    {
        sql += " where Producing_place = '" + place + "'";
    }

    if (isPlot != false)
    {
        sql += " and isPlot = true";
    }
    if (isComedy != false)
    {
        sql += " and isComedy = true";
    }



%>