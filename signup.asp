<%@ Language="javascript" %>

<%Session("MESSAGE") = ""; %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>binggo 注册</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="./assets/冰棍.svg" />
	<!--   -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <style type="text/css">
        
		
		
		
			body{
				background-image: url("./assets/pic1.jpg") ;
                background-size: cover;
                
               
			}
            input{
                opacity: 1;
            }
            /* 阴影效果 */
            input:focus {
                opacity: 0.8;
    outline: none;
    -moz-box-shadow:
        0 2px 3px 0 rgba(0,0,0,.1) inset,
        0 2px 7px 0 rgba(0,0,0,.2);
    -webkit-box-shadow:
        0 2px 3px 0 rgba(0,0,0,.1) inset,
        0 2px 7px 0 rgba(0,0,0,.2);
    box-shadow:
        0 2px 3px 0 rgba(0,0,0,.1) inset,
        0 2px 7px 0 rgba(0,0,0,.2);
}




      
		
    </style>
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <!-- <script src="js/jquery.backstretch.min.js"></script>
    <script src="js/bodyBackground.js"></script> -->
    <script type="text/javascript">



       //检查密码+检查手机号
        function checkPassword()
        {
            if (document.getElementById("txtPassword").value == document.getElementById("txtConfirmPassword").value)
            { 
               if(document.getElementById("txtPassword").value.length<8){
                window.alert("请确保密码不少于8位数！");
                  return false; 
               }else  {
                   if(document.getElementById("txtTel").value.length!=11){
                    window.alert("请输入11位的手机号码位数！");
                  return false; 

                   }else
                   return true;
               }
                
            }
            else
            {
                window.alert("前后输入密码不一致！！");
                return false;
            }
        }
        function getBirthdateYMD()
        {
            var dob = new Date(document.getElementById('txtBirthdate').value);

            var birthYear = dob.getFullYear().toString();
            var birthMonth = (dob.getMonth() + 1).toString();
            birthMonth = ("00" + birthMonth).slice(-2);
            var birthDay = dob.getDate().toString();
            birthDay = ("00" + birthDay).slice(-2);

            var dobYMD = birthYear + "/" + birthMonth + "/" + birthDay;
            document.getElementById("txtBirthdateYMD").value = dobYMD;
        }
    </script>
</head>
<body  >
    
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
    <h1 style="font-family: comic sans ms;color: aliceblue;"> <img id="ShowIcon" src="./assets/冰棍.svg" width="88px" height="88px"/> BingGo影评网</h1>
        <form action="validateSignup.asp" method="post" onsubmit="return checkPassword()">
            <div class="row">
               
                        <div class="col-sm-3 col-md-3" style="margin-left: 320px;">
                            <h1 style="font-family: comic sans ms;color: aliceblue;">注册账号</h1>
                            <small > <a href="login.asp" style="color: yellow;">已有账号？去登录</a></small>
                            
							
                        </div>
                        
                    </div>
                    <div class="panel-body row" style="margin-left: 300px;">
                        <div class="col-sm-3 col-md-3">
                            <!---------- 邮箱 ---------->
                            <div class="form-group">
                                <label for="txtEmail" style="font-family: comic sans ms;color: aliceblue;">电子邮箱: <small>(作为登录账号使用)</small></label>
                                <input type="email" class="form-control" id="txtEmail" name="txtEmail" maxlength="40" style="width: 300px;" required>
                            </div>
                            <!---------- 手机号 ---------->
                            <div class="form-group">
                                <label for="txtEmail" style="font-family: comic sans ms;color: aliceblue;">手机号码: <small></small></label>
                                <input type="tel" class="form-control" id="txtTel" name="txtTel" maxlength="40" style="width: 300px;" required>
                            </div>
                            <!---------- 密码 ---------->
                            <div class="form-group">
                                <div class="form-inline">
                                    <label for="txtPassword" style="font-family: comic sans ms;color: aliceblue;">密码:</label><br>
                                    <input type="password" class="form-control" id="txtPassword" name="txtPassword" maxlength="40" style="width: 300px;" required>
                                </div>
                            </div>
                            <!---------- 再次输入密码 ---------->
                            <div class="form-group">
                                <div class="form-inline">
                                    <label for="txtConfirmPassword" style="font-family: comic sans ms;color: aliceblue;">请再次输入密码:</label>
                                    <input type="password" class="form-control" id="txtConfirmPassword" name="txtConfirmPassword" style="width: 300px;" maxlength="20" required>
                                </div>
                            </div>
                            <!---------- 用户名 ---------->
                            <div class="form-group">
                                <label for="txtName" style="font-family: comic sans ms;color: aliceblue;">用户名:</label>
                                <input type="text" class="form-control" id="txtName" name="txtName" maxlength="25" style="width: 300px;" required>
                            </div>
                            
							
							
							
							
							<strong> <!---------- 城市 ---------->
                            <div class="form-group">
                                <label for="txtCity" style="font-family: comic sans ms;color: aliceblue;">城市:</label>
                                <input type="text" class="form-control" id="txtCity" name="txtCity" maxlength="25" style="width: 300px;" required>
                            </div></strong>
                           
                           
                           
                        </div>
                        <div class="col-sm-3 col-md-3">
                           
                            <!---------- 关于我 ---------->
                            <div class="form-group" style="margin-left: 50px;">
                                <label for="txtAbout" style="font-family: comic sans ms;color: aliceblue;">我的简介:</label>
                                <textarea rows="4" cols="50" id="txtAbout" name="txtAbout" class="form-control" placeholder="这个人很懒，什么也没有留下" style="width: 400px;"></textarea>
                            </div>
             <!---------- 生日 ---------->
 <div class="form-group" style="margin-left: 50px;">
    <div class="form-inline">
        <label for="txtBirthdate" style="font-family: comic sans ms;color: aliceblue;">生日:</label>
        <input type="date" id="txtBirthdate" name="txtBirthdate" class="form-control" required onchange="getBirthdateYMD()" onblur="getBirthdateYMD()">
        <input type="hidden" id="txtBirthdateYMD" name="txtBirthdateYMD">
    </div>
</div>


                            <!---------- 性别 ---------->
                            <div class="form-group" style="margin-left: 50px;">
                                <div class="form-inline">
                                    <label for="cboSex" style="font-family: comic sans ms;color: aliceblue;">性别:</label>
			                        <select id="cboSex" name="cboSex" class="form-control" style="width: 100px;"  required>
				                        <option value="女" style="font-family: comic sans ms;color: aliceblue;background-color: pink;">女</option>
				                        <option value="男" style="font-family: comic sans ms;color: aliceblue;background-color: black;">男</option>
			                        </select>
                                </div><br /><br />
                                
                            </div>

                           
                           
                        </div>
                        

                       
                            <div class="center" style="margin-top: 186px;">
                                <input type="submit" id="btnSignUp" name="btnSignUp" value="注册" class="btn btn-success"/>
                                <input type="reset" id="btnReset" name="btnReset" value="清空" class="btn btn-danger"/>
                            </div>
                        
                        
                
            </div>
			 <!------？？？------->
            <%=  Session("MESSAGE") %>
        </form>
    
</body>
</html>
