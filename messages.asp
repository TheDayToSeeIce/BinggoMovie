<%@ Language="javascript" %>
<!-- #include file="checkSession.asp" -->
<%
    // Clearing the session variable MESSAGE.
    Session("MESSAGE") = "";

    var mycon = new ActiveXObject("ADODB.Connection");
    mycon.Open("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("./database/Binggo.accdb"));

    // Retrieving information of the logged in user.
    var sqlUser = "SELECT * FROM Users WHERE RefUser = " + Session("RefUser");
    var recUser = new ActiveXObject("ADODB.Recordset");
    recUser.Open(sqlUser, mycon);

    var refUser = recUser.Fields("RefUser").Value;
    var recMessages = new ActiveXObject("ADODB.Recordset");
    var recSender = new ActiveXObject("ADODB.Recordset");

    var sqlMessages = "SELECT Users.RefUser, Messages.*, Users.UserName" 
    + " FROM  (Messages INNER JOIN Users ON Messages.Sender = Users.RefUser)  Where Messages.Receiver = "  + refUser;
    recMessages.Open(sqlMessages, mycon);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Binggo</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"> -->
	<link rel="shortcut icon" type="image/x-icon" href="./assets/冰棍.svg" />
		<!-- <link rel="stylesheet" type="text/css" href="../../Bootstrap框架/bootstrap.min.css" /> -->
		
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
    <!-- <script src="js/jquery.backstretch.min.js"></script>
    <script src="js/bodyBackground.js"></script> -->
	<script src="./modules/bootstrap/jquery.min.js"></script>
		<script src="./modules/bootstrap/bootstrap.min.js"></script>
		<!-- <script src="../js/test.js"></script> -->
  
</head>
<body style="background-color:#fff; color:#808080" onload="bodyOnLoad();">
    <div class="container-fluid">
        
		
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
						<li class="active"><a href="./messages.asp">私信</a></li>
		
		
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
		
        <div class="row ">

           
            
            <div class="col-sm-10">
                <p> <%=  Session("MESSAGE") %></p>
                <table class="table table-bordered table-hover table-striped table-responsive ">
                    <thead>
                        <tr>
                            <td style="color:black"></td>
                            <td style="color:black"></td>
                            <td style="color:black"></td>
                        </tr>
                    </thead>
                    <tbody>
                    <% if(recMessages.EOF) { %>
                        <tr>
                            <td colspan="3">没有信息.</td>
                        </tr>
                    <% } else { %>
                        <% while(!recMessages.EOF) { %>
                        <tr>
                            <td><img src="./assets/Users/<%= unescape(recMessages.Fields('UserName').Value) %>.jpg" class="img-circle" style="width: 50px;"><%= unescape(recMessages.Fields("UserName").Value) %></td>
                            <td><%= unescape(recMessages.Fields("Message").Value) %></td>
                            <td>
                                <!-- <a href="read.asp?refM=<%= recMessages.Fields("RefMessage").Value%>">查看</a> -->
                                &nbsp;&nbsp;
                                <a href="deletemsg.asp?refM=<%= recMessages.Fields("RefMessage").Value%>">删除</a>
                            </td>
                        </tr>
                        <% recMessages.MoveNext(); } %>
                    <% } %>
                    </tbody>
                </table>
                <%
                    recMessages.Close();
                    recUser.Close();
                    mycon.Close();
                %>
            </div>
           

        </div>
    </div>

    <script>
         function confirmDeleteProfile()
        {
            if (confirm("你确定要删除信息吗?") == true)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        function deleteProfile(ele)
        {
            if (confirm("你确定要删除信息吗?") == true)
            {
                window.location = "deletemsg.asp?refM="+ele;
                return true;
            }
            else
            {
                return false;
            }
        }
    </script>
</body>
</html>
