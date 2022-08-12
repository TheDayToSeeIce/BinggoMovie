
<%@ Language="javascript" CODEPAGE="65001"%>
<%Response.Charset="utf-8"%>

<%
    var page=parseInt(Request.QueryString("page"));
	var sqlMatches;
	var SearchPage=(page-1)*10;
	
	var paiming=SearchPage+1;
	

    // 连接数据库
    var mycon = new ActiveXObject("ADODB.Connection");
    mycon.Open("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("./database/Binggo.accdb"));
	
sqlMatches = "SELECT Comments.*,MovieLists.* FROM Comments,MovieLists WHERE Comments.Uid="+Session("RefUser")+" and MovieLists.MovieId=Comments.Mid;";
    
     
	
	
	
    //创建数据集
	var recMatches = new ActiveXObject("ADODB.Recordset");
    recMatches.Open(sqlMatches, mycon);

	if(Session("RefUser")==""){
		Response.write("<script>alert('尊敬的用户，您还没有登录，请登录后再进入首页！');this.location.href='index.asp';</script>");
		
	}

    if (recMatches.EOF)
    {
        Session("MESSAGE") = "没有找到电影！";
    }

	recMatches.Pagesize=10;
	
	
	
	
   
   
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>top100</title>
		<link rel="shortcut icon" type="image/x-icon" href="./assets/冰棍.svg" />
		<link rel="stylesheet" type="text/css" href="./css/top100.css" />
		<link rel="stylesheet" type="text/css" href="./modules/bootstrap/bootstrap.min.css" />
		<script src="./modules/bootstrap/jquery.min.js"></script>
		<script src="./modules/bootstrap/bootstrap.min.js"></script>

		<style>
			a:hover{text-decoration: none;color: brown};
		</style>
	</head>
	<body>
		<div id="SearchPage" style="display: none;"><%=page%></div>
		<!--   导航栏  -->
		<nav class="navbar navbar-inverse" role="navigation" >
			<div class="container-fluid" >
				<div class="navbar-header">
					<a class="navbar-brand" href="#"> <span id="brand-img-span"> <img id="brand-img" src="./assets/冰棍.svg" /> </span>
						BingGo</a>
				</div>
				<div>
					<ul class="nav navbar-nav">
						<li ><a href="./binggohome.asp">首页</a></li>
						<li  ><a href="top100.asp?page=1">Top100</a></li>
						<li><a href="./MovieList.asp?page=1">全部电影</a></li>
						
						<li><a href="./messages.asp">私信</a></li>
                        <li  class="active"><a href="#">我看过的电影</a></li>
		
		
						<li class="dropdown">
							<!-- 用户名和用户头像 -->
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="./assets/Users/<%=Session('UserName') %>.jpg" width="40px" height="40px"
								 class="img-circle" />
								  <%=Session("UserName") %><b class="caret"></b>
							</a>
							<ul class="dropdown-menu">
								<li><a href="myprofile.asp">修改信息</a></li>
							
								<li class="divider"></li>
						<li><a href="logout.asp">退出登录</a></li>
							</ul>
						</li>
		
					</ul>
				</div>
			</div>
		</nav>
		
		<!--   左边部分模块  -->
		<div id="FullPage-Left">
			
			<h1 style="margin-left: 50px;color: black;font-weight: bolder;">我看过的电影</h1> <hr />
			<div class="container-fluid" >
				
				<% while(!recMatches.EOF) { %>
             <div class="row" style="margin-left: 50px;">
				<div class="col-lg-7" >

					<div class="hd">
						<a href="MovieItem.asp?mid=<%= unescape(recMatches.Fields('MovieId').Value) %>" class="">
							<h2><span class="title"><%= unescape(recMatches.Fields("MovieName").Value) %></span></h2>
							
							<span class="title">&nbsp;&nbsp;<%= unescape(recMatches.Fields("EnglishName").Value) %></span>
							
						</a>
	
	
						
					</div><hr/>
					<h3 style="margin-right: 50px;color: #666;">我的评论：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= recMatches.Fields("title").Value %></h3>
            <p style="margin-right: 50px;color: #666;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= recMatches.Fields("Content").Value %></p><hr/>
			<div class="bd">
				<p class="">
					导演: <%= recMatches.Fields("Director").Value %>&nbsp;&nbsp;&nbsp;主演: <%= recMatches.Fields("Lead").Value %><br/> <br />
					<%= recMatches.Fields("ReleaseYear").Value %>&nbsp;/&nbsp;<%= recMatches.Fields("Producing_place").Value %>&nbsp;&nbsp;
				</p>
				<h3>我的评分&nbsp;&nbsp;<%= recMatches.Fields("grade").Value %></h3><hr>
				<p>=============================================================</p>


				

				
			</div>

				</div>

                <div class="col-lg-5">
          
					
				
						<div class="item ">
							<div class="pic">
								
								<a  href="MovieItem.asp?mid=<%= unescape(recMatches.Fields('MovieId').Value) %>" >
									<img width="200"  src="./assets/MovieLists/<%= unescape(recMatches.Fields('EnglishName').Value) %>.jpg"
									 class="">
								</a>
							</div>
							<div class="info">
								<div class="star">
									<span class="rating5-t"></span>
									<h2><span class="rating_num" property="v:average" style="font-style: italic;color: rgb(244, 181, 10);"><%= recMatches.Fields("avg_point").Value.toFixed(1) %>分</span></h2>
									
									<span property="v:best" content="10.0"></span>
								
								</div>
								
							</div>
						</div>
					
					
					
				
				
				</div>
			 

				

			 </div> <hr /> <!-- row -->
			 <% paiming+=1; %>
                <% recMatches.MoveNext(); %>
						<% } %>
						<% recMatches.Close(); %>

			</div><!-- container-fluid -->
			
			
				
			
			
				
			
			
			
			
			
			
			
			
			
			
			
			
		</div>
		
			
			
			
			

<script>
	



</script>
	</body>
</html>
