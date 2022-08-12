<%@ Language="javascript" CODEPAGE="65001"%>
<%Response.Charset="utf-8"%>
<%
var tele=Request.QueryString("tel");


%>

<!DOCTYPE html>
<html>
    <head>
        <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
            <title>修改密码</title>
        <link rel="shortcut icon" type="image/x-icon" href="./assets/冰棍.svg" />
                <link rel="stylesheet" type="text/css" href="../../Bootstrap框架/bootstrap.min.css" />
                
              
                <link rel="stylesheet" type="text/css" href="./modules/bootstrap/bootstrap.min.css" />
                <script src="./modules/bootstrap/jquery.min.js"></script>
                <script src="./modules/bootstrap/bootstrap.min.js"></script>
               
        

    </head>
<body>
    <style>
        body{
            background-image: url(./assets/1.jpg);
        }
    </style>
<!-- 
   <form action="resetUserCode.asp" method="post" style="position: relative;top: 220px;left:510px;">
       <label>邮箱：</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <input type="text" name="email"><br>
       <label>新密码</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <input type="password" name="password" ><br>
       <label>确认新密码</label>
       <input type="password" name="valipassword"><br>
       <input type="text" name="tel" value="<%=tele%>" style="display: none;"><br>
      
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="确认" style="width: 64px;height: 22px;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <input type="reset" value="清空" style="width: 64px;height: 22px;">

   </form> -->

   <div class="container">
      
    <div class="row" >
        <div class="col-sm-8">
           
        </div>
        <div class="col-sm-4 login-block"  style="top: 37px;width: 366px;height: 499px;">
            <form action="resetUserCode.asp" method="post" onsubmit="return validatePwd()">
                    <div   >
                        <div  >
                        <h2 style="font-family: comic sans ms;color: aliceblue;">重新设置密码</h2>
                       
                    </div>
                    <div >
                        <div class="form-group">
                            <label for="email"style="font-family: comic sans ms;color: aliceblue;">电子邮箱:</label>
                            <input type="email" class="form-control" id="email" name="email" maxlength="30" required>
                        </div>
                        <div class="form-group">
                            <label for="password" style="font-family: comic sans ms;color: aliceblue;">新密码:</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <input type="text" name="tel" value="<%=tele%>" style="display: none;"><br>
                        <div class="form-group">
                            <label for="valipassword" style="font-family: comic sans ms;color: aliceblue;">确认新密码:</label>
                            <input type="password" class="form-control" id="valipassword" name="valipassword" required>
                        </div>
                        

                        <input id="btnSubmit" type="submit" value="登录" class="btn btn-success"/>&nbsp;&nbsp;&nbsp;
                         <input id="btnReset" type="reset" value="清空" class="btn btn-danger"/>&nbsp;&nbsp;&nbsp;
                    </div>
                    <div class="alert alert-warning" id="divMessage" style="display: none;">
                        <%= "<strong>" + Session("MESSAGE") + "</strong>" %>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<style>


.login-block {
display: flex;
flex-direction: column;
align-items: center;
margin-top: 5rem;
width: 20em;
height: 25em;
background: #3dceba;
border-radius: 10px;
box-shadow: 0 0 16px #333;
}
</style>

<script>
    function validatePwd(){
        var pwd=document.getElementById("password").value.toString();
        var valipwd=document.getElementById("valipassword").value.toString();
        console.log(pwd);
        console.log(valipwd);
        if(pwd!=valipwd){
           alert('前后密码不一致');
            return false;
        }
        
        return true;
    }
</script>
    
</body>



</html>