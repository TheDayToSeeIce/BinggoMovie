
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
	if(page==1){
         sqlMatches = "SELECT  top 10 * FROM MovieLists order by avg_point  DESC,MovieId DESC";
	}else{
		sqlMatches = "SELECT TOP 10 * FROM MovieLists  WHERE MovieId NOT IN (SELECT TOP " + SearchPage +" MovieId FROM MovieLists order by avg_point  DESC,MovieId DESC) order by avg_point  DESC,MovieId DESC" ;
	}
     
	
	
	
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
						<li  class="active"><a href="top100.asp?page=1">Top100</a></li>
						<li><a href="MovieList.asp?page=1&q1=全部&q2=全部">全部电影</a></li>
						<!-- <li ><a href="./Commen.asp">精彩点评</a></li> -->
						<li><a href="./messages.asp">私信</a></li>
		
		
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
			
			<h1 style="margin-left: 50px;color: black;font-weight: bolder;">Top100</h1> <hr />
			<div class="container-fluid" >
				
				<% while(!recMatches.EOF) { %>
             <div class="row" style="margin-left: 50px;">
				<div class="col-lg-7" >

					<div class="hd">
						<a href="MovieItem.asp?mid=<%= unescape(recMatches.Fields('MovieId').Value) %>" class="">
							<h2><%=paiming %><span class="title">、<%= unescape(recMatches.Fields("MovieName").Value) %></span></h2>
							
							<span class="title">&nbsp;&nbsp;<%= unescape(recMatches.Fields("EnglishName").Value) %></span>
							
						</a>
	
	
						
					</div><hr/>
            <p style="margin-right: 50px;color: #666;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= recMatches.Fields("Synopsis").Value %></p><hr/>
			<div class="bd">
				<p class="">
					导演: <%= recMatches.Fields("Director").Value %>&nbsp;&nbsp;&nbsp;主演: <%= recMatches.Fields("Lead").Value %><br/> <br />
					<%= recMatches.Fields("ReleaseYear").Value %>&nbsp;/&nbsp;<%= recMatches.Fields("Producing_place").Value %>&nbsp;&nbsp;
				</p>


				

				
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
			
			
				
			
			
				
			
			
			
			
			
			
			
			
			<ul class="pagination" id="pageul">
			    <li><a href="#">&laquo;</a></li>
				
			    <li ><a href="top100.asp?page=1">1</a></li>
			    <li ><a href="top100.asp?page=2">2</a></li>
			    <li><a href="top100.asp?page=3">3</a></li>
			    <li><a href="top100.asp?page=4">4</a></li>
			    <li><a href="top100.asp?page=5">5</a></li>
				<li><a href="top100.asp?page=6">6</a></li>
				<li><a href="top100.asp?page=7">7</a></li>
				<li><a href="top100.asp?page=8">8</a></li>
				<li><a href="top100.asp?page=9">9</a></li>
				<li><a href="top100.asp?page=10">10</a></li>
			    <li><a href="#">&raquo;</a></li>
			</ul>
			
			
			
		</div>
		<!--   右边部分模块  -->
		<div id="FullPage-Right">
			
			<!--   搜索框  -->
			<div style="padding: 22px 2px 100px;">
				<form class="bs-example bs-example-form" role="form" action="SearchResult.asp" method="post">
			
					<div class="col-lg-6">
						<div class="input-group">
							<input type="text" class="form-control" name="SearchName">
							<span class="input-group-btn">
								<button class="btn btn-default" type="submit">搜索</button>
							</span>
						</div><!-- /input-group -->
					</div><!-- /.col-lg-6 -->
			
				</form>
			</div><!-- /.row -->
			
			
			<!--   热门搜索  -->
			<div class="hot_search">
				
					<h3 style="padding-left: 20px;padding-bottom: 20px;font-weight: bolder; color: burlywood;">热门电影</h3>
					
				
				    <%
  



    // Connecting to the database.
	var ranking = 1;
   
    var sqlMatches = "SELECT top 10 MovieName,Cover,MovieId FROM MovieLists order by NumberOfRates,ReleaseYear";
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



<script>
	//分页实现
	var bb=document.getElementById("pageul").children;
	var aa=document.getElementById("SearchPage").innerText;
	bb[aa].classList.add("active");



</script>


	</body>
</html>
