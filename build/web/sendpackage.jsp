<%-- 
    Document   : sendpackage
    Created on : Nov 9, 2013, 8:43:08 PM
    Author     : samuelbond
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*,model.Destinations,model.Addresses"%>
<%@page import="model.Users"%>

<%@ include file="Uheader.jsp" %>

<div class="container">

    <div class="row">

        <div class="two-thirds column">
            <br />
            
             <%
            @SuppressWarnings("unchecked") 
            Users user = (Users)request.getAttribute("user");
            List<Destinations> desList = (List<Destinations>) request.getAttribute("destination");
            List<Addresses> adrList = (List<Addresses>) request.getAttribute("address");
            String action = (String) request.getAttribute("action");
            String msg = (String) request.getAttribute("msg");
            String track = (String) request.getAttribute("trackcode");
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
    <h4>Your Package has been sent with tracking number <%= track %></h4>
    <%= action %>
    </div>    
             </c:if>
            <div style="width:800px; margin-left:50px;">
                <form name="admin_upd" class="form-inline" method="post" action="account">
                    <p>
                    <legend>Ship Package</legend>
                    <label>Your Name</label><br />
                    <input type="text" name="fname" class="input-lg" value="<%= user.getName() %>" readonly="readonly" style="width:400px; height:35px;" required="required" />
                    </p>
                    <p>
                    <label>Select an Address</label><br />
                    <select name="sender_address">
                        <% for(Addresses adr: adrList){
                        %>
                        <option value="<%= adr.getId() %>"><%= adr.getCity()+", "+adr.getAddress() %></option>
                        <%
                        }
                        %>
                    </select>
                    </p>
                    <p>
                    <label>Name of Package</label><br />
                    <input type="text" name="pk_name" placeholder="Offical Letter" style="width:400px; height:35px;" required="required" />
                    </p>
                    <label>Description of package contents</label><br />
                    <textarea name="pk_desc" placeholder="Full Description of package's content"  style="width:400px;" required="required"></textarea>
                    <br />
                    <label>Receiver's Name </label><br />
                    <input type="text" name="pk_rec" placeholder="John Doe" style="width:400px; height:35px;" required="required" />
                    <br />
                    <label>Receiver's Phone</label><br />
                    <input type="text" name="pk_phone" placeholder="0786567734" style="width:400px; height:35px;" required="required" />
                    <br />
                    <label>Receiver's Address</label><br />
                    <input type="text" name="pk_addr" placeholder="13 Baker Street" style="width:400px; height:35px;" required="required" />
                    <br />
                    <label>Receiver's City</label><br />
                    <input type="text" name="pk_city" placeholder="London" style="width:400px; height:35px;" required="required" />
                    <br />
                    <label>Receiver's Country</label><br />
                    <select name="pk_country">
                         <%
                for (Destinations des : desList) { %>
                <option value="<%= des.getDtId() %>"> <%= des.getDtName() %> </option> <%
                }
             %>
                    </select>
                    <br />
                    <input type="hidden" name="sendpackage" value="true" />
                    <input type="hidden" name="userid" value="<%= user.getEmail() %>" />
                    <button type="submit" class="btn">Send</button>
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