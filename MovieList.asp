<%@ Language="javascript" CODEPAGE="65001"%>
<%Response.Charset="utf-8"%>
<%//Response.Charset="gb2312"%>

<%


  
   //获取表单
   var postSelect,postSelectBystyle;
   
	postSelect=Request.QueryString("q1");
	postSelectBystyle=Request.QueryString("q2");
  

    var page=parseInt(Request.QueryString("page"));
	var sqlMatches;
	//去除前n项记录
	var SearchPage=(page-1)*10;
    // 连接数据库
    var mycon = new ActiveXObject("ADODB.Connection");
    mycon.Open("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("./database/Binggo.accdb"));
	//获取页数变量
    var getMovieCountSql,PageCounts, MovieCountMatches;
	//获取页数
	// getMovieCountSql="SELECT count(MovieId) as numa FROM MovieLists ";
	// MovieCountMatches = new ActiveXObject("ADODB.Recordset");
    //MovieCountMatches.Open(getMovieCountSql, mycon);
	// PageCounts=parseInt(MovieCountMatches.Fields("numa")/10);
	
	

//  if(page==1){

		
		
			
		
// if(postSelect == "中国"||postSelect == "美国"||postSelect == "日本"||postSelect == "韩国"||postSelect == "法国"||postSelect == "英国"||postSelect == "泰国"||postSelect == "德国"){
// 	sqlMatches = "SELECT   * FROM MovieLists where Producing_place = '"+postSelect+"' order by avg_point  DESC,MovieId DESC";
// }else if(postSelect == "全部"){
// 	sqlMatches = "SELECT  top 10 * FROM MovieLists order by avg_point  DESC,MovieId DESC";
// }else
// {
	
// 	sqlMatches = "SELECT  top 10 * FROM MovieLists order by avg_point  DESC,MovieId DESC";
// }

// if(postSelectBystyle == "剧情"||postSelectBystyle == "喜剧"||postSelectBystyle == "爱情"||postSelectBystyle == "动作"||postSelectBystyle == "恐怖"||postSelectBystyle == "科幻"||postSelectBystyle == "战争"||postSelectBystyle == "动画"||postSelectBystyle == "传记"||postSelectBystyle == "历史"||postSelectBystyle == "冒险"){
// 	sqlMatches = "SELECT   * FROM MovieLists where catag1 = '"+postSelectBystyle+"' or catag2='"+postSelectBystyle+"' order by avg_point  DESC";
// }else if(postSelectBystyle == "全部"){
// 	sqlMatches = "SELECT  top 10 * FROM MovieLists order by avg_point  DESC,MovieId DESC";
// }
	









// }else{
// //sqlMatches = "SELECT TOP 10 * FROM MovieLists  WHERE MovieId NOT IN (SELECT TOP " + SearchPage +" MovieId FROM MovieLists order by avg_point  DESC) order by avg_point  DESC,MovieId DESC" ;

// if(postSelect == "中国"||postSelect == "美国"||postSelect == "日本"||postSelect == "韩国"||postSelect == "法国"||postSelect == "英国"||postSelect == "泰国"||postSelect == "德国"){
// //sqlMatches="select Top 10 * from MovieLists where "
// sqlMatches = "SELECT  top 10 * FROM MovieLists where Producing_place = '"+postSelect+"' order by avg_point  DESC";
// }else if(postSelect == "全部"){
// sqlMatches = "SELECT TOP 10 * FROM MovieLists  WHERE MovieId NOT IN (SELECT TOP " + SearchPage +" MovieId FROM MovieLists order by avg_point  DESC,MovieId DESC) order by avg_point  DESC,MovieId DESC" ;
// }else
// {

// sqlMatches = "SELECT TOP 10 * FROM MovieLists  WHERE MovieId NOT IN (SELECT TOP " + SearchPage +" MovieId FROM MovieLists order by avg_point  DESC,MovieId DESC) order by avg_point  DESC,MovieId DESC" ;
// }
// if(postSelectBystyle == "剧情"||postSelectBystyle == "喜剧"||postSelectBystyle == "爱情"||postSelectBystyle == "动作"||postSelectBystyle == "恐怖"||postSelectBystyle == "科幻"||postSelectBystyle == "战争"||postSelectBystyle == "动画"||postSelectBystyle == "传记"||postSelectBystyle == "历史"||postSelectBystyle == "冒险"){
// sqlMatches = "SELECT  top 10 * FROM MovieLists where catag1 = '"+postSelectBystyle+"' or catag2='"+postSelectBystyle+"' order by avg_point  DESC,MovieId DESC";
// }else if(postSelectBystyle == "全部"){
// sqlMatches = "SELECT TOP 10 * FROM MovieLists  WHERE MovieId NOT IN (SELECT TOP " + SearchPage +" MovieId FROM MovieLists order by avg_point  DESC,MovieId DESC) order by avg_point  DESC,MovieId DESC" ;
// }

// }

   //第一页
if(page==1){

if(postSelect=='全部'&postSelectBystyle=='全部'){
	sqlMatches = "SELECT  top 10 * FROM MovieLists order by avg_point  DESC,MovieId DESC";
	getMovieCountSql="SELECT count(MovieId) as numa FROM MovieLists";
}else
//按风格
if(postSelect=='全部'&postSelectBystyle!='全部'){
	sqlMatches = "SELECT  top 10 * FROM MovieLists where catag1 = '"+postSelectBystyle+"' or catag2='"+postSelectBystyle+"' order by avg_point  DESC,MovieId DESC";
	getMovieCountSql="SELECT count(MovieId) as numa FROM MovieLists where catag1 = '"+postSelectBystyle+"' or catag2='"+postSelectBystyle+"'";
}else

//按地区
if(postSelect!='全部'&postSelectBystyle=='全部'){
	sqlMatches = "SELECT  top 10 * FROM MovieLists where Producing_place = '"+postSelect+"' order by avg_point  DESC,MovieId DESC";
	getMovieCountSql="SELECT count(MovieId) as numa FROM MovieLists where Producing_place = '"+postSelect+"'";
}else

//按两项
if(postSelect!='全部'&postSelectBystyle!='全部'){
	sqlMatches = "SELECT  top 10 * FROM MovieLists where Producing_place = '"+postSelect+"' and (catag1 = '"+postSelectBystyle + "' or catag2='"+postSelectBystyle +"') order by avg_point  DESC,MovieId DESC";
	getMovieCountSql="SELECT count(MovieId) as numa FROM MovieLists where Producing_place = '"+postSelect+"' and (catag1 = '"+postSelectBystyle + "' or catag2='"+postSelectBystyle +"') ";
}

}//--第一页--
//非第一页
else{
	if(postSelect=='全部'&postSelectBystyle=='全部'){
		sqlMatches = "SELECT TOP 10 * FROM MovieLists  WHERE MovieId NOT IN (SELECT TOP " + SearchPage +" MovieId FROM MovieLists order by avg_point  DESC) order by avg_point  DESC,MovieId DESC";
		getMovieCountSql="SELECT count(MovieId) as numa FROM MovieLists";
	}
	//按风格
	if(postSelect=='全部'&postSelectBystyle!='全部'){
		sqlMatches="SELECT TOP 10 * FROM MovieLists  WHERE MovieId NOT IN (SELECT TOP " + SearchPage +" MovieId FROM MovieLists where catag1='"+postSelectBystyle+"' or catag2='"+postSelectBystyle+"' order by avg_point  DESC,MovieId DESC) and (catag1='"+postSelectBystyle+"' or catag2='"+postSelectBystyle+"') order by avg_point  DESC,MovieId DESC";
	
		getMovieCountSql="SELECT count(MovieId) as numa FROM MovieLists where catag1 = '"+postSelectBystyle+"' or catag2='"+postSelectBystyle+"'";
	}
	
	//按地区
	if(postSelect!='全部'&postSelectBystyle=='全部'){
		sqlMatches="SELECT TOP 10 * FROM MovieLists  WHERE MovieId NOT IN (SELECT TOP " + SearchPage +" MovieId FROM MovieLists where Producing_place='"+postSelect+"'  order by avg_point  DESC,MovieId DESC) and Producing_place='"+postSelect+"' order by avg_point  DESC,MovieId DESC";
		getMovieCountSql="SELECT count(MovieId) as numa FROM MovieLists where Producing_place = '"+postSelect+"'";
	}
	
	//按两项
	if(postSelect!='全部'&postSelectBystyle!='全部'){
		sqlMatches = "SELECT TOP 10 * FROM MovieLists  WHERE MovieId NOT IN (SELECT TOP " + SearchPage +" MovieId FROM MovieLists where (catag1='"+postSelectBystyle+"' or catag2='"+postSelectBystyle+"') and Producing_place='"+postSelect+"' order by avg_point  DESC,MovieId DESC) and (catag1='"+postSelectBystyle+"' or catag2='"+postSelectBystyle+"') and  Producing_place='"+postSelect+"' order by avg_point  DESC,MovieId DESC";
		getMovieCountSql="SELECT count(MovieId) as numa FROM MovieLists where Producing_place = '"+postSelect+"' and (catag1 = '"+postSelectBystyle + "' or catag2='"+postSelectBystyle +"') ";
	}

}
  



//电影计数数据集
 MovieCountMatches = new ActiveXObject("ADODB.Recordset");
MovieCountMatches.Open(getMovieCountSql, mycon);
 PageCounts=parseInt(MovieCountMatches.Fields("numa")/10);

    //创建电影数据集
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
		<title>全部电影</title>
		<link rel="shortcut icon" type="image/x-icon" href="./assets/冰棍.svg" />
		<link rel="stylesheet" type="text/css" href="../../Bootstrap框架/bootstrap.min.css" />
		
		<link rel="stylesheet" type="text/css" href="./css/MovieList.css" />

		<link rel="stylesheet" type="text/css" href="./modules/bootstrap/bootstrap.min.css" />
		<script src="./modules/bootstrap/jquery.min.js"></script>
		<script src="./modules/bootstrap/bootstrap.min.js"></script>
	</head>
	<body>
		
		<div id="SearchPage" style="display: none;"><%=page%></div>
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
						<li class="active"><a href="MovieList.asp?page=1&q1=全部&q2=全部">全部电影</a></li>
						<!-- <li ><a href="./Commen.asp">精彩点评</a></li> -->
						<li><a href="./messages.asp">私信</a></li>


						<li class="dropdown">
							<!-- 用户名和用户头像 -->
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="./assets/Users/<%=Session('UserName') %>.jpg" width="40px" height="40px"
								 class="img-circle" />
								 <%=Session("UserName") %> <b class="caret"></b>
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


	<ul class="pagination" id="pageul">
			    <li ><a href="#">&laquo;</a></li>
			    <!-- <li class="active"><a href="MovieList.asp?page=1">1</a></li>
			    <li ><a href="MovieList.asp?page=2">2</a></li>
			    <li><a href="MovieList.asp?page=3">3</a></li>
			    <li><a href="MovieList.asp?page=4">4</a></li>
			    <li><a href="MovieList.asp?page=5">5</a></li>
				<li><a href="MovieList.asp?page=6">6</a></li>
				<li><a href="MovieList.asp?page=7">7</a></li>
				<li><a href="MovieList.asp?page=8">8</a></li>
				<li><a href="MovieList.asp?page=9">9</a></li>
				<li><a href="MovieList.asp?page=10">10</a></li>
			    <li><a href="#">&raquo;</a></li> -->
			</ul>



			<div class="Botton_Message">
				
				
				

			</div>


		</div>
		<!--   右边模块  -->
		<div id="FullPage-Right">
				<!--   搜索框  -->
				<form action="SearchResult.asp" class="col-12 mb-5" method="post">
					<div class="row align-items-center">
					<div class="col-md-8 mb-3 mb-md-0">
					  <input type="text" class="form-control" placeholder="输入需要查询的电影名字" name="SearchName">
					</div>
					<div class="col-md-4">
					  <input type="submit" class="btn btn-primary btn-block" value="查询">
					</div>
					</div>
				  </form>


			<br />
			<div class="filter-wrapper">
				
				<div class="filter-list">
					<div class="filter-block">
						<div class="filter-name" style="color: black;font-weight: bolder;">地区</div>
						<ul class="filter-item-wrapper free">
							<li title="全部" class="filter-item " onclick=" postArea('全部')  " id="全部">全部</li>
							<li title="中国" class="filter-item"  onclick="postArea('中国')  " id="中国">中国</li>
							<li title="美国" class="filter-item" onclick="postArea('美国')" id="美国">美国</li>
							<li title="日本" class="filter-item" onclick=" postArea('日本') " id="日本">日本</li>
							<li title="韩国" class="filter-item" onclick="postArea('韩国')" id="韩国">韩国</li>
							<li title="法国" class="filter-item" onclick=" postArea('法国') " id="法国">法国</li>
							<li title="英国" class="filter-item" onclick=" postArea('英国') " id="英国">英国</li>
							<li title="泰国" class="filter-item" onclick=" postArea('泰国') " id="泰国">泰国</li>
							<li title="意大利" class="filter-item" onclick="postArea('德国') " id="德国">德国</li>
							<!-- <li title="其他" class="filter-item" onclick=" MakeAreaForm(this) ">其他</li> -->
							<!---->
						</ul>
					</div>
					<div class="filter-block">
						<div class="filter-name" style="color: black;font-weight: bolder;">风格</div>
						<ul class="filter-item-wrapper free">
							<li title="全部" class="filter-item "  onclick=" postStyle('全部') " id="全部2">全部</li>
							<li title="剧情" class="filter-item" onclick=" postStyle('剧情') " id="剧情">剧情</li>
							<li title="喜剧" class="filter-item" onclick=" postStyle('喜剧') " id="喜剧">喜剧</li>
							<li title="爱情" class="filter-item" onclick=" postStyle('爱情') " id="爱情">爱情</li>
							<li title="动作" class="filter-item" onclick=" postStyle('动作') " id="动作">动作</li>
							<li title="恐怖" class="filter-item" onclick=" postStyle('恐怖') " id="恐怖">恐怖</li>
							<li title="科幻" class="filter-item" onclick=" postStyle('科幻') " id="科幻">科幻</li>
							<li title="战争" class="filter-item" onclick=" postStyle('战争') " id="战争">战争</li>
							<li title="动画" class="filter-item" onclick=" postStyle('动画') " id="动画">动画</li>
							<li title="传记" class="filter-item" onclick=" postStyle('传记') " id="传记">传记</li>
							<li title="历史" class="filter-item" onclick=" postStyle('历史') " id="历史">历史</li>
							<li title="冒险" class="filter-item" onclick=" postStyle('冒险') " id="冒险">冒险</li>
							
							
							<!---->
						</ul>
					</div>
					<!-- <div class="filter-block">
						<div class="filter-name">年份</div>
						<ul class="filter-item-wrapper">
							<li title="全部" class="filter-item on">全部</li>
							<li title="2022" class="filter-item">2022</li>
							<li title="2021" class="filter-item">2021</li>
							<li title="2020" class="filter-item">2020</li>
							<li title="2019" class="filter-item">2019</li>
							<li title="2018" class="filter-item">2018</li>
							<li title="2017" class="filter-item">2017</li>
							<li title="2016" class="filter-item">2016</li>
							<li title="2015-2010" class="filter-item">2010年代</li>
							<li title="2009-2005" class="filter-item">2000年代</li>
							
							<li title="90年代" class="filter-item">90年代</li>
							<li title="80年代" class="filter-item">80年代</li>
							<li title="更早" class="filter-item">更早</li>
							
						</ul>
					</div> -->
				
				</div>
			</div>

		</div>

<%
    
    mycon.Close();
%>

  <script>



//获取URL参数
function getQueryVariable(variable)
{
       var query = window.location.search.substring(1);
       var vars = query.split("&");
       for (var i=0;i<vars.length;i++) {
               var pair = vars[i].split("=");
               if(pair[0] == variable){return decodeURIComponent(pair[1]);}
       }
       return(false);
}

console.log(getQueryVariable("q1"));


//提交地区搜索
function postArea(area){
	
	
	var hrefString=location.href.split('?')[0]+"?page=1&q1="+area+"&q2="+getQueryVariable("q2");
	this.location.href=hrefString;
	
}

//提交风格搜索
function postStyle(style){
	
	
	var hrefString=location.href.split('?')[0]+"?page=1&q1="+getQueryVariable("q1")+"&q2="+style;
	this.location.href=hrefString;
	
}



//分页
   var PageCounts=<%=PageCounts%>;

   var postSelect,postSelectBystyle;
   
  
   
   for (var x = 1; x <= PageCounts+1; x++) {
	var hrefString=location.href.split('?')[0]+"?page="+x+"&q1="+getQueryVariable("q1")+"&q2="+getQueryVariable("q2");
	   var el= document.getElementById("pageul");
	  var ele=document.createElement('li');
	  var eleA=document.createElement('a');


	  eleA.href=hrefString;
	  eleA.innerText=""+x;
	  ele.appendChild(eleA);
	  el.appendChild(ele);

	   
   }
   
   //分页实现
	var bb=document.getElementById("pageul").children;
	var aa=document.getElementById("SearchPage").innerText;
	bb[aa].classList.add("active");


	 //类型选择展示
	 var SeletedStyle="<%=postSelectBystyle%>";
	  //console.log(SeletedStyle);
	  if(SeletedStyle!=""){
		  if(SeletedStyle=="全部"){
			var llll=document.getElementById("全部2");
		  }else{
			 var llll=document.getElementById(SeletedStyle); 
		  }
		   
	 
	 llll.classList.add("on"); 
	  }

	  //地区选择
	 var SeletedArea="<%=postSelect%>";
   if(SeletedArea!=""){
 //console.log(SeletedArea);
	  var dddd=document.getElementById(SeletedArea);
	 
	 dddd.classList.add("on");
   }
     
	 


  
  var postSelect,postSelectBystyle;
 
  
   //postSelect=<%=Request.Form("postSelect")%>;
   //postSelectBystyle=<%=Request.Form("postSelectBystyle")%>;
   //console.log(postSelect);
   //console.log(postSelectBystyle);
   //console.log("999");




  </script>

  
   <%if(postSelect!='')
   Response.write("<script>postSelect='"+postSelect+"'</script>");
   if(postSelectBystyle!='')
   Response.write("<script>postSelectBystyle='"+postSelectBystyle+"'</script>");
   %>


   <script>
	console.log(postSelect);
   console.log(postSelectBystyle);
   console.log("999");
   </script>
	</body>
</html>
