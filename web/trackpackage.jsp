<%-- 
    Document   : login
    Created on : Oct 9, 2013, 11:37:26 PM
    Author     : samuelbond
--%>
 <%@ include file="header.jsp" %>

    <div class="container">
        <h1>Track Package</h1>
        <i class="glyphicon glyphicon-plane"></i>
       
        <div class="progress progress-striped active">
            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" 
                 aria-valuemax="100" style="width:<%= ((Integer) request.getAttribute("progress"))%>%;">
      <span></span>
  </div>
            <i class="glyphicon glyphicon-home" style="margin-left:665px;"></i> 
</div>
        
        
      <p class="text-center"><code>Transit History</code></p>
          <p class="text-center"><code><%= ((String) request.getAttribute("status"))%></code></p>
    
          <p class="text-center"><code ><%= ((String) request.getAttribute("history")) %></code></p>
    
 <%@ include file="footer.jsp" %>
