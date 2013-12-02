<%-- 
    Document   : account
    Created on : Nov 6, 2013, 4:54:50 PM
    Author     : samuelbond
--%>

<%@page import="model.Admins"%>

<%@ include file="Uheader.jsp" %>
  
  <div class="container">
    
    <div class="row">
    
        <div class="one-third column">
                
                                                                </div>
                                <div class="two-thirds column">
                                <br />
                <ul class="nav nav-tabs">
                    <li class="active">
                    <a href="#tab-001" data-toggle="tab">DASHBOARD</a></li>
                    <li><a href="#tab-002" data-toggle="tab">Destinations</a></li>
	                                       
	                                           </ul>
              
                
        
        
                
        <div class="tab-content">
	    <%
            @SuppressWarnings("unchecked") 
            Admins admin = (Admins) request.getAttribute("admin");
             
             %>
                    
           <div class="tab-pane active" id="tab-001">
                                <!-- Welcome Message -->
        <div style="position:absolute; top:138px; left:920px; width:350px;">
          <div class="new-update">
            <h2><i class="icon-book"></i> Welcome <%= admin.getFullname() %> </h2>
                <div class="side-news">
                <h5><a href="#">You are using MySA Administrator Panel</a></h5>
                <p>To perform package updates and create more destinations click on the appropriate tab.</p>
                
                </div>

                </div>
                </div> 
                
                
                 <!-- DashBoard Menu -->
    <div class="dashboard-widget">
      <div class="row-fluid">
        <div class="span2">
          <div class="dashboard-wid-wrap">
            <div class="dashboard-wid-content"> <a href="packagemanager?show=true">  <span class="glyphicon glyphicon-edit"></span>  <span class="dasboard-icon-title">Update Package</span> </a> </div>
          </div>
        </div>
        <div class="span2">
          <div class="dashboard-wid-wrap">
            <div class="dashboard-wid-content"> <a href="#tab-002" data-toggle="tab">  <span class="glyphicon glyphicon-tasks"></span>  <span class="dasboard-icon-title">New Destinations</span> </a> </div>
          </div>
        </div>
        
        
        </div>
        
      </div>
      </div>
       <div class="tab-pane" id="tab-002">
       
      <div style="width:800px; margin-left:50px;">
          <form class="form-inline" method="post" action="newdestinations">
    <legend>Add New Destination</legend>
    <label>Destination Name</label><br />
    <input type="text" name="name" class="input-lg" placeholder="New Jerico" style="width:400px; height:35px;" required="required" />
    <br />
    <label>Duration</label><br />
    <input type="text" name="duration" placeholder="6 Days" style="width:400px; height:35px;" required="required" />
    <br />
    <button type="submit" class="btn">Add</button>
    </form>
      </div>
      </div> 
      </div>
      <!-- /DashBoard Menu -->

        </div>
               
          </div>
          
          
         
                
       <hr />
            <footer>
                <p>&copy; 2013 SA POSTAL SERVICES. All rights reserved. </p>
            </footer>
            </div>
                
                
<%@ include file="Ufooter.jsp" %>
