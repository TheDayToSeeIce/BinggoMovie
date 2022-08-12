<%@ Language="javascript" CODEPAGE="65001"%>
<%Response.Charset="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>binggo 登录</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="./modules/bootstrap/jquery.min.js"></script>
    <style type="text/css">
        .panel-heading.row {
            margin: 0;
            padding-left: 0;
            padding-right: 0;
        }

        body{
				/* background-image: url("./assets/1.jpg"); */
				background-image: url("./assets/cmdsj.jpg") ;
                background-repeat: no-repeat;
                background-size: cover;
               
			}
    </style>
 <style>
     /* 模态框css */
    #mask, #dialog{
        position: fixed;
        left: 0;
        right: 0;
        top: 0;
        bottom: 0;
        visibility: hidden;
    }

    #mask{
        background: rgba(0,0,0,.7);
        opacity: 0;
        transition: all .7s ;
    }

    #dialog{
        justify-content: center;
        align-items: center;
        display: flex;
    }

    #dialog .box{
        width: 800px;
        height: 400px;
        background: #f9f9f9;
        border: 1px solid #f7f7f7;
        border-radius: 5px;
        transition: all .7s ;
        position: relative;
        top: -900px;
    }

    #mask.show{
        opacity: 1;
        visibility: visible;
        
    }

    #dialog.show{
        display: flex;
        visibility: visible;
    }

    #dialog.show .box{
        top: 0px;
    }

    #dialog .close{
        position: absolute;
        right: 20px;
        top: 20px;
        display: block;
        width: 30px;
        height: 30px;
        line-height: 30px;
        text-align: center;
        cursor: pointer;
        border-radius: 50%;
        color: #ff7878;
        border: 1px solid;
    }

     #dialog .close:hover{
         color:red;
     }

    #dialog .box h1{
        text-align: center;
        line-height: 400px;      
        margin: 0;
        color: rgb(185, 185, 185);
        font-size: 80px; 
    }

    #alertDiv{
    display: inline;
    
    height: 200px;
    width: 300px;
    
    text-align: center;
    position: fixed;
    top: 50%;
    margin-top: -1rem;
    line-height: 2rem;
    

   
    
    border: 1px solid #0000002b;
    border-radius: 3px;
    color: #1f0000;
    overflow: hidden;
 
    position: fixed;	
	
	
	box-sizing: border-box;
	align-items: center;
	justify-content: center;
	
	top: 200px;
	left: 520px;

}

#alertspan1{
   
    width: 350px;
    background-color: white;
    height: 120px;
    display: inline-block;
    text-align: center;
    font-weight: bolder;
    padding-bottom: 130px;
    padding: 35px 30px;
    letter-spacing: 1px;
    font-size: 14px;
    color: #1f0000;
}

#alertspan2{
    color: #fff;
    width: 350px;
    background:#f2f2f2;
    height: 80px;
    display: inline-block;
    padding: 0 3rem;
    
}

#alertConfirmBtn{
								cursor: pointer;
								padding: 8px 10px;
                                
								border: none;
								border-radius: 2px;
								color:#fff;
								background-color: #f61717;
								box-shadow: 0 0 2px #f61717;
                               margin-top: 25px;
                                margin-right: 20px;
							}
</style>

    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <!-- <script src="js/jquery.backstretch.min.js"></script> -->

    
    
    <script type="text/javascript">

//提示框
function warnMsg(e){
    $("body").append("<div id='alertDiv' ><span id='alertspan1'>"+e+"</span><br /><span id='alertspan2'><button id='alertConfirmBtn' onclick='clearmsg()'>确定</button><span /></div>");
   
}
//关闭提示框
function clearmsg(){
    // var t = setTimeout(function(){
    //     $("alertDiv").remove();
    // },2000)
    document.getElementById("alertDiv").remove();
};


  // 模态框JavaScript
  const loginBtn = document.querySelector('#login');
        const mask = document.querySelector('#mask');
        const closeBtn = document.querySelector('#dialog .close');
        const dialog = document.querySelector('#dialog');
    
        function close(){
            dialog.classList.remove('show');
            mask.classList.remove('show')
        }
    
        function open2(){
            dialog.classList.add('show');
            mask.classList.add('show');
           
            
        }
    
        
    
        closeBtn.onclick = close;
    
        dialog.onclick = (e) => {
            if(e.target.id == 'dialog') close();
        }
      
        function clearMessage()
        {
            document.getElementById("divMessage").innerHTML = "";
        }

        var code ; //在全局定义验证码   
          
          function createCode(){ 
               code = "";    
               var codeLength = 4;//验证码的长度   
               var checkCode = document.getElementById("code");    
               var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R',   
               'S','T','U','V','W','X','Y','Z');//随机数   
               for(var i = 0; i < codeLength; i++) {//循环操作   
                  var index = Math.floor(Math.random()*36);//取得随机数的索引（0~35）   
                  code += random[index];//根据索引取得随机数加到code上   
              }   
              checkCode.value = code;//把code值赋给验证码   
          } 
          //校验验证码   
          function validateCode(){
              
             
              
              var inputCode = document.getElementById("Captcha").value.toUpperCase(); //取得输入的验证码并转化为大写         
              if(inputCode.length <= 0) { //若输入的验证码长度为0   
                warnMsg("请输入验证码！"); //则弹出请输入验证码 
                  
                  return false;
              }else if(inputCode != code ) { //若输入的验证码与产生的验证码不一致时   
                warnMsg("验证码输入错误！"); //则弹出验证码输入错误   
                  createCode();//刷新验证码   
                  document.getElementById("Captcha").value = "";//清空文本框 
                  return false;
              }else { //输入正确时   
                  console.log("登录成功,正在跳转...");
                  
              } 
              return true;
          } 


    </script>
</head>
<body>



    <h1 style="font-family: comic sans ms;color: aliceblue;"> <img id="ShowIcon" src="./assets/冰棍.svg" width="88px" height="88px"/> BingGo影评网</h1>
    <!-- 模态框 -->
    <!-- <div id="mask">777</div>
    <div id="dialog">
        <div class="box">
            <span class="close">x</span>
            <h1>Hello Mask!</h1>
        </div>
    </div> -->
   
    <div class="container">
      
        <div class="row" >
            <div class="col-sm-8">
               
            </div>
            <div class="col-sm-4 login-block"  style="top: 37px;width: 366px;height: 499px;">
                <form action="validateLogin.asp" method="post" onreset="clearMessage();" onsubmit="return validateCode()" >
                        <div   >
                            <div  >
                            <h2 style="font-family: comic sans ms;color: aliceblue;">用户登录</h2>
                            <p> <%= Session("MESSAGE")  %></p>
                           
                        </div>
                        <div >
                            <div class="form-group">
                                <label for="txtEmail"style="font-family: comic sans ms;color: aliceblue;">电子邮箱:</label>
                                <input type="email" class="form-control" id="txtEmail" name="txtEmail" maxlength="30" required>
                            </div>
                            <div class="form-group">
                                <label for="txtPassword" style="font-family: comic sans ms;color: aliceblue;">密码:</label>
                                <input type="password" class="form-control" id="txtPassword" name="txtPassword" required>
                            </div>
                            <label for="Captcha" style="font-family: comic sans ms;color: aliceblue;">请输入验证码:</label>
                            <input type="Captcha" class="Captcha form-control" name="Captcha" id="Captcha" placeholder="请输入验证码！">
                            <label for="code" style="font-family: comic sans ms;color: aliceblue;">点击获取验证码:</label>
                            <input type="button" id="code" onclick="createCode()" style="height:40px;width:120px" title='点击更换验证码' class="form-control" /><br />
                            <a href="signup.asp">还没有账号？去注册</a><br /> 
                            

                            <input id="btnSubmit" type="submit" value="登录" class="btn btn-success"/>&nbsp;&nbsp;&nbsp;
                             <input id="btnReset" type="reset" value="清空" class="btn btn-danger"/>&nbsp;&nbsp;&nbsp;<a href="reg.asp">忘记密码？</a>
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



    <!-- Javascript -->
    <script src="assets/js/jquery-1.8.2.min.js" ></script>
    <script src="assets/js/supersized.3.2.7.min.js" ></script>
    <script src="assets/js/supersized-init.js" ></script>
    <script src="assets/js/scripts.js" ></script>
</body>
</html>