<%@ Language="VBscript" CODEPAGE="65001"%>
<%Response.Charset="utf-8"%>
<%Session.CodePage=65001%>
<!DOCTYPE html>
<html>
 <head>
 <title> 上传用户头像</title>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 </head>
 <body>
 <H2 align="center">上传用户头像</H2>
 <center>
 <form action="addTouxiangImg.asp" method="post" enctype="multipart/form-data" >
 选择文件:<input type="file" name="upfile"><br><hr>

 提示:请保证上传头像图片的名字和用户名一致，以防无法加载到头像。并且图片应小于10M大小！
 <input type="submit" value=" 确定 ">
 </form>
 </center>
 </body>
</html>