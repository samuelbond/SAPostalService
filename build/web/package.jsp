<%-- 
    Document   : package
    Created on : Nov 12, 2013, 8:57:04 AM
    Author     : samuelbond
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*,model.Packages, model.Pkstatus, model.Transit"%>
<%@page import="model.Users"%>

<%@ include file="Uheader.jsp" %>

<div class="container">

    <div class="row">

        <div class="two-thirds column">
            <br />
            
             <%
            @SuppressWarnings("unchecked") 
            Users user = (Users)request.getAttribute("sender");
            List<Packages> pkList = (List<Packages>) request.getAttribute("package");
            List<Transit> pkTran = (List<Transit>) request.getAttribute("transit");
            List<Pkstatus> pkStat = (List<Pkstatus>) request.getAttribute("pkstatus");
            
            
             %>
             
            <div style=" margin-left:50px;">
                <table class="table-striped" style="border:1px solid #ccc;">
                    <tr style="border:1px solid #ccc;">
                        <th style="border:1px solid #ccc;">Sender</th>
                        <th style="border:1px solid #ccc;"> Package Sent</th>
                        <th style="border:1px solid #ccc;">Package Receiver</th>
                        <th style="border:1px solid #ccc;">Receiver's Address</th>
                        <th style="border:1px solid #ccc;">Receiver's City</th>
                        <th style="border:1px solid #ccc;">Sent On</th>
                        <th style="border:1px solid #ccc;">Tracking Code</th>
                        <th style="border:1px solid #ccc;">Package Status</th>
                    </tr>
                    <% if(pkList != null && pkStat != null){ for(int k = 0; k < pkList.size(); k++){ %>
                    <tr>
                        <td style="border:1px solid #ccc; padding:5px;"><%= user.getName() %></td>
                        <td style="border:1px solid #ccc; padding:5px;"><%= pkList.get(k).getPackageName() %></td>
                        <td style="border:1px solid #ccc; padding:5px;"><%= pkList.get(k).getPackageReciever()  %></td>
                        <td style="border:1px solid #ccc; padding:5px;"><%= pkList.get(k).getPkrecieverAddress()  %></td>
                        <td style="border:1px solid #ccc; padding:5px;"><%= pkList.get(k).getPkrecieverCity()  %></td>
                        <td style="border:1px solid #ccc; padding:5px;"><%= pkList.get(k).getPkdateSent() %></td>
                     
                        <td style="border:1px solid #ccc; padding:5px;"><%= pkTran.get(k).getTrackingCode()  %></td>
                        <td style="border:1px solid #ccc; padding:5px;"><%= pkStat.get(k).getStatus() %></td>
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