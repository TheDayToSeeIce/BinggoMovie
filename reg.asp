<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%

 '�ӿ����ͣ��������ߴ������Žӿڣ�֧�ַ�����֤����š�����֪ͨ���ŵȡ�
 '�˻�ע�᣺��ͨ���õ�ַ��ͨ�˻�http://sms.ihuyi.com/register.html
 'ע�����
 '��1�������ڼ䣬��ʹ����ϵͳĬ�ϵĶ������ݣ�������֤���ǣ������������벻Ҫ����֤��й¶�������ˡ���
 '��2����ʹ��APIID���鿴APIID���¼�û�����->��֤�����->��Ʒ����->APIID����APIkey�����ýӿڣ�
 '��3���ô���������뻥�����߶��Žӿڲο�ʹ�ã��ͻ��ɸ���ʵ����Ҫ���б�д��

'���������
Function gen_key(digits)
	dim char_array(50)
	char_array(0) = "0"
	char_array(1) = "1"
	char_array(2) = "2"
	char_array(3) = "3"
	char_array(4) = "4"
	char_array(5) = "5"
	char_array(6) = "6"
	char_array(7) = "7"
	char_array(8) = "8"
	char_array(9) = "9"
	randomize
	do while len(output) < digits
	num = char_array(Int((9 - 0 + 1) * Rnd + 0))
	output = output + num
	loop
	gen_key = output
End Function

send_code = gen_key(4)
Session("send_code") = send_code

mobile = request.Form("mobile")
if mobile<>"" then
	if Session("mobile_code")="" or Session("mobile_code")<>request.Form("mobile_code") or Session("mobile")="" or Session("mobile")<>request.Form("mobile") then
		response.Write("�ֻ���֤���������")
	else
		response.Redirect("resetPassword.asp?tel="&mobile)
	end if

end if
%>
<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=gb2312" />
<title>demo</title>
</head>
<script type="text/javascript" src="jquery.js"></script>
<script language="javascript">
	function get_mobile_code(){
        $.post('sms.asp', {mobile:jQuery.trim($('#mobile').val()),send_code:$("#gd_code").val()}, function(msg) {
            alert(jQuery.trim(unescape(msg)));
			if(msg=='�ύ�ɹ�'){
				RemainTime();
			}else{
				location.reload();
			}
        });
	};
	var iTime = 59;
	var Account;
	function RemainTime(){
		document.getElementById('zphone').disabled = true;
		var iSecond,sSecond="",sTime="";
		if (iTime >= 0){
			iSecond = parseInt(iTime%60);
			iMinute = parseInt(iTime/60)
			if (iSecond >= 0){
				if(iMinute>0){
					sSecond = iMinute + "��" + iSecond + "��";
				}else{
					sSecond = iSecond + "��";
				}
			}
			sTime=sSecond;
			if(iTime==0){
				clearTimeout(Account);
				sTime='��ȡ�ֻ���֤��';
				iTime = 59;
				document.getElementById('zphone').disabled = false;
			}else{
				Account = setTimeout("RemainTime()",1000);
				iTime=iTime-1;
			}
		}else{
			sTime='û�е���ʱ';
		}
		document.getElementById('zphone').value = sTime;
	}	
</script>
<body>
	<style>
		body{
			background-color: aquamarine;
			background-image: url(./assets/1.jpg);
		}
		#valiTelform{
			position: relative;
			top: 200px;
			left: 200px;
			
		}
		input{
			width: 240px;
			height: 26px;
			position: relative;
		}
		
	</style>
<form action="reg.asp" method="post" name="formUser" onSubmit="return register();" id="valiTelform">
	<h1 style="left: 340px;position: relative;">��֤�ֻ�����</h1>
	<table width="100%"  border="0" align="left" cellpadding="5" cellspacing="3">
		<tr>
		<td align="right">�ֻ�<td>
			<input id="mobile" name="mobile" type="text" size="25" class="inputBg" /><span style="color:#FF0000"> *</span> 
        </tr>
		<tr>
			<td align="right">��֤��</td>
			<td>
			<input type="text" name="gd_code" class="inputBg" size="25" id="gd_code">
			<span>&nbsp;<img src="code.asp" onClick="javascript:this.src=this.src+'?date='+Date();" style="width: 100px;"></span>
			</td>
		</tr>
			<tr>
			<td align="right">�ֻ���֤��</td>
			<td align="left">
			<input type="text"  name="mobile_code" class="inputBg" size="25" />
			<input id="zphone" type="button" value=" ��ȡ�ֻ���֤�� " style="width: 120px"  onClick="get_mobile_code()">
			</td>
		</tr>
		<tr>
			<td align="right"></td>
			<td><input type="submit" value=" �������� " class="button"></td>
		</tr>
	</table>
</form>
</body>
</html>