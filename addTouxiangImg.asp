
<%@ Language="VBscript" CODEPAGE="65001"%>
<%Response.Charset="utf-8"%>
<%Session.CodePage=65001%>




<html>
<head>
<title>上传一个文件示例</title>
</head>
<body>
<H2 align="center">文件已安全上传</H2>
<center>
<%
Dim Upload '声明一个变量
Set Upload = Server.CreateObject("Persits.Upload.1") '创建一个文件上传组件实例
Upload.SetMaxSize 10*1024*1024,False '限制文件不超过10M，否则截断
Upload.OverwriteFiles=True 'True表示可以覆盖
Upload.Save "C:\inetpub\wwwroot\BingGo\assets\Users" '上传到指定文件夹
Response.Write "文件大小为：" & Upload.Files("upfile").Size & "字节<BR>"
Response.Write "文件名字为：" & Upload.Form("intro").value & "<BR>"


%>
</center>
<br /><hr />


<h2 id="show1"></h2>


<script>

    var show1 = document.getElementById("show1");


    var time = 3;

    timer();

    setInterval(timer, 1000);



    function timer() {

        if (time == 0) {

            location.href = 'myprofile.asp';

        } else {

            show1.innerHTML = '将在' + time + '秒后跳转到修改信息页面！';

            time--;

        }

    }

</script>
</body>
</html>