<%@ Language="javascript" CODEPAGE="65001"%>
<%Response.Charset="utf-8"%>

<%
  
   //获取表单
   if (Request.Form("SearchName").Count > 0){
	   var SearchName=Request.Form("SearchName");  
   }
    


    var page=parseInt(Request.QueryString("page"));
	var sqlMatches;
	var SearchPage=(page-1)*10;
    // 连接数据库
    var mycon = new ActiveXObject("ADODB.Connection");
    mycon.Open("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("./database/Binggo.accdb"));

	
	//sqlMatches =  "SELECT  * FROM MovieLists where MovieName like '"+"%"+SearchName+"%"+"'" +"order by avg_point  DESC";
	sqlMatches =  "SELECT  * FROM MovieLists where MovieName like '%"+SearchName+"%' order by avg_point  DESC";
		
      

		
  
  
    //创建数据集
	var recMatches = new ActiveXObject("ADODB.Recordset");
    recMatches.Open(sqlMatches, mycon);

    if (recMatches.EOF)
    {
        Session("MESSAGE") = "找不到信息.";
    }
   
   
   
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>AllMovie</title>
		<link rel="shortcut icon" type="image/x-icon" href="./assets/冰棍.svg" />
		<link rel="stylesheet" type="text/css" href="../../Bootstrap框架/bootstrap.min.css" />
		
		<link rel="stylesheet" type="text/css" href="./css/MovieList.css" />

		<link rel="stylesheet" type="text/css" href="./modules/bootstrap/bootstrap.min.css" />
		<script src="./modules/bootstrap/jquery.min.js"></script>
		<script src="./modules/bootstrap/bootstrap.min.js"></script>
	</head>
	<body>

		<nav class="navbar navbar-inverse" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#"> <span id="brand-img-span"> <img id="brand-img" src="./assets/冰棍.svg" /> </span>
						BingGo</a>
				</div>
				<div>
					<ul class="nav navbar-nav">
						<li ><a href="./binggohome.asp">首页</a></li>
						<li><a href="./top100.asp?page=1">Top100</a></li>
						<li ><a href="MovieList.asp?page=1">全部电影</a></li>
						<!-- <li ><a href="./Commen.asp">精彩点评</a></li> -->
						<li><a href="./messages.asp">私信</a></li>


						<li class="dropdown">
							<!-- 用户名和用户头像 -->
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="./assets/Users/<%=Session('UserName') %>.jpg" width="40px" height="40px"
								 class="img-circle" />
								 <%=Session("UserName") %> <b class="caret"></b>
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
		<!--   左边模块  -->
		<div id="FullPage-Left">


<a href="./assets/MovieLists/Flipped .jpg"></a>


			<br />




			<!-- <div class="btn-group">
				<button type="button" class="btn btn-default">近期热门</button>
				<button type="button" class="btn btn-default">评分最高</button>
				<button type="button" class="btn btn-default">最新上线</button>
				<button type="button" class="btn btn-default">标记最多</button>
			</div> -->
			<br />
			<div class="container mb-5">
				<div class="row justify-content-center">
				  <div class="col-lg-6 text-center">
					<div class="row">
					 
		
					  <form action="SearchResult.asp" class="col-12 mb-5" method="post">
						<div class="row align-items-center">
						<div class="col-md-8 mb-3 mb-md-0">
						  <input type="text" class="form-control" placeholder="请输入信息" name="SearchName">
						</div>
						<div class="col-md-4">
						  <input type="submit" class="btn btn-primary btn-block" value="搜索">
						</div>
						</div>
					  </form>
					</div>
				  </div>
				</div>
			  </div>
            <h1>搜索结果</h1>

			<ul class="bangumi-list clearfix">

 <% while(!recMatches.EOF) { %>
				<li class="bangumi-item" style=""><a href="#" 
					 class="cover-wrapper">
						<div class="common-lazy-img"><img alt="" src="./assets/MovieLists/<%= unescape(recMatches.Fields("EnglishName").Value) %>.jpg" width="135px" height="200px"
						lazy="loaded">
							 </div>
						
						
<a  href="MovieItem.asp?mid=<%= unescape(recMatches.Fields("MovieId").Value) %>" ><%= unescape(recMatches.Fields("MovieName").Value) %></a>					</a> 
					
				</li>
				
				 <% recMatches.MoveNext(); %>
                    <% } %>
                    <% recMatches.Close(); %>
				

			</ul>


	



			<div class="Botton_Message">
				<div id="footer">
					<div class="footer-extra"></div><hr />  
				
			<span id="icp" class="fleft gray-link">
			© 2022－20?? Binggo.xyz, all rights reserved ..
			</span>
			
			
			
			<span class="fright" style="float: right;">
			<a href="#" style="color: black;">关于Binggo</a>
			<a href="#" style="color: black;">联系我们</a>
			
			</span>
			
			</div>
				

			</div>


		</div>
		<!--   右边模块  -->
		<div id="FullPage-Right">
				<!--   搜索框  -->
				


			<br />
			

		</div>

<%
    
    mycon.Close();
%>


	</body>
</html>
