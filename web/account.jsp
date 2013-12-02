<%-- 
    Document   : account
    Created on : Nov 6, 2013, 4:54:50 PM
    Author     : samuelbond
--%>

<%@page import="model.Users"%>

<%@ include file="Uheader.jsp" %>
  <%
            @SuppressWarnings("unchecked") 
            Users user = (Users)request.getAttribute("user");
            String msg = (String) request.getAttribute("msg");
            String error = (String) request.getAttribute("error");
            boolean msgValue = false;
            boolean errorValue = false;
            
            if(msg == null){
                msgValue = false;
            }
            
            if(error == null){
                errorValue = false;
            }
             %>
  <div class="container">
    
    <div class="row">
       

    <%= ((error == null) ? "" : error) %>     
    <%= ((msg == null) ? "" : msg) %>
    
                
                                                                </div>
                                <div class="two-thirds column">
                                <br />
                <ul class="nav nav-tabs">
                    <li class="active">
                    <a href="#tab-001" data-toggle="tab">DASHBOARD</a></li>
                    <li><a href="#tab-002" data-toggle="tab">PROFILE</a></li>
	                                       
	                                           </ul>
              
                
        
        
                
        <div class="tab-content">
	    
           <div class="tab-pane active" id="tab-001">
                                <!-- Welcome Message -->
        <div style="position:absolute; top:138px; left:920px; width:350px;">
          <div class="new-update">
            <h2><i class="icon-book"></i> Welcome <%= user.getName() %> </h2>
                <div class="side-news">
                <h5><a href="#">You are using MySA</a></h5>
                <p>To track, send and check status of any of your packages you can now do them online using your
                MySA account.</p>
                
                </div>

                </div>
                </div> 
                
                
                 <!-- DashBoard Menu -->
    <div class="dashboard-widget">
      <div class="row-fluid">
        <div class="span2">
          <div class="dashboard-wid-wrap">
            <div class="dashboard-wid-content"> <a href="viewpackage">  <span class="glyphicon glyphicon-list"></span>  <span class="dasboard-icon-title">View Sent Packages</span> </a> </div>
          </div>
        </div>
        <div class="span2">
          <div class="dashboard-wid-wrap">
            <div class="dashboard-wid-content"> <a href="trackpackage">  <span class="glyphicon glyphicon-tasks"></span>  <span class="dasboard-icon-title">Track Package</span> </a> </div>
          </div>
        </div>
        
        <div class="span2">
          <div class="dashboard-wid-wrap">
            <div class="dashboard-wid-content"> <a href="account?send=ship"> <span class="glyphicon glyphicon-folder-open"></span> <span class="dasboard-icon-title">New Shipping</span> </a> </div>
          </div>
        </div>
        <div class="span2">
          <div class="dashboard-wid-wrap">
            <div class="dashboard-wid-content"> <a href="account?send=mail">  <span class="glyphicon glyphicon-envelope"></span> <span class="dasboard-icon-title">New Priority Mail</span> </a> </div>
          </div>
        </div>
        </div>
        
      </div>
      </div>
       <div class="tab-pane" id="tab-002">
       
      <div style="width:800px; margin-left:50px;">
          <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
          Add New Address
          </button>
          <form class="form-inline" method="post" action="useraccount">
    <legend>Profile</legend>
    <label>Full Name</label><br />
    <input type="text" name="fname" class="input-lg" value="<%= user.getName() %>" style="width:400px; height:35px;" required="required" />
    <br />
    <label>Phone</label><br />
    <input type="text" name="phone" value="<%= user.getPhone() %>" style="width:400px; height:35px;" required="required" />
    <br />
    <label>Country</label><br />
    <input type="text" name="country" value="<%= user.getCountry() %>" style="width:400px; height:35px;" required="required" />
    <br />
    <input type="hidden" name="userid" value="<%= user.getEmail() %>" />
    <button type="submit" class="btn">Update</button>
    </form>
      </div>
      </div> 
      </div>
      <!-- /DashBoard Menu -->

        </div>
               
          </div>
          
                  <!-- Modal -->
                  <div class="modal fade" id="myModal" tabindex="-1" style="height:400px; width:650px;" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Add New Address</h4>
      </div>
      <div class="modal-body">
          <form method="post" action="account">
              <p>
         <label>Address</label>
        <input type="text" name="address"  style="width:400px; height:35px;" required="required" />
              </p>
              <p>
         <label>City</label>
        <input type="text" name="city"  style="width:400px; height:35px;" required="required" />
              </p>
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
        </form>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
         
                
       <hr />
            <footer>
                <p>&copy; 2013 SA POSTAL SERVICES. All rights reserved. </p>
            </footer>
            </div>
                
                
<%@ include file="Ufooter.jsp" %>
