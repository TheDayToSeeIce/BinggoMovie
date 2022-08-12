<%@ Language="javascript" CODEPAGE="65001"%>
<%Response.Charset="utf-8"%>
<%

        var uid=parseInt(Request.QueryString("Receiver"));

    // 连接数据库
    var mycon = new ActiveXObject("ADODB.Connection");
    mycon.Open("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("./database/Binggo.accdb"));

    var sqlMatches = "SELECT   * FROM Users where RefUser="+uid;
    //创建数据集
	var recMatches = new ActiveXObject("ADODB.Recordset");
    recMatches.Open(sqlMatches, mycon);
   
   
   
	
%>
<!DOCTYPE html>
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">

<link rel="shortcut icon" type="image/x-icon" href="./assets/冰棍.svg" />
		<link rel="stylesheet" type="text/css" href="../../Bootstrap框架/bootstrap.min.css" />
		
		<link rel="stylesheet" type="text/css" href="./css/BinggoHome.css" />
		<link rel="stylesheet" type="text/css" href="./modules/bootstrap/bootstrap.min.css" />
		<script src="./modules/bootstrap/jquery.min.js"></script>
		<script src="./modules/bootstrap/bootstrap.min.js"></script>
		<script src="../js/test.js"></script>

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
						<li ><a href="binggohome.asp">首页</a></li>
						<li><a href="top100.asp?page=1">Top100</a></li>
						<li ><a href="MovieList.asp?page=1">全部电影</a></li>
						<!-- <li ><a href="./Commen.asp">精彩点评</a></li> -->
						<li class="active"><a href="messages.asp">私信</a></li>
						


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



        <div class="container">
          
            <div class="row">
               
                <div class="col-sm-4" style="width:500px;">
                    <h2 style="text-align: center">发送私信</h2>
                    <form action="send.asp" method="post" >
                        <table style="width:500px;">
                            <tr>
                                <td class="auto-style6">TO:</td>
                                <td class="auto-style7">
                                   
                                    <h3><%= unescape(recMatches.Fields("UserName").Value) %></h3>
                               
                                </td>
                            </tr>
                            <!-- <tr>
                                <td class="auto-style6">标题</td><br> <br>
                                <td class="auto-style7">
                                    <input id="Text1" type="text" name="txtSubject" required="required" size="55" maxlength="50"/>
                                    <input id="cboReceiver" type="text" name="cboReceiver" size="55" maxlength="50" style="display:none;" value="<%= uid %>"/>
                                </td>
                            </tr> -->
                            <tr>
                                <td class="auto-style4">信息<br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                </td>
                                <td class="auto-style5">
                                    <textarea id="styled" name="txtMessage" required="required" ></textarea>
                                    <input type="text" name="cboReceiver" style="display: none;" value="<%=uid%>">
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">&nbsp;</td>
                                <td class="auto-style3">
                                    &nbsp;<input id="Submit1" type="submit" value="发送" class="btn btn-success" />&nbsp;&nbsp;&nbsp;&nbsp;<input id="Reset1" type="reset" value="清除" class="btn btn-danger"/>
                                </td>
                            </tr>
                        </table>
                    </form> 
                </div>
            </div>
        </div>

<%
    mycon.Close();

%>
</body>
</html>