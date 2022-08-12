<%@ Language="javascript" CODEPAGE="65001"%>
<%Response.Charset="utf-8"%>

<%
  
   //获取表单
	var SelectedGrade=Request.Form("SelectedGrade");
    var CommentContent=Request.Form("CommentContent");
    var CommentTitle=Request.Form("CommentTitle");
    var CommentonMovie=Request.Form("CommentonMovie");
    
    




   
    // 连接数据库
  
    
			
    var mycon = new ActiveXObject("ADODB.Connection");
    mycon.Open("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("./database/Binggo.accdb"));


    //添加到MovieLists表
    var Usersql = "SELECT  * FROM Users where RefUser="+Session("RefUser");


   


    //创建数据集
	var UserMatches = new ActiveXObject("ADODB.Recordset");
    UserMatches.Open(Usersql, mycon);
    if(unescape(Session("isALimited"))=="true"){
        Response.write("11");
    }else{
        Response.write("22");
    }
    

    
   
   
   
   
   
			
		
      

   
	
%>
<h1> <%= unescape(Session("isALimited")) %></h1>

<%

 mycon.Close();
    
%>