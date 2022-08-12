
<%@ Language="javascript" CODEPAGE="65001"%>
<%Response.Charset="utf-8"%>

<%
  

    // 连接数据库
    var mycon = new ActiveXObject("ADODB.Connection");
	mycon.Open("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("./database/Binggo.accdb"));
    var sqlMatches = "SELECT  top 8 * FROM MovieLists order by NumberOfRates,ReleaseYear";
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
   
   
   
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>BingGo首页</title>
		<link rel="shortcut icon" type="image/x-icon" href="./assets/冰棍.svg" />
		<!-- <link rel="stylesheet" type="text/css" href="../../Bootstrap框架/bootstrap.min.css" /> -->
		
		<!-- <link rel="stylesheet" type="text/css" href="./css/BinggoHome.css" /> -->
		<!-- <link rel="stylesheet" type="text/css" href="./modules/bootstrap/bootstrap.min.css" /> -->

		
		<link rel="stylesheet" href="static/css/bootstrap.css">
		<link rel="stylesheet" href="static/css/animate.css">
		<link rel="stylesheet" href="static/css/owl.carousel.min.css">
		<link rel="stylesheet" href="static/css/aos.css">
	
		<link rel="stylesheet" href="static/css/magnific-popup.css">
	
	
		<link rel="stylesheet" href="static/css/ionicons.min.css">
		<link rel="stylesheet" href="static/css/font-awesome.min.css">
		<link rel="stylesheet" href="static/css/flaticon.css">
	
		<!-- Theme Style -->
		<link rel="stylesheet" href="static/css/style.css">




		<script src="./modules/bootstrap/jquery.min.js"></script>
		<script src="./modules/bootstrap/bootstrap.min.js"></script>
		<script src="../js/test.js"></script>
		
		<style>
			body{
				background-color: #CCFFFF;
			}
			.noactive {
				width: 100px;
				height: 100px;
				
                display: inline;
				background: url(./20191012183039430.png)no-repeat;
				background-position: left;
				background-size: cover;
				/* border: 1px solid black; */
	
				margin: -20px ;
				padding-top:50px;
padding-bottom:50px;
padding-right:50px;
padding-left:66px
			}
	
			.box:hover {
				background-position: right;
				transition: background .6s steps(28);
			}
			.actived{
				background: url(./20191012183039430.png)no-repeat;
				background-position: right;
				padding-left:57px
			}
			
		</style>
		
	</head>
	<body>


		<header role="banner">
			<nav class="navbar navbar-expand-md navbar-dark bg-dark">
			  <div class="container">
				<a class="navbar-brand" href="binggohome.asp">BingGo</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample05" aria-controls="navbarsExample05" aria-expanded="false" aria-label="Toggle navigation">
				  <span class="navbar-toggler-icon"></span>
				</button>
	  
				<div class="collapse navbar-collapse" id="navbarsExample05">
				  <ul class="navbar-nav ml-auto pl-lg-5 pl-0">
					<li class="nav-item">
					  <a class="nav-link active" href="binggohome.asp">主页</a>
					</li>
					<li class="nav-item">
					  <a class="nav-link" href="top100.asp?page=1">top100</a>
					</li>
					<!-- <li class="nav-item dropdown">
					  <a class="nav-link dropdown-toggle" href="services.html" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Services</a>
					  <div class="dropdown-menu" aria-labelledby="dropdown04">
						<a class="dropdown-item" href="services.html">Food Catering</a>
						<a class="dropdown-item" href="services.html">Drink &amp; Beverages</a>
						<a class="dropdown-item" href="services.html">Wedding &amp; Birthday</a>
					  </div>
					</li> -->
					<li class="nav-item">
					  <a class="nav-link" href="MovieList.asp?page=1&q1=全部&q2=全部">全部电影</a>
					</li>
					<li class="nav-item">
					  <a class="nav-link" href="messages.asp">私信</a>
					</li>
				  </ul>
	  
				  <ul class="navbar-nav ml-auto">
					<!-- <li class="nav-item cta-btn">
					  <a class="nav-link" href="contact.html">Contact Us</a>
					  
					</li> -->


					  <li class="dropdown">
					
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="./assets/Users/<%=Session('UserName') %>.jpg" width="40px" height="40px"
						 class="img-circle" />
						 <%=Session("UserName") %> <b class="caret"></b>
					</a>
					<ul class="dropdown-menu">
						
						<li><a href="myprofile.asp">修改信息</a></li>
						<li><a href="Myhistory.asp">我看过的电影</a></li>


						<li class="divider"></li>
						<li><a href="logout.asp">退出登录</a></li>
					</ul>
				</li>
				  </ul>
				
				  
				</div>
			  </div>
			</nav>
		  </header>

		  
        <!-- 自动轮播插件 -->
		  <div class="slider-wrap">
			<section class="home-slider owl-carousel">
	  
	  
			  <div class="slider-item" style="background-image: url('assets/xiaohuangren.jpg');">
				
				<div class="container">
				  <div class="row slider-text align-items-center justify-content-center">
					<div class="col-md-8 text-center col-sm-12 ">
					  <h1 data-aos="fade-up">欢迎来到BingGo影视作品点评网站</h1>
					
					  <p class="mb-5" data-aos="fade-up" data-aos-delay="100">BingGo影视作品点评网站为您提供影视作品点评交流的服务</p>
					  <!-- <p data-aos="fade-up" data-aos-delay="200"><a href="#" class="btn btn-white btn-outline-white">开始</a></p> -->
					</div>
				  </div>
				</div>
	  
			  </div>
	  
			  <div class="slider-item" style="background-image: url('assets/cjh.jpg');">
				<div class="container">
				  <div class="row slider-text align-items-center justify-content-center">
					<div class="col-md-8 text-center col-sm-12 ">
					  
					  
					</div>
				  </div>
				</div>
				
			  </div>
			  <div class="slider-item" style="background-image: url('assets/xskdjs.jpg');">
				<div class="container">
				  <div class="row slider-text align-items-center justify-content-center">
					<div class="col-md-8 text-center col-sm-12 ">
					  
					  
					</div>
				  </div>
				</div>
				
			  </div>
			  <div class="slider-item" style="background-image: url('assets/qianxun.jpg');">
				<div class="container">
				  <div class="row slider-text align-items-center justify-content-center">
					<div class="col-md-8 text-center col-sm-12 ">
					  
					  
					</div>
				  </div>
				</div>
				
			  </div>
			  <div class="slider-item" style="background-image: url('assets/kon2.jpg');">
				<div class="container">
				  <div class="row slider-text align-items-center justify-content-center">
					<div class="col-md-8 text-center col-sm-12 ">
					  
					  
					</div>
				  </div>
				</div>
				
			  </div>
	  
			</section>
		  <!-- END 自动轮播插件 -->
		  </div> 

		 
		<!--   左屏幕模块  -->
		<div id="FullPage-Left" style="margin-top: 255px;">
			<!--   左屏幕模块/热门电影  -->
			<div class="div-HotMovie">


				<div class="container mb-5">
					<div class="row justify-content-center">
					  <div class="col-lg-6 text-center">
						<div class="row">
						  <div class="col-md-12 mb-3">
							<h3>搜索电影</h3>
							
							<p>按电影名字进行电影搜索</p>
							
						
						  </div>
			
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


				<!--   热门电影  -->
				
				
					<div class="clearfix mb-5 pb-5">
						<div class="container-fluid">
						  <div class="row" data-aos="fade">
							<div class="col-md-12 text-center heading-wrap">
							  <h2>热门电影</h2>
							  
							</div>
						  </div>
						</div>
					  </div>

					  <div class="container">
						<%  var count=1;
						while(!recMatches.EOF) { %>









							<!--去除左右空隙 no-gutters -->
						<div class="row no-gutters" >

								<div class="col-md-6" >
							<div class="sched d-block d-lg-flex">
							<div class="bg-image order-2"  data-aos="fade" style="background-color: #CCFFFF;">
								<a  href="MovieItem.asp?mid=<%= unescape(recMatches.Fields('MovieId').Value) %>" >	<img alt="" src="./assets/MovieLists/<%= unescape(recMatches.Fields("EnglishName").Value) %>.jpg" width="135px" height="200px"
									></a>
							
							</div>
							  <div class="text order-1" style="background-color: #CCFFFF;">
								<h2><a  href="MovieItem.asp?mid=<%= unescape(recMatches.Fields('MovieId').Value) %>" ><%=count%>.<%= unescape(recMatches.Fields("MovieName").Value) %></a></h2>
								<p style="color: black;">&nbsp;&nbsp;&nbsp;&nbsp;导演：&nbsp;&nbsp;<%= unescape(recMatches.Fields('Director').Value) %></p>
								<p style="color: black;">&nbsp;&nbsp;&nbsp;&nbsp;主演：&nbsp;&nbsp;<%= unescape(recMatches.Fields('Lead').Value) %></p>
								
								<!-- <p></p> -->
								<!-- <p class="text-primary h3">$12.00</p> -->
							  </div>
							  
							</div>
				
							
				
						  </div>

						  <div class="col-md-6">
                            <p style="font-style: italic;color: dodgerblue;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= recMatches.Fields('Synopsis').Value %></p>
							
						  </div>


						</div><br /><hr>
						<% count++ %>
						<% recMatches.MoveNext(); %>
						<% } %>
						<% recMatches.Close(); %>
					
				
					  </div>
					  
				
				


				

			<!--   左屏幕模块/热门评论  -->
			<div class="div-GoodComments">

				<section class="section relative-higher">

					<div class="clearfix mb-5 pb-5">
					  <div class="container-fluid">
						<div class="row" data-aos="fade">
						  <div class="col-md-12 text-center heading-wrap">
							<h2>精彩评论</h2>

						  </div>
						</div>
					  </div>
					</div>
			  
					<div class="container">
			  
					  <div class="row justify-content-center">
						<div class="col-lg-7">
						  <div class="owl-carousel centernonloop2">

<%
  

    // 连接数据库
   
    var sqlComments = "SELECT   top 3 Comments.*, MovieLists.MovieName FROM MovieLists, Comments WHERE (((Comments.Mid)=[MovieLists].[MovieId])) order by likes";
    //创建数据集
	var recComments = new ActiveXObject("ADODB.Recordset");
    recComments.Open(sqlComments, mycon);

	

    if (recComments.EOF)
    {
        Session("MESSAGE") = "没有找到评论！";
    }
	while(!recComments.EOF) { 
   
   
	
%>


							<div class="slide" data-aos="fade-left" data-aos-delay="100">
							  <blockquote class="testimonial">
								<p>&ldquo;<%= recComments.Fields('Content').Value %> &rdquo;</p>
								<div class="d-flex author">
								  <img src="./assets/Users/<%= recComments.Fields('UserName').Value %>.jpg" alt="" class="mr-4">
								  <div class="author-info">
									<h4><%= recComments.Fields('UserName').Value %></h4>
									<p>关于电影<span style="color: red;">&nbsp;《<%= recComments.Fields('MovieName').Value %>》</span></p>
								  </div>
								</div>  
							  </blockquote>
							</div>
							<% recComments.MoveNext(); %>
						<% } %>
						<% recComments.Close(); %>

							
						  </div>
						</div>
					  </div>
			  
					  
			  
					  
					</div>
				  </section> <!-- .section -->

				

				  <section class="section ">

					<div class="clearfix mb-5 pb-5">
					  <div class="container-fluid mb-5">
						<div class="row" data-aos="fade">
						  <div class="col-md-12 text-center heading-wrap">
							<h2>推荐电影</h2>
						  </div>
						</div>
					  </div>

					  <div class="owl-carousel centernonloop">
						<%
  

						
					   
						var sqlRecommend = "SELECT   top 4 * FROM MovieLists order by NumberOfRates,MovieId";
						//创建数据集
						var recRecommend = new ActiveXObject("ADODB.Recordset");
						recRecommend.Open(sqlRecommend, mycon);
					
						
					
						if (recRecommend.EOF)
						{
							Session("MESSAGE") = "没有找到电影！";
						}
						while(!recRecommend.EOF) { 
					   
					   
						
					%>
						<a href="MovieItem.asp?mid=<%= unescape(recRecommend.Fields('MovieId').Value) %>" class="item-dishes" data-aos="fade-right" data-aos-delay="100" style="width: 350px;margin-right: 10px;">
						  <div class="text">
							<!-- <p class="dishes-price">$11.50</p> -->
							<h2 class="dishes-heading"><%= recRecommend.Fields('MovieName').Value %></h2>
						  </div>
						  <img src="assets/MovieLists/<%= recRecommend.Fields('EnglishName').Value %>.jpg" alt="" class="img-fluid">
						</a>
						<% recRecommend.MoveNext(); %>
						<% } %>
						<% recRecommend.Close(); %>
						
					  </div>
					</div>
			  
				  </section> <!-- .section -->

				  <div class="col-md-12 text-center heading-wrap">
					<h2>热门评论</h2><br /><br />
					
				  </div>




<%
  

    
    
    var sqlMatches2 = "SELECT  top 6 * FROM Comments,MovieLists where Comments.Mid=MovieLists.MovieId";
    var recMatches2 = new ActiveXObject("ADODB.Recordset");
    recMatches2.Open(sqlMatches2, mycon);

   
   
   
   
	
%>

                
                    
                    <% while(!recMatches2.EOF) { %>
                       
			
		
<% var likeSQL="update Comments set likes = 78 where cid='1'" 


 function updateLikes()
        {
           mycon.Execute(likeSQL);
		   return;
        }
%>



		<%
		//处理日期格式
	var CommentDate = new Date(recMatches2.Fields("CommenDate").Value);

    var CommentYear = CommentDate.getFullYear().toString();
    var CommentMonth = (CommentDate.getMonth() + 1).toString();
    CommentMonth = ("00" + CommentMonth).slice(-2);
    var CommentDay = CommentDate.getDate().toString();
    CommentDay = ("00" + CommentDay).slice(-2);

    var CommentDateYMD = CommentYear + "-" + CommentMonth + "-" + CommentDay;
		
		%>




		<script>
			
			
			

		
		
		
		

		
		

		
	//更新点赞	
		
function updateLikes(ele)
{
	

	ele.classList.add("actived");
			ele.classList.remove("mystyle");

 var str=ele.id;
   console.log(str);
	var temp1_array=str.split('n');
	var temss=temp1_array[temp1_array.length - 1]
	var temp_cid=parseInt(temp1_array[temp1_array.length - 1]);
	var ssss="likespan"+temss
xmlhttp=new XMLHttpRequest();
console.log(xmlhttp);
xmlhttp.onreadystatechange=function()
{
if (xmlhttp.readyState==4 && xmlhttp.status==200)
{
	
console.log(ssss)
console.log(ele.parentNode.previousElementSibling.nextElementSibling.children[1]);
ele.parentNode.previousElementSibling.nextElementSibling.children[1].innerText=xmlhttp.responseText;


}


}
xmlhttp.open("GET","/BingGo/updateLikes.asp?cid="+temp_cid,true);
xmlhttp.send();
ele.onclick=null;

}

//更新点踩
function updateDislikes(ele,cid)
{
	


xmlhttp=new XMLHttpRequest();
console.log(xmlhttp);
xmlhttp.onreadystatechange=function()
{
if (xmlhttp.readyState==4 && xmlhttp.status==200)
{
	
ele.parentNode.previousElementSibling.nextElementSibling.children[4].innerText=xmlhttp.responseText;
ele.parentNode.previousElementSibling.nextElementSibling.children[5].src="assets/svg/dislikeClick2.svg";
}


}
xmlhttp.open("GET","/BingGo/updateDislikes.asp?cid="+cid,true);
xmlhttp.send();
ele.onclick=null;


 


}
 



	</script>




<div class="panel panel-default">
    <div class="panel-heading"><h2 style="font-weight: bolder;">&nbsp;&nbsp;<%= unescape(recMatches2.Fields("title").Value) %></h2></div>
	<p>关于电影《<%= unescape(recMatches2.Fields("MovieName").Value) %>》</p>
    <div class="panel-body">
        <p style="color: chocolate;"><%= CommentDateYMD %></p>
        
		
    </div>
    <ul class="list-group">
        <li class="list-group-item" style="background-color: #CCFFFF;"><p style="color: cornflowerblue;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= unescape(recMatches2.Fields("Content").Value) %></p></li>
		
		 <li class="list-group-item" style="background-color: #CCFFFF;"> <span>点赞</span> <span id="likespan" ><%= unescape(recMatches2.Fields("likes").Value) %></span>  <div   onclick="updateLikes(this)" id="likebtn<%=unescape(recMatches2.Fields('cid').Value) %>"  class="noactive box" ></div> 
			<span>点踩&nbsp;</span><span><%= unescape(recMatches2.Fields("dislikes").Value) %>&nbsp;&nbsp;&nbsp;&nbsp;</span><img src="assets/svg/dislikeClick.svg" width="30px"    onclick="updateDislikes(this,<%=unescape(recMatches2.Fields('cid').Value) %>)" />  
		
		</li>
        
    </ul>
</div> <br /><br />
		<% recMatches2.MoveNext(); %>
                    <% } %>
                    <% recMatches2.Close(); %>		




				
				
				<!--底部信息 -->
				<div class="Botton_Message">
					<!-- <h1>底部信息</h1> -->
					
					

				</div>





			</div>






		</div>

		<!--   右屏幕模块  -->
		



		<!--  回到顶部  -->
		<div id="BackTop">
			<span> <a href="#"><img id="backTotop_svg" src="./assets/svg/backToTop.svg" width="90px" height="90px"/></a> </span>
			
			
		</div>
    </div>



	<div id="footer">
		<div class="footer-extra"></div>
	
<span id="icp" class="fleft gray-link">
© 2022－20?? Binggo.xyz, all rights reserved ..
</span>



<span class="fright" style="float: right;">
<a href="#" style="color: black;">关于Binggo</a>
<a href="#" style="color: black;">联系我们</a>

</span>

</div>

<%
    
    mycon.Close();
%>

<script src="static/js/jquery-3.2.1.min.js"></script>
    <script src="static/js/popper.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <script src="static/js/owl.carousel.min.js"></script>
    <script src="static/js/jquery.waypoints.min.js"></script>
    <script src="static/js/aos.js"></script>

    <script src="static/js/jquery.magnific-popup.min.js"></script>
    <script src="static/js/magnific-popup-options.js"></script>
    

    <script src="static/js/main.js"></script>
	</body>
</html>
