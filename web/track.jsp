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
        <form class="form-signin" method="post" action="trackpackage" onsubmit="validateForm();">

        <h2 class="form-signin-heading">Track Package</h2>
        <input type="text" name="trackingcode" id="trackingcode" class="form-control" placeholder="JG65FR2S2X" required="required" autofocus>
       <br />
        <button class="btn btn-lg btn-primary btn-block" type="submit">Track</button>
        
      </form>
    
    <script>
                
                 function validateLoginForm(){
                var trk = document.getElementById("trackingcode").value;
                
                if(trk.length < 8){
                alert("Invalid Tracking Code"); 
                return false;   
                }
                
                return true;
                }
                </script>
    
 <%@ include file="footer.jsp" %>
