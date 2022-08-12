<%@ Language="javascript" %>

<!-- #include file="checkSession.asp" -->
<!-- #include file="functions.asp" -->
<%
    
    Session("MESSAGE") = "";

    var mycon = new ActiveXObject("ADODB.Connection");
    mycon.Open("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("./database/Binggo.accdb"));

    
    var sqlUser = "SELECT * FROM Users WHERE RefUser = " + Session("RefUser");
    var recUser = new ActiveXObject("ADODB.Recordset");
    recUser.Open(sqlUser, mycon);

    if (recUser.EOF)
    {
        recUser.Close();
        mycon.Close();
    }

    var username = recUser.Fields("UserName").Value;
    var tel = recUser.Fields("telephone").Value;
    var sex = recUser.Fields("Sex").Value;
    
    var city = recUser.Fields("City").Value;
    
    var email = recUser.Fields("Email").Value;
    var aboutMe = recUser.Fields("AboutMe").Value;
   

   
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
    <script type="text/javascript">
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

        function deleteProfile()
        {
            if (confirm("你确定要删除信息吗?") == true)
            {
                window.location = "deleteProfile.asp";
                return true;
            }
            else
            {
                return false;
            }
        }

      

        function setFields()
        {
            var txtName = document.getElementById("txtName");
            txtName.value = unescape("<%=username%>");
            var cboSex = document.getElementById("cboSex");
            cboSex.value = "<%=sex%>";
            
            var txtCity = document.getElementById("txtCity");
            txtCity.value = unescape("<%=city%>");
            
            var txtBirthdate = document.getElementById("txtBirthdate");
            txtBirthdate.value = "<%=birthDateYMD%>";
            var txtEmail = document.getElementById("txtEmail");
            txtEmail.value = "<%=email%>";
            var txtAbout = document.getElementById("txtAbout");
            txtAbout.value = unescape("<%=aboutMe%>");
           
        }

        function checkPassword()
        {
            if (document.getElementById("txtpwd1").value == document.getElementById("txtpwd2").value)
            {
                return true;
            }
            else
            {
                window.alert("密码不一致！");
                return false;
            }
        }
    </script>
</head>
<body style="background-color:#fff; color:#808080" >
    <div class="container">
       
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
						<li class="active"><a href="./myprofile.asp">修改信息</a></li>


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
                    <h3>修改你的信息</h3>
                    <hr>
                    <a href="addUserTouxiang.asp">修改用户头像</a>
                  <hr>
                    <p>
                        <strong>名字:</strong> 
                        <input type="text" name="txtName" id="txtName" size="30" maxlength="25" value="<%=unescape(username)%>" required/>
                    </p>
                    <label>性别:</label>
                   
			        <select id="cboSex" name="cboSex">
				        <option value="女">女</option>
				        <option value="男">男</option>
			        </select>
                   
                   
                    <p>
                        <strong>城市:</strong> 
                        <input type="text" name="txtCity" id="txtCity" size="30" maxlength="25" value="<%=unescape(city)%>" required/>
                    </p>
                   
                   
                    <p>
                        <strong>生日:</strong>
                        
                        <input type="date" id="txtBirthdate" name="txtBirthdate" required value="<%= birthDateYMD%>" >
                      
                    </p>
                   
                    <p>
                        <strong>电子邮箱:</strong> 
                        <input type="email" name="txtEmail" id="txtEmail" readonly value="<%=email%>"/>
                    </p>
                    <p>
                        <strong>电话:</strong> 
                        <input type="text" name="txttel" id="txttel" size="30" maxlength="25" value="<%=unescape(tel)%>" required/>
                    </p>
                   
                    <p>
                        <strong>密码:</strong> 
                        <input id="txtpwd1" maxlength="10" name="txtpwd1" size="20" type="password" required/>
                    </p>
                   
                    <p>
                        <strong>再次输入密码:</strong> 
                        <input id="txtpwd2" maxlength="10" name="txtpwd2" size="20" type="password" required/>
                    </p>
                </div>
                <div class="col-sm-4">
                    <p><strong>关于我:</strong></p>
                    <textarea rows="4" cols="50" name="txtAbout" id="txtAbout"><%=unescape(aboutMe)%></textarea>
                    
                    <input id="btnSave" name="btnSave" type="submit" value="保存" class="btn btn-success"/>
                    <input id="btnReset" name="btnReset" type="reset" value="取消" class="btn btn-danger"/>
                    <div class="pull-right">
                        <button id="btnDeleteProfile" name="btnDeleteProfile" type="button" class="btn btn-danger"
                            onclick="return deleteProfile()">删除信息</button>
                    </div>
                </div>
                <div class="col-sm-4">
                <%
                recUser.Close();
                mycon.Close();
                %>
                </div>
            </form>
            
        </div>
    </div>
</body>
</html>	