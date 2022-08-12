<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>BingGo影评</title>
		<link rel="shortcut icon"type="image/x-icon" href="./assets/冰棍.svg" />
		
		 <link rel="stylesheet"  type="text/css " href="./css/LoginPage.css"/>
		<script src="../../Test/LoginAndRegister.js"></script>
		<script src="../../Test/LoginChuli.js"></script>
		
		<style>
			body{
				/* background-image: url("./assets/1.jpg"); */
				background-image: url("./assets/xiaohuangren.jpg");
			}
		</style>
		<!--引入Bootstrap -->
		<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
			<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
			<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
	</head>
	
	
	<body>
		<!--  网站中间的名称 -->
		
		<div id="AlbumName">
			
			<h1> <img id="ShowIcon" src="./assets/冰棍.svg" width="88px" height="88px"/> BingGo影评</h1>
			<p style="color: bisque;">  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;BingGo影评  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您的电影交流社区！</p>
			
		</div>
		
		
		<!--  注册和登录按钮 -->
		<div id="ButtonChoice">
			 <a href="signup.asp" >
                   <img src="./assets/幸运草.png" id="LuckyFlower" width="188px" height="188px" id="imgA" onclick="document.getElementById('RegisterFrame').style.display = 'block';document.getElementById('LoginFrame').style.display = 'none'"/> 
                </a>
			
			 <a href="login.asp" >
                     <img src="./assets/向日葵.png" id="sunFlower" width="188px" height="188px" id="imgB" onclick="document.getElementById('RegisterFrame').style.display = 'none';document.getElementById('LoginFrame').style.display = 'block'"/> 
                </a>
			
			
		</div>
	
		
		
		</div>
		
	</body>
</html>
