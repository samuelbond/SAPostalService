<%-- 
    Document   : login
    Created on : Oct 9, 2013, 11:37:26 PM
    Author     : samuelbond
--%>
 <%@ include file="header.jsp" %>
 <style>
     .form-signin {
  max-width: 330px;
  padding: 15px;
  margin: 0 auto;
}
.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 10px;
}
.form-signin .checkbox {
  font-weight: normal;
}
.form-signin .form-control {
  position: relative;
  font-size: 16px;
  height: auto;
  padding: 10px;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="text"] {
  margin-bottom: -1px;
  border-bottom-left-radius: 0;
  border-bottom-right-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
 </style>
    <div class="container">
     <form class="form-signin" method="post" action="login">
                        <%
String req_name = (String) request.getAttribute("error");
//if name filed is not set then value of the string "req_name" is null
String head = (String) request.getAttribute("errorhead");
if(req_name != null)
{ 
  out.println("<div class=\"alert alert-danger\"><button type=\"button\" class=\"close\" "
          + "data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button><strong>"+head+"</strong><br />"
          + req_name+"</div>");
}

%> 
<%
String msg_name = (String) request.getAttribute("msg");
//if name filed is not set then value of the string "req_name" is null
String msgHead = (String) request.getAttribute("msghead");
if(msg_name != null)
{ 
  out.println("<div class=\"alert alert-success col-lg-7\"><button type=\"button\" class=\"close\" "
          + "data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button><strong>"+msgHead+"</strong><br />"
          + msg_name+"</div>");
}

%> 
        <h2 class="form-signin-heading">Login to MySA</h2>
        <input type="text" name="email" class="form-control" placeholder="Email address" autofocus>
        <br />
        <input type="password" name="password" class="form-control" placeholder="Password">
        <label class="checkbox">
          <input type="checkbox" value="remember-me"> Remember me
        </label>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        <br />
        <a href="register" >Don't have an account? Sign up</a>
      </form>
      
        

    
    <script>
                
                 function validateLoginForm(){
                var pwd = document.getElementById("inputPass").value;
                var userName = document.getElementById("inputemailfield").value;
                
                if(userName.length < 5){
                document.getElementById("emailStat").innerHTML= "<img src=\"images/fail.png\" style=\"margin-left:2px;\" />"; 
                return false;   
                }
                document.getElementById("emailStat").innerHTML= ""; 
                if(pwd.length < 1){
                document.getElementById("passStat").innerHTML= "<img src=\"images/fail.png\" style=\"margin-left:2px;\" />"; 
                return false;   
                }
                document.getElementById("passStat").innerHTML= "";
                
                 
                return true;
                }
                </script>
    
 <%@ include file="footer.jsp" %>
