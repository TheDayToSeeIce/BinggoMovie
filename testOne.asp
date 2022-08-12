<%

''服务器必须安装本组件.可在阿江的探针中检查和下载组件

str1="2935063603@qq.com"  ''接收信息的邮箱

str2="1278287330@qq.com"    ''发送信息的邮箱

str3="1278287330"       ''发送信息的邮箱

str4="we9911211500073"

str5="aaaaaaaa"    ''邮件主题

str6="bbbbbbbb"    ''邮件内容

str7="smtp.qq.com"  ''smtp服务器

Function sendmail(str1,str2,str3,str4,str5,str6,str7)

set minimail = Server.CreateObject("JMAIL.Message")

minimail.silent = False

minimail.logging = True

minimail.Charset = "UTF-8"

minimail.ContentType = "text/html"

minimail.AddRecipient str1

minimail.From = str2

minimail.MailServerUserName = str3

minimail.MailServerPassword = str4

minimail.Subject = str5

minimail.Body = "<div style=""font-family:Verdana,Microsoft YaHei,Arial,Helvetica,sans-serif; float:left; overflow:hidden; border:1px solid #ccc; border-radius:5px; margin-top:12px;""><div style=""border-top:4px solid #efe301; padding:26px 30px 30px;""><p style=""font-size:16px; color:#696969; margin:0; font-weight:bold; padding:0 0 22px;"">"&str6&"</p></div></div>"

minimail.Priority = 3

minimail.Send(str7)

minimail.Close()

set minimail = Nothing

End Function

call sendmail(str1,str2,str3,str4,str5,str6,str7)

%>
