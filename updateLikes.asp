
<%@ Language="javascript" CODEPAGE="65001"%>
<%Response.Charset="utf-8"%>



<%

var cid=Number(Request.querystring("cid"));
var sql="UPDATE Comments SET likes =likes+1 WHERE cid = "+cid;
var sql2="select likes from Comments where cid = "+cid;
var mycon = new ActiveXObject("ADODB.Connection");
mycon.Open("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("./database/Binggo.accdb"));

mycon.Execute(sql);
var recMatches = new ActiveXObject("ADODB.Recordset");
recMatches.Open(sql2, mycon);



if(!recMatches.EOF){
    Response.write(recMatches("likes"))
}
recMatches.close();
mycon.close();
%>

		
		
		

	

	

    
    


