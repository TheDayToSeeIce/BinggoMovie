<%@ Language="javascript" %>
<!-- #include file="checkSession.asp" -->
<%
    var ref = Request.QueryString("refM");

    var mycon = new ActiveXObject("ADODB.Connection");
    mycon.Open("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("./database/Binggo.accdb"));

    var sql = "SELECT Users.UserName, Messages.RefMessage, Messages.Title, Messages.Message, Messages.DateMessage, Messages.Sender FROM (Messages INNER JOIN Users ON Messages.Sender = Users.RefUser) WHERE (Messages.RefMessage = "+ref+")";
    
    var myrec = new ActiveXObject("ADODB.Recordset");
    myrec.Open(sql, mycon);

    mycon.Execute("UPDATE Messages SET New=1 WHERE RefMessage=" + ref);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Binggo-查看私信</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"> -->
    <style type="text/css">
        .panel-heading.row {
            margin: 0;
            padding-left: 0;
            padding-right: 0;
        }
    </style>
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="js/jquery.backstretch.min.js"></script>
    <script src="js/bodyBackground.js"></script> -->
    


<!-- 搬运主页引入 -->
<link rel="shortcut icon" type="image/x-icon" href="./assets/冰棍.svg" />
		<link rel="stylesheet" type="text/css" href="../../Bootstrap框架/bootstrap.min.css" />
		
		<link rel="stylesheet" type="text/css" href="./css/BinggoHome.css" />
		<link rel="stylesheet" type="text/css" href="./modules/bootstrap/bootstrap.min.css" />

		
		
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

    <script type="text/javascript">
        function bodyOnLoad()
        {
            bodyBackground();
        }
    </script>
</head>
<body style="background-color:#fff; color:#808080" onload="bodyOnLoad();">
    <div class="container-fluid">
        
        <div class="row">
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
						<!-- <li ><a href="./Commen.asp">精彩点评</a></li> -->
						<li class="active"><a href="./messages.asp">私信</a></li>
		
		
						<li class="dropdown">
							<!-- 用户名和用户头像 -->
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="./assets/Yui.jpg" width="40px" height="40px"
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
            <div class="col-sm-4">
                <table class="auto-style1" border="1" width="500">
                    <tr>
                        <td class="auto-style2">私信来自:</td>
                        <td class="auto-style3"><%= unescape(myrec.Fields("UserName").Value) %></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">标题:</td>
                        <td class="auto-style3"><%= unescape(myrec.Fields("Title").Value) %></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">日期:</td>
                        <td class="auto-style3"><%= myrec.Fields("DateMessage").Value %></td>
                    </tr>
                    <tr>
                        <td class="auto-style2">信息</td>
                        <td class="auto-style3"><%= unescape(myrec.Fields("Message").Value) %></td>
                    </tr>
                </table>
                <a href="messages.asp"><p>返回</p></a>
            </div>
            <div class="col-sm-4"/>
            <div class="col-sm-4"/>
        </div>
    </div>
</body>
</html>