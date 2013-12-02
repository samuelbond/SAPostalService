<%-- 
    Document   : package
    Created on : Nov 12, 2013, 8:57:04 AM
    Author     : samuelbond
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*,model.Packages, model.Pkstatus, model.Transit"%>

<%@ include file="Uheader.jsp" %>

<div class="container">

    <div class="row">

        <div class="two-thirds column">
            <br />
            
             <%
            @SuppressWarnings("unchecked") 
            List<Packages> pkList = (List<Packages>) request.getAttribute("package");
            List<Pkstatus> pkStat = (List<Pkstatus>) request.getAttribute("pkstatus");
            List<Transit> pkTran = (List<Transit>) request.getAttribute("transit");
            List<Pkstatus> psList = (List<Pkstatus>) request.getAttribute("allstats");
            
            String action = (String) request.getAttribute("action");
            String msg = (String) request.getAttribute("msg");
            boolean actionValue = false;
            boolean msgValue = false;
            if(action != null){
                actionValue = true;
            }
            
            if(msg != null){
                msgValue = true;
            } 
             %>
              <c:if test="<%= actionValue %>">
                 <div class="alert alert-success">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <h4>Transit History updated</h4>
    <%= action %>
    </div>    
             </c:if>
              <c:if test="<%= msgValue %>">
                 <div class="alert alert-error">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <h4>An error has occured</h4>
    <%= msg %>
    </div>    
             </c:if>
            <div style=" margin-left:50px;">
                <table class="table-striped" style="border:1px solid #ccc;">
                    <tr style="border:1px solid #ccc;">
                        <th style="border:1px solid #ccc;"> Package Sent</th>
                        <th style="border:1px solid #ccc;">Package Receiver</th>
                        <th style="border:1px solid #ccc;">Receiver's Address</th>
                        <th style="border:1px solid #ccc;">Receiver's City</th>
                        <th style="border:1px solid #ccc;">Sent On</th>
                        <th style="border:1px solid #ccc;">Status</th>
                        <th style="border:1px solid #ccc;">Tracking Code</th>
                        <th style="border:1px solid #ccc;">Action</th>
                    </tr>
                    <% if(pkList != null && pkStat != null){ for(int k = 0; k < pkList.size(); k++){ %>
                    <tr>
                        <td style="border:1px solid #ccc; padding:5px;"><%= pkList.get(k).getPackageName() %></td>
                        <td style="border:1px solid #ccc; padding:5px;"><%= pkList.get(k).getPackageReciever()  %></td>
                        <td style="border:1px solid #ccc; padding:5px;"><%= pkList.get(k).getPkrecieverAddress()  %></td>
                        <td style="border:1px solid #ccc; padding:5px;"><%= pkList.get(k).getPkrecieverCity()  %></td>
                        <td style="border:1px solid #ccc; padding:5px;"><%= pkList.get(k).getPkdateSent() %></td>
                        <td style="border:1px solid #ccc; padding:5px;"><%= pkStat.get(k).getStatus() %></td>
                        <td style="border:1px solid #ccc; padding:5px;"><%= pkTran.get(k).getTrackingCode()  %></td>
                        <td style="border:1px solid #ccc; padding:5px;"><a href="packagemanager?update=<%= pkList.get(k).getPackageId() %>" class="btn" >Update Transit</a></td>
                     </tr>
                    <%
                    }
                    }
                    %>
                </table>
            </div>
        </div>

    </div>





    <hr />
    <footer>
        <p>&copy; 2013 SA POSTAL SERVICES. All rights reserved. </p>
    </footer>
</div>
                
                
<%@ include file="Ufooter.jsp" %>