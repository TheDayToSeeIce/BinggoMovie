<%@ Language="javascript" CODEPAGE="65001"%>
<%Response.Charset="gb2312"%>

<%
  
   //获取表单
	var SelectedGrade=Request.Form("SelectedGrade");
    var CommentContent=Request.Form("CommentContent");
    var CommentTitle=Request.Form("CommentTitle");
    var CommentonMovie=Request.Form("CommentonMovie");
    
    




   
    // 连接数据库
  
    
			
    var mycon = new ActiveXObject("ADODB.Connection");
    mycon.Open("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("./database/Binggo.accdb"));
   

    //添加到Comments表
    sql = "INSERT INTO Comments "
        + "(Content, grade,title,UserName,Uid,Mid) "
        + "VALUES "
        + "('" + CommentContent + "', '" + SelectedGrade + "','"+CommentTitle+"','"+Session("UserName")+"','"+Session("RefUser")+"','"+CommentonMovie+"')" ;
    mycon.Execute(sql);


    //添加到MovieLists表
    var getMoviesql = "SELECT  * FROM MovieLists where MovieId="+CommentonMovie;
    //创建数据集
	var MovieMatches = new ActiveXObject("ADODB.Recordset");
    MovieMatches.Open(getMoviesql, mycon);
    if(unescape(Session("isALimited"))=="true"){
       MovieGrade=SelectedGrade*0.6;
    }else if(unescape(Session("isBLimited"))=="true"){
        MovieGrade=SelectedGrade*0.8;
    }else if(unescape(Session("BlackBlock"))=="true"){
        MovieGrade=SelectedGrade*0;
    }
    else{
        MovieGrade=SelectedGrade;
    }
    Response.write(MovieGrade);

    var updateGrade="UPDATE MovieLists SET Total_point =Total_point+"+MovieGrade+" WHERE MovieId = "+CommentonMovie;
    var updateNum="UPDATE MovieLists SET NumberOfRates =NumberOfRates+1 WHERE MovieId = "+CommentonMovie;
    mycon.Execute(updateGrade);
    mycon.Execute(updateNum);
   
   
   
   
    mycon.Close();
    
			
		
    Response.redirect(Request.ServerVariables("HTTP_REFERER"))

   
	
%>
<h1><%=SelectedGrade%></h1>