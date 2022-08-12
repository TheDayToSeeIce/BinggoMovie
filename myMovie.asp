
<%@ Language="javascript" CODEPAGE="65001"%>
<%Response.Charset="utf-8"%>

<%
  

    // 连接数据库
    var mycon = new ActiveXObject("ADODB.Connection");
    mycon.Open("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("./database/Binggo.accdb"));
    var sqlMatches = "SELECT  top 10 MovieName,Cover,MovieId,EnglishName FROM MovieLists";
    //创建数据集
	var recMatches = new ActiveXObject("ADODB.Recordset");
    recMatches.Open(sqlMatches, mycon);

    if (recMatches.EOF)
    {
        Session("MESSAGE") = "No matches for your profile.";
    }
   
   
   
	
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
	</head>
	<body>
		<!--   导航栏  -->
		<nav class="navbar navbar-inverse" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#"> <span id="brand-img-span"> <img id="brand-img" src="./assets/冰棍.svg" /> </span>
						BingGo</a>
				</div>
				<div>
					<ul class="nav navbar-nav">
						<li ><a href="./binggohome.asp">首页</a></li>
						<li  ><a href="top100.asp">Top100</a></li>
						<li><a href="./MovieList.asp?page=1&q1=全部&q2=全部">全部电影</a></li>
						<!-- <li ><a href="./Commen.asp">精彩点评</a></li> -->
						<li><a href="./messages.asp">私信</a></li>
						<li  class="active"><a href="#">我的电影</a></li>
		
		
						<li class="dropdown">
							<!-- 用户名和用户头像 -->
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="./assets/Yui.jpg" width="40px" height="40px"
								 class="img-circle" />
								Chaoxip <b class="caret"></b>
							</a>
							<ul class="dropdown-menu">
								<li><a href="#">个人中心</a></li>
								<li><a href="#">账号设置</a></li>
		
		
								<li class="divider"></li>
								<li><a href="#">退出登录</a></li>
							</ul>
						</li>
		
					</ul>
				</div>
			</div>
		</nav>
		
		<!--   左边部分模块  -->
		<div id="FullPage-Left">
			
			<h2>我点评过的电影</h2>
			<ol class="Top100List">
			 <% while(!recMatches.EOF) { %>
				<li>
					<div class="item">
						<div class="pic">
							
							<a  href="MovieItem.asp?mid=<%= unescape(recMatches.Fields("MovieId").Value) %>" >
								<img width="200" alt="肖申克的救赎" src="./assets/MovieLists/<%= unescape(recMatches.Fields("EnglishName").Value) %>.jpg"
								 class="">
							</a>
						</div>
						<div class="info">
							<div class="hd">
								<a href="MovieItem.asp?mid=<%= unescape(recMatches.Fields("MovieId").Value) %>" class="">
									<span class="title"><%= unescape(recMatches.Fields("MovieName").Value) %></span>
									<span class="title">&nbsp;/&nbsp;<%= unescape(recMatches.Fields("EnglishName").Value) %></span>
									
								</a>
			
			
								
							</div>
							<div class="bd">
								<p class="">
									导演: 弗兰克·德拉邦特 &nbsp;&nbsp;&nbsp;主演: 蒂姆·罗宾斯 ...<br>
									1994&nbsp;/&nbsp;美国&nbsp;/&nbsp; 剧情
								</p>
			
			
								<div class="star">
									<span class="rating5-t" style="color: green;">我的评分：</span><br />
									<span class="rating_num" property="v:average" style="font-weight: bold;">9.3</span><br /><br />
									<span property="v:best" content="10.0"></span>
									<span class="rating5-t" style="color: green;">我的评论：</span><br />
									<span class="rating_num" property="v:average" style="font-weight: bold;">距离斯蒂芬·金（Stephen King）和德拉邦特（Frank Darabont）们缔造这部伟大的作品已经有十年了。我知道美好的东西想必大家都能感受，但是很抱歉，我的聒噪仍将一如既往。。。</span>
								</div>
			
								
							</div>
						</div>
					</div>
				</li>
				
				 <% recMatches.MoveNext(); %>
                    <% } %>
                    <% recMatches.Close(); %>
			
			
				
			
			
				
			
			
			
			
			
			</ol>
			
			
			<ul class="pagination">
			    <li><a href="#">&laquo;</a></li>
			    <li class="active"><a href="#">1</a></li>
			    <li class="disabled"><a href="#">2</a></li>
			    <li><a href="#">3</a></li>
			    <li><a href="#">4</a></li>
			    <li><a href="#">5</a></li>
				<li><a href="#">6</a></li>
				<li><a href="#">7</a></li>
				<li><a href="#">8</a></li>
				<li><a href="#">9</a></li>
				<li><a href="#">10</a></li>
			    <li><a href="#">&raquo;</a></li>
			</ul>
			
			
			
		</div>
		<!--   右边部分模块  -->
		<div id="FullPage-Right">
			
			<!--   搜索框  -->
			<div style="padding: 22px 2px 100px;">
				<form class="bs-example bs-example-form" role="form">
			
					<div class="col-lg-6">
						<div class="input-group">
							<input type="text" class="form-control">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">搜索</button>
							</span>
						</div><!-- /input-group -->
					</div><!-- /.col-lg-6 -->
			
				</form>
			</div><!-- /.row -->
			
			
			<!--   热门搜索  -->
			<div class="hot_search">
				
					<h3 style="padding-left: 20px;padding-bottom: 20px;font-weight: bolder; color: burlywood;">热门搜索</h3>
					
				
				    <%
  



    // Connecting to the database.
	var ranking = 1;
   
    var sqlMatches = "SELECT top 10 MovieName,Cover,MovieId FROM MovieLists";
    var recMatches = new ActiveXObject("ADODB.Recordset");
    recMatches.Open(sqlMatches, mycon);
	

   
%>
                        
						
                    <% while(!recMatches.EOF) { %>
                       <ul style="list-style-type: none;">
					<li style="padding-right: 10px;">
					<a  href="MovieItem.asp?mid=<%= unescape(recMatches.Fields("MovieId").Value) %>" > <span><% =ranking %> .</span><%= unescape(recMatches.Fields("MovieName").Value) %> </a>
					</li>
					
					<% ranking++ %>
				
				</ul>
                      <% recMatches.MoveNext(); %>
                    <% } %>
                    <% recMatches.Close(); %>
                    
                </div>
			
		</div>
		
		<%
    
    mycon.Close();
%>
	</body>
</html>
