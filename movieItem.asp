<%@ Language="javascript" CODEPAGE="65001"%>
<%Response.Charset="utf-8"%>
<%



   //获取URL的传递的电影id
    var ServerName = Request.ServerVariables("QUERY_STRING");
	var ServerName_String=""+ServerName;
	var ServerName_shuzhu=ServerName_String.split('=');
	var Query_mid=parseInt(ServerName_shuzhu[ServerName_shuzhu.length - 1]);
	

    // 连接数据库
    var mycon = new ActiveXObject("ADODB.Connection");
    mycon.Open("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("./database/Binggo.accdb"));
    var sqlMatches = "SELECT   * FROM MovieLists where MovieId="+Query_mid;


    //查找我的点评


    //创建数据集
	var recMatches = new ActiveXObject("ADODB.Recordset");
    recMatches.Open(sqlMatches, mycon);
	var VideoSource=recMatches.Fields("VideoSrc").Value;

    if (recMatches.EOF)
    {
        Session("MESSAGE") = "No matches for your profile.";
    }
   
   
   
	
%>
<!DOCTYPE html>
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
	<title>电影详情页</title>
<link rel="shortcut icon" type="image/x-icon" href="./assets/冰棍.svg" />
		<link rel="stylesheet" type="text/css" href="../../Bootstrap框架/bootstrap.min.css" />
		
		<link rel="stylesheet" type="text/css" href="./css/BinggoHome.css" />
		<link rel="stylesheet" type="text/css" href="./modules/bootstrap/bootstrap.min.css" />
		<script src="./modules/bootstrap/jquery.min.js"></script>
		<script src="./modules/bootstrap/bootstrap.min.js"></script>
		<script src="../js/test.js"></script>

		
 <script>

	   //屏蔽违禁词
	   function checkComment()
        {
            var comment=document.getElementById("CommentContent").value;
			var arr = ['傻逼','你是脑残','fuck you','加我微信','加我QQ','臭sb','nt玩意','你怎么不去死','六四','习近平','好似','开香槟','我是你爹','nmsl','cnm','色情','广告','select','update']; //定义敏感词数组
			
			
			
	
			
			
			//遍历数组

				for(x in arr){

    if(comment.indexOf(arr[x]) != -1){
            alert("评论含义违禁词或数据库关键词，请重新编辑评论后再发布！");
			return false;
        }
    }
	 
			
			return true;
		
   

			
        }
 </script>
 <style>
	 body{
		/* background-color: #CCFFFF; */
	 }
	 a:hover{
		cursor: pointer;
		text-decoration: none;
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
				<li><a href="./MovieList.asp?page=1&q1=全部&q2=全部">全部电影</a></li>
				<!-- <li ><a href="./Commen.asp">精彩点评</a></li> -->
				<li ><a href="./messages.asp">私信</a></li>


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


<div id="FullPage-Left">
			
			

			<div class="container">
				<div class="row">
					<div class="col-lg-4">
						<ol class="Top100List">
							<% while(!recMatches.EOF) { %>
							   <li style="list-style: none;">
								   <div class="item">
									   <div class="pic">
										   
										   <a  href="MovieItem.asp?mid=<%= unescape(recMatches.Fields("MovieId").Value) %>" >
											   <img width="200" src="./assets/MovieLists/<%= unescape(recMatches.Fields("EnglishName").Value) %>.jpg"
												class="">
										   </a>
									   </div><br/>
									   <div class="info">
										   <div class="hd">
											   <a href="MovieItem.asp?mid=<%= unescape(recMatches.Fields("MovieId").Value) %>" class="">
												   <h2> <span class="title" style="font-style: italic;font-weight: bold;font-size: larger;"><%= unescape(recMatches.Fields("MovieName").Value) %></span><br /> 
												   <span class="title">&nbsp;/&nbsp;<%= unescape(recMatches.Fields("EnglishName").Value) %></span></h2>
												  
												   
											   </a>
			   
						   
						   
											   
										   </div><br/>
										   <div class="bd">
											   <p class="" style="font-weight: bolder;">
												   导演: <%= unescape(recMatches.Fields("Director").Value) %> &nbsp;&nbsp;&nbsp;主演: <%= unescape(recMatches.Fields("Lead").Value) %><br>
												   <%= recMatches.Fields("ReleaseYear").Value %>&nbsp;/&nbsp;<%= unescape(recMatches.Fields("Producing_place").Value) %>&nbsp; 
											   </p>
						   
						   
											  
						   
											   
										   </div>
									   </div>
								   </div>
							   </li>
							   
							
						   
							   
						   
						   
							   
						   
						   
						   
						   
						   
						   </ol>

					</div>

					<div class="col-lg-7">
						<h2 style="font-weight: bolder;color: burlywood;">电影简介</h2>
						<p style="font-style: italic;color: rgb(205, 141, 24);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= unescape(recMatches.Fields("Synopsis").Value) %></p>
<br/>       <% if(recMatches.Fields("avg_point").Value==undefined){Response.write('暂无用户评分数据!')}else{;%>
						<h2 style="font-weight: bolder;">评分:&nbsp;<span style="font-style: italic;color: rgb(212, 164, 33);"><%=recMatches.Fields("avg_point").Value.toFixed(1) %></span> &nbsp;分 </h2><br />
						<%}%>

						<%
  

    var Mycommentsql =  "SELECT   * FROM Comments where UserName="+"'"+Session("UserName")+"'"+"and Mid="+Query_mid;
	
    var MycommentMatches = new ActiveXObject("ADODB.Recordset");
    MycommentMatches.Open(Mycommentsql, mycon);
	

	
%>


				
			<h3 style="font-weight: bolder;"> 
<%
                if(!MycommentMatches.EOF){
					Response.write("我的评分：<span style='font-style: italic;color:rgb(18, 200, 139);'>"+unescape(MycommentMatches.Fields("grade").Value)+"分</span>"); 
				}else{
					//Response.write("无");
					Response.write("<button type='button' class='btn btn-primary' onclick='showPingfen()'>添加点评</button>");
					
				}
                
				%>
<% MycommentMatches.Close(); %>
			</h3>
			         <button type='button' class='btn btn-primary' onclick="{document.getElementById('FilmVideo').style.display='block';document.getElementById('FilmVideo').src='<%=VideoSource%>';}">观看视频</button>
						
					</div>

					<iframe id="FilmVideo" style="display: none;" width="420" height="345" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true">
				 </iframe>
					<% recMatches.MoveNext(); %>
					<% } %>
					<% recMatches.Close(); %>


					

			<br />

				</div>



			</div>


			<div class="panel panel-default" style="border-style: none;display: none;" id="PingfenBlock">
				<div class="panel-heading"><span style="font-size: larger;color: coral ;font-weight: 800;font-size: 20px;"></span> &nbsp;点评电影<span style="font-style: italic;color: rgb(114, 175, 10);">&nbsp;</span></div>
				<div class="panel-body">
					<form role="form" action="addComment.asp" method="post" onsubmit="return checkComment()">
						<div class="form-group">
							<label for="name">选择评分</label>
							<select class="form-control" name="SelectedGrade" required>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
								<option>10</option>
							</select><br />
							<input type="text" name="CommentTitle" placeholder="输入评论标题" required>
							
							<input type="text" style="display: none;" name="CommentonMovie" value=<%=Query_mid%>><hr />
							<textarea name="CommentContent" id="CommentContent" placeholder="输入评论内容" style="width: 800px;height: 200px;" required></textarea><hr />
							<input type="submit" value="提交点评" class="btn btn-primary" style="width: 800px;" > <hr />
							<button type="button" class="btn btn-primary" style="width: 800px;" onclick=" {document.getElementById('PingfenBlock').style.display='none'}">取消</button>
							
						</div>
					</form>
				</div>
				<ul class="list-group">
					
			
					
				</ul>
			</div>
			
		
		
			
			
			
			
			
			<!--   左屏幕模块/热门评论  -->
			<div class="div-GoodComments">

				<h1 style="font-weight: bolder;color: burlywood;">全部评论</h1><hr />



<%
  

    
    
    var sqlMatches2 = "SELECT  * FROM Comments where Mid="+Query_mid+" order by likes desc";
    var recMatches2 = new ActiveXObject("ADODB.Recordset");
    recMatches2.Open(sqlMatches2, mycon);

   
    if(recMatches2.BOF){

	Response.write("<h2>暂无评论信息！</h2><hr />")
}
%>
   
   
	


                
                    
                    <% while(!recMatches2.EOF) { %>
                       
			
		




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
		
<div class="panel panel-default" style="border-style: none;">
    <div class="panel-heading"><span style="font-size: larger;color: coral ;font-weight: 800;font-size: 20px;"><%= unescape(recMatches2.Fields("title").Value) %></span> </div>
    <div class="panel-body " >
		<p style="visibility: hidden;"><%= unescape(recMatches2.Fields("Uid").Value) %></p>
         <img src="./assets/Users/<%= unescape(recMatches2.Fields('UserName').Value) %>.jpg" width="50px" height="50px" class="img-circle " onclick="showRlyBtn(this)"  > <span style="font-weight: bolder;font-style: italic;color: rgb(56, 135, 135);" onclick="showRlyBtn(this)" ><%= unescape(recMatches2.Fields("UserName").Value) %></span>&nbsp;&nbsp;发表于   <span style="color:rgb(56, 135, 135) ;"><%= CommentDateYMD %></span>
		<br /><div id="ReplyBtn" style="border-style: solid;display: none; margin-top: 20px;width: 100px;height: 66px;text-align: center;background-color: antiquewhite;"><span onclick="moveTo(this)">发送私信</span><br /><span onclick="see_profile(this)">查看个人信息</span><br /><span onclick="hideRlyBtn(this)">取消</span></div>
    </div>
    <ul class="list-group">
        <li class="list-group-item" style="color: rgb(97, 144, 15);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><%= unescape(recMatches2.Fields("Content").Value) %></li>
		 <li class="list-group-item"><span style="font-weight: bolder;font-style: italic;">点赞&nbsp;</span><span id="likespan" ><%= unescape(recMatches2.Fields("likes").Value) %></span><div   onclick="updateLikes(this)" id="likebtn<%=unescape(recMatches2.Fields('cid').Value) %>"  class="noactive box" ></div> 
		 <span style="font-weight: bolder;font-style: italic;">点踩&nbsp;</span><span><%= unescape(recMatches2.Fields("dislikes").Value) %></span> <img src="assets/svg/dislikeClick.svg" width="30px" onclick="updateDislikes(this,<%=unescape(recMatches2.Fields('cid').Value) %>)"/> &nbsp;&nbsp;&nbsp;<a style="font-size: 15px;border-style: solid;padding: 7px;color: black;border-color: grey;border-radius: 5px;"  onclick="showHuifuPinlun(this)">我也说一句</a></li> 

         
		 <script>
			 //发送私信
			 function moveTo(ele){
				 
				 var teps=ele.parentNode.parentNode.childNodes[1].innerHTML;
				
				this.location.href='sendMessage.asp?Receiver='+teps;
			 }
			 function see_profile(ele){
				 
				 var teps=ele.parentNode.parentNode.childNodes[1].innerHTML;
				
				this.location.href='seeProfile.asp?user='+teps;
			 }
			 
			 function showRlyBtn(ele){
				console.log(ele.parentNode.childNodes[10]);
				ele.parentNode.childNodes[10].style.display="block";
			}
			function hideRlyBtn(ele){
				console.log(ele.parentNode);
				ele.parentNode.style.display="none";
			}
			
		 </script>
<%
    
    var getReplysql = "SELECT  * FROM Reply  where onComment="+recMatches2.Fields("cid").Value;
	
    var getReplyMatches = new ActiveXObject("ADODB.Recordset");
    getReplyMatches.Open(getReplysql, mycon);
	while(!getReplyMatches.EOF){
		
		//处理日期格式
	var CommentDate = new Date(getReplyMatches.Fields("ReplyDate").Value);

    var CommentYear = CommentDate.getFullYear().toString();
    var CommentMonth = (CommentDate.getMonth() + 1).toString();
    CommentMonth = ("00" + CommentMonth).slice(-2);
    var CommentDay = CommentDate.getDate().toString();
    CommentDay = ("00" + CommentDay).slice(-2);

    var CommentDateYMD = CommentYear + "-" + CommentMonth + "-" + CommentDay;
		
		<!-- 展示回复 -->

         Response.write("<li class='list-group-item' style='background-color:rgb(229, 224, 224);margin-bottom: 1px;'><span>用户&nbsp;@</span><span style='font-weight: bolder;font-style: italic;color: rgb(56, 135, 135);'>"+ getReplyMatches.Fields("UserSender").Value+" </span><span>：回复</span><span style='font-weight: bolder;font-style: italic;color: rgb(56, 135, 135);'>&nbsp;&nbsp;@"+getReplyMatches.Fields("UserReceiver").Value+"：</span>"+getReplyMatches.Fields("Content").Value+"<br /><small>"+CommentDateYMD+"</small><a onclick='showHuifuhuifu(this)' style='float: right;'>回复</a></li> ");
		 getReplyMatches.MoveNext();
	 }
	 getReplyMatches.close();

	
%>
		 <h1 style="margin-bottom: 1px;"></h1>
       
		 <!-- 回复评论回复框 -->
		 <li class="list-group-item" style="display: none;" id="ReplyComment"><%=Session("UserName")%>&nbsp;&nbsp;回复用户&nbsp;<span style="font-weight: bolder;font-style: italic;color: rgb(56, 135, 135);"><%= unescape(recMatches2.Fields("UserName").Value) %>：</span>
			<form action="ReplyComment.asp" method="post">
				<input type="text" name="ReplyCommentContent">&nbsp;&nbsp;
				<input type="text" name="ReplyCommentReceiver" value="<%= unescape(recMatches2.Fields('UserName').Value) %>" style="display: none;">&nbsp;&nbsp;
				<input type="text" name="ReplyCommentonComment" value="<%= unescape(recMatches2.Fields('cid').Value) %>" style="display: none;">&nbsp;&nbsp;
				
				<button type="submit" class="btn btn-info">回复</button>
			</form>
			</li>
		 <!-- 回复回复回复框 -->
		 <li class="list-group-item" style="display: none;" id="Replyreply">我&nbsp;&nbsp;回复用户&nbsp;<span style="font-weight: bolder;font-style: italic;color: rgb(56, 135, 135);" id="ReplyreplyId">@：</span>
			<form action="ReplyUser.asp" method="post">
				<input type="text" name="ReplyUserContent">&nbsp;&nbsp;
				<input type="text" name="ReplyUserReceiver" id="FormUserReceiver" style="display:none;">&nbsp;&nbsp;
				<input type="text" name="ReplyUseronComment" value="<%= unescape(recMatches2.Fields('cid').Value) %>" style="display: none;">&nbsp;&nbsp;
				
				<button type="submit" class="btn btn-info">回复</button>
			</form>
		
		</li> 

        
    </ul>
</div>
<hr />

		<% recMatches2.MoveNext(); %>
                    <% } %>
                    <% recMatches2.Close(); %>		




				
				
				<!--底部信息 -->
				<div class="Botton_Message">
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
					
					

				</div>





			</div>
			
			
			
			
			
			
		</div>

		

		<script>
			//更新点赞	
		
function updateLikes(ele)
{
	
//实现点赞动画效果
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

ele.parentNode.previousElementSibling.nextElementSibling.children[4].innerHTML=xmlhttp.responseText;
ele.parentNode.previousElementSibling.nextElementSibling.children[5].src="assets/svg/dislikeClick2.svg";
console.log(ele.parentNode.previousElementSibling.nextElementSibling.children[5]);	
}


}
xmlhttp.open("GET","/BingGo/updateDislikes.asp?cid="+cid,true);
xmlhttp.send();
ele.onclick=null;


 


}
         
//展示评分框
		 function showPingfen(){
			 
			document.getElementById('PingfenBlock').style.display="block";
		 }
		 function showHuifuPinlun(ele){
			var len=ele.parentNode.parentNode.childNodes.length;
			 console.log(ele.parentNode.parentNode.childNodes[len-6]);
			 ele.parentNode.parentNode.childNodes[len-6].style.display="block";
		  }
		  function showHuifuhuifu(str1){
			var len=str1.parentNode.parentNode.childNodes.length;
			var tre1=str1.parentNode.childNodes[1].innerText;
			str1.parentNode.parentNode.childNodes[len-2].childNodes[1].innerText="@:"+str1.parentNode.childNodes[1].innerText;
			console.log(str1.parentNode.parentNode.childNodes[len-2].childNodes[3].childNodes[3]);
			str1.parentNode.parentNode.childNodes[len-2].childNodes[3].childNodes[3].value=str1.parentNode.childNodes[1].innerText;
			//document.getElementById("ReplyreplyId").innerText=tre1;
			//document.getElementById("FormUserReceiver").value=tre1;
			
			 console.log(str1.parentNode.childNodes[1].innerText);
			 //document.getElementById('Replyreply').style.display="block";

			
			 console.log(str1.parentNode.parentNode.childNodes[len-2]);
			 str1.parentNode.parentNode.childNodes[len-2].style.display="block";
		  }

		 
    

		</script>
</body>
</html>