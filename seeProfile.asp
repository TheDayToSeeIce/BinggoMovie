
<%@ Language="javascript" CODEPAGE="65001"%>
<%Response.Charset="utf-8"%>

<%
   
   

    var mycon = new ActiveXObject("ADODB.Connection");
    mycon.Open("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("./database/Binggo.accdb"));

    var user=parseInt(Request.QueryString("user"));
    var sqlUser = "SELECT * FROM Users WHERE RefUser = " + user;
    var recUser = new ActiveXObject("ADODB.Recordset");
    recUser.Open(sqlUser, mycon);

    if (recUser.EOF)
    {
        recUser.Close();
        mycon.Close();
    }

    var username = recUser.Fields("UserName").Value;
    var sex = recUser.Fields("Sex").Value;
    
    var city = recUser.Fields("City").Value;
    
    var email = recUser.Fields("Email").Value;
    var aboutMe = recUser.Fields("AboutMe").Value;
   

    // 处理年份格式
    var birthDate = new Date(recUser.Fields("BirthDate").Value);

    var birthYear = birthDate.getFullYear().toString();
    var birthMonth = (birthDate.getMonth() + 1).toString();
    birthMonth = ("00" + birthMonth).slice(-2);
    var birthDay = birthDate.getDate().toString();
    birthDay = ("00" + birthDay).slice(-2);

    var birthDateYMD = birthYear + "-" + birthMonth + "-" + birthDay;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Binggo</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"> -->
	<link rel="shortcut icon" type="image/x-icon" href="./assets/冰棍.svg" />
		<link rel="stylesheet" type="text/css" href="../../Bootstrap框架/bootstrap.min.css" />
		
		<link rel="stylesheet" type="text/css" href="./css/BinggoHome.css" />
		<link rel="stylesheet" type="text/css" href="./modules/bootstrap/bootstrap.min.css" />
    <style type="text/css">
        .panel-heading.row {
            margin: 0;
            padding-left: 0;
            padding-right: 0;
        }
    </style>
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> -->
	<script src="./modules/bootstrap/jquery.min.js"></script>
		<script src="./modules/bootstrap/bootstrap.min.js"></script>
		<script src="../js/test.js"></script>
    <script src="js/jquery.backstretch.min.js"></script>
    <script src="js/bodyBackground.js"></script>
   
</head>
<body style="background-color:#fff; color:#808080" >
  
       
        <div class="row">
            <!--   导航栏  -->
		<nav class="navbar navbar-inverse" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#"> <span id="brand-img-span"> <img id="brand-img" src="./assets/冰棍.svg" /> </span>
						BingGo</a>
				</div>
				<div>
					<ul class="nav navbar-nav">
						<li ><a href="binggohome.asp">首页</a></li>
						<li><a href="top100.asp?page=1">Top100</a></li>
						<li><a href="MovieList.asp?page=1&q1=全部&q2=全部">全部电影</a></li>
						<!-- <li><a href="./Commen.asp">精彩点评</a></li> -->
						<li><a href="./messages.asp">私信</a></li>
						<li class="active"><a href="#">用户信息</a></li>


						<li class="dropdown">
							<!-- 用户名和用户头像 -->
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="./assets/Yui.jpg" width="40px" height="40px"
								 class="img-circle" />
								Chaoxip <b class="caret"></b>
							</a>
							<ul class="dropdown-menu">
								<li><a href="#">个人中心</a></li>
								<li><a href="myprofile.asp">修改信息</a></li>
								<li><a href="#">账号设置</a></li>


								<li class="divider"></li>
								<li><a href="logout.asp">退出登录</a></li>
							</ul>
						</li>

					</ul>
				</div>
			</div>
		</nav>
            <form action="updateProfile.asp" method="post" onsubmit=" checkPassword()">
                <div class="col-sm-4">
                    
                  <h3>用户名:<%=username%></h3>
                  <h3>性别:<%=sex%></h3>
                  <h3>城市:<%=city%></h3>
                  <h3>生日:<%=birthDateYMD%></h3>
                  <h3>简介:<%=aboutMe%></h3>



                   
                  
                   
                 
                   
                   
                   
                   
                   
                   
                   
                </div>
                <div class="col-sm-4">
                   
                    
                   
                   
                </div>
                <div class="col-sm-4">
                <%
                recUser.Close();
                mycon.Close();
                %>
                </div>
            </form>
        </div>
    
</body>
</html>	