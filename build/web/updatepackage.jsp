<%-- 
    Document   : sendpackage
    Created on : Nov 9, 2013, 8:43:08 PM
    Author     : samuelbond
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*, model.Pkstatus, model.Transit"%>
<%@ include file="Uheader.jsp" %>

<div class="container">
<%
            @SuppressWarnings("unchecked") 
            Transit trn = (Transit) request.getAttribute("data");
            List<Pkstatus> pklist = (List<Pkstatus>) request.getAttribute("allstats");
             %>
    <div class="row">

        <div class="two-thirds column">
            <br />
            
             
            <div style="width:800px; margin-left:50px;">
                <form  class="form-inline" method="post" action="packagemanager">
                    <legend>Update Package Transit History</legend>
                    <label>Package Transit History</label><br />
                    <textarea name="trahist"  style="width:400px;" required="required"><%= trn.getTransitHistory() %></textarea>
                    <br />
                    <label>Progress of package(number)</label><br />
                    <input type="text" name="progress" value="<%= trn.getProgress() %>" style="width:400px; height:35px;" required="required" />
                    <br />
                    <label>Package Status</label><br />
                    <select name="status">
                        <%
                            for(int k = 0; k < pklist.size(); k++){
                              %>
                              <option value="<%= pklist.get(k).getId() %>"><%= pklist.get(k).getStatus() %></option> 
                              <% } %>
                    </select>
                    <br />
                    <input type="hidden" name="tcode" value="<%= trn.getTrackingCode() %>" />
                    <input type="hidden" name="pkd" value="<%= trn.getPackageId() %>" />
                     <br/>
                    <button type="submit" class="btn">Update</button>
                </form>
            </div>
        </div>

    </div>





    <hr />
    <footer>
        <p>&copy; 2013 SA POSTAL SERVICES. All rights reserved. </p>
    </footer>
</div>
                
                
<%@ include file="Ufooter.jsp" %>